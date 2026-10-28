import 'package:gtu_time/feature/schedule_target/domain/entity/schedule_target.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ISelectedTargetsLocalDB {
  List<ScheduleTarget> read();
  Future<void> save(List<ScheduleTarget> targets);
  int? readIndex();
  Future<void> saveIndex(int? index);
}

const String _scheduleTargetsKey = 'schedule_targets_key';
const String _selectedIndexKey = 'selected_target_index_key';

@LazySingleton(as: ISelectedTargetsLocalDB)
final class SelectedTargetsLocalDB implements ISelectedTargetsLocalDB {
  final SharedPreferences _preferences;
  const SelectedTargetsLocalDB(this._preferences);

  @override
  List<ScheduleTarget> read() {
    final jsonList = _preferences.getStringList(_scheduleTargetsKey);
    if (jsonList == null || jsonList.isEmpty) {
      return [];
    }
    return jsonList.map(ScheduleTarget.fromJson).toList();
  }

  @override
  Future<void> save(List<ScheduleTarget> targets) {
    final jsonList = targets.map((e) => e.toJson()).toList();
    return _preferences.setStringList(_scheduleTargetsKey, jsonList);
  }

  @override
  int? readIndex() => _preferences.getInt(_selectedIndexKey);

  @override
  Future<void> saveIndex(int? index) =>
      index == null ? _preferences.remove(_selectedIndexKey) : _preferences.setInt(_selectedIndexKey, index);
}
