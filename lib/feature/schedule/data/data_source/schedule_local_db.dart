import 'dart:async';

import 'package:gtu_time/feature/schedule/domain/entity/schedule_response.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _scheduleBoxName = 'scheduleBox';
const String _scheduleKey = 'schedule';
const String _scheduleLastUpdateKey = 'scheduleLastUpdate';

abstract interface class IScheduleLocalDb {
  Future<void> save(String keyPrefix, ScheduleResponse newSchedule, DateTime lastUpdate);
  Future<(ScheduleResponse, DateTime)?> read(String keyPrefix);
}

@Injectable(as: IScheduleLocalDb)
class ScheduleLocalDb implements IScheduleLocalDb {
  final SharedPreferences _sharedPreferences;
  const ScheduleLocalDb(this._sharedPreferences);

  @override
  Future<void> save(String keyPrefix, ScheduleResponse newSchedule, DateTime lastUpdate) async {
    final box = await Hive.openBox<ScheduleResponse>(_scheduleBoxName);
    await box.put('${keyPrefix}_$_scheduleKey', newSchedule);
    unawaited(box.close());
    await _sharedPreferences.setInt('${keyPrefix}_$_scheduleLastUpdateKey', lastUpdate.millisecondsSinceEpoch);
  }

  @override
  Future<(ScheduleResponse, DateTime)?> read(String keyPrefix) async {
    final lastUpdate = _sharedPreferences.getInt('${keyPrefix}_$_scheduleLastUpdateKey');
    if (lastUpdate == null) return null;

    final lastUpdateDate = DateTime.fromMillisecondsSinceEpoch(lastUpdate);

    final box = await Hive.openBox<ScheduleResponse>(_scheduleBoxName);
    final value = box.get('${keyPrefix}_$_scheduleKey');
    unawaited(box.close());

    return value != null ? (value, lastUpdateDate) : null;
  }
}
