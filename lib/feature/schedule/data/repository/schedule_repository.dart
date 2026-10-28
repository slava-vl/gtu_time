import 'dart:async';

import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/feature/schedule/data/data_source/schedule_api.dart';
import 'package:gtu_time/feature/schedule/data/data_source/schedule_local_db.dart';
import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';
import 'package:gtu_time/feature/schedule/domain/repository/i_schedule_repository.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/schedule_target.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IScheduleRepository)
final class ScheduleRepository implements IScheduleRepository {
  final ScheduleApi _api;
  final IScheduleLocalDb _localDB;

  const ScheduleRepository(this._api, this._localDB);

  @override
  Future<(ScheduleResponse, DateTime)> fetchSchedule(ScheduleTarget target) async {
    final (schedule, lastUpdate) = await _localDB.read(target.key) ?? (null, null);

    if (lastUpdate == null || schedule == null) return updateSchedule(target);

    final diff = DateTime.now().dateOnly.difference(lastUpdate.dateOnly).inSeconds;
    if (diff > 0) return updateSchedule(target);

    return (schedule, lastUpdate);
  }

  @override
  Future<(ScheduleResponse, DateTime)> updateSchedule(ScheduleTarget target) async {
    final schedule = target.type == .group
        ? await _api.getGroupSchedule(target.key)
        : await _api.getTeacherSchedule(target.key);

    final now = DateTime.now();
    await _localDB.save(target.key, schedule, now);
    return (schedule, now);
  }
}
