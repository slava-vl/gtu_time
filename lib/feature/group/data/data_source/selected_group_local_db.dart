import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ISelectedGroupLocalDB {
  String? read();
  String? readSub();
  Future<void> change(String newValue);
  Future<void> changeSub(String? newValue);
}

const String _selectedGroupKey = 'selected_group_key';
const String _selectedSubgroupKey = 'selected_subgroup_key';

@LazySingleton(as: ISelectedGroupLocalDB)
final class SelectedGroupLocalDB implements ISelectedGroupLocalDB {
  final SharedPreferences _preferences;
  const SelectedGroupLocalDB(this._preferences);

  @override
  Future<void> change(String newValue) => _preferences.setString(_selectedGroupKey, newValue);

  @override
  Future<void> changeSub(String? newValue) => newValue == null
      ? _preferences.remove(_selectedSubgroupKey)
      : _preferences.setString(_selectedSubgroupKey, newValue);

  @override
  String? read() => _preferences.getString(_selectedGroupKey);

  @override
  String? readSub() => _preferences.getString(_selectedSubgroupKey);
}
