import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/feature/schedule/data/data_source/schedule_api.dart';
import 'package:gtu_time/feature/schedule/data/data_source/schedule_local_db.dart';
import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';
import 'package:gtu_time/feature/schedule/domain/repository/i_schedule_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: IScheduleRepository)
final class ScheduleRepository implements IScheduleRepository {
  final ScheduleApi _api;
  final IScheduleLocalDb _localDB;
  final BehaviorSubject<ScheduleResponse?> _scheduleSubject;
  final BehaviorSubject<DateTime?> _lastUpdateSubject;

  Future<void>? _updateFuture;

  ScheduleRepository._(this._api, this._localDB, {ScheduleResponse? schedule, DateTime? lastUpdate})
    : _scheduleSubject = BehaviorSubject<ScheduleResponse?>.seeded(schedule),
      _lastUpdateSubject = BehaviorSubject<DateTime?>.seeded(lastUpdate) {
    if (lastUpdate == null) return;
    final diff = DateTime.now().dateOnly.difference(lastUpdate.dateOnly).inSeconds;
    if (diff > 0) {
      updateSchedule();
    }
  }

  @FactoryMethod(preResolve: true)
  static Future<ScheduleRepository> init(ScheduleApi api, IScheduleLocalDb localDB) async {
    final (schedule, lastUpdate) = (await localDB.read()) ?? (null, null);

    return ScheduleRepository._(api, localDB, schedule: schedule, lastUpdate: lastUpdate);
  }

  @override
  Stream<ScheduleResponse?> get scheduleStream => _scheduleSubject.stream;

  @override
  ScheduleResponse? get schedule => _scheduleSubject.value;

  @override
  Stream<DateTime?> get lastUpdateStream => _lastUpdateSubject.stream;

  @override
  DateTime? get lastUpdate => _lastUpdateSubject.value;

  @override
  Future<void> updateSchedule() => _updateFuture ??= _update().whenComplete(() {
    _updateFuture = null;
  });

  Future<void> _update() async {
    final res = await _api.getSchedule();
    final date = DateTime.now();

    _scheduleSubject.add(res);
    _lastUpdateSubject.add(date);
    await _localDB.save(res, date);
  }
}
