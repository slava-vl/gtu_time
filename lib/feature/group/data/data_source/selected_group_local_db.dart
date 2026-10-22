import 'package:gtu_time/feature/group/domain/entity/group.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ISelectedGroupLocalDB {
  Group? read();
  String? readSub();
  Future<void> change(Group newValue);
  Future<void> changeSub(String? newValue);
}

const String _selectedGroupKey = 'selected_group_key';
const String _selectedSubgroupKey = 'selected_subgroup_key';

@LazySingleton(as: ISelectedGroupLocalDB)
final class SelectedGroupLocalDB implements ISelectedGroupLocalDB {
  final SharedPreferences _preferences;
  const SelectedGroupLocalDB(this._preferences);

  @override
  Future<void> change(Group newValue) => _preferences.setString(_selectedGroupKey, newValue.toJson());

  @override
  Future<void> changeSub(String? newValue) => newValue == null
      ? _preferences.remove(_selectedSubgroupKey)
      : _preferences.setString(_selectedSubgroupKey, newValue);

  @override
  Group? read() {
    final res = _preferences.getString(_selectedGroupKey);
    if (res == null) return null;
    return Group.fromJson(res);
  }

  @override
  String? readSub() => _preferences.getString(_selectedSubgroupKey);
}
