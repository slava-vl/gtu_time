import 'dart:async';

import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/feature/schedule/data/data_source/schedule_api.dart';
import 'package:gtu_time/feature/schedule/data/data_source/schedule_local_db.dart';
import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';
import 'package:gtu_time/feature/schedule/domain/repository/i_schedule_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable(as: IScheduleRepository)
final class ScheduleRepository implements IScheduleRepository {
  final ScheduleApi _api;
  final IScheduleLocalDb _localDB;
  late final BehaviorSubject<ScheduleResponse?> _scheduleSubject;
  late final BehaviorSubject<DateTime?> _lastUpdateSubject;

  Future<void>? _updateFuture;
  final String group;

  ScheduleRepository(this._api, this._localDB, this.group);

  Future<void> init() async {
    final (schedule, lastUpdate) = (await _localDB.read()) ?? (null, null);
    _scheduleSubject = BehaviorSubject<ScheduleResponse?>.seeded(schedule);
    _lastUpdateSubject = BehaviorSubject<DateTime?>.seeded(lastUpdate);
    if (lastUpdate == null) return;
    final diff = DateTime.now().dateOnly.difference(lastUpdate.dateOnly).inSeconds;
    if (diff > 0) {
      unawaited(updateSchedule());
    }
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
    final res = await _api.getGroupSchedule(group);
    final date = DateTime.now();

    _scheduleSubject.add(res);
    _lastUpdateSubject.add(date);
    await _localDB.save(res, date);
  }
}
