import 'package:flutter/foundation.dart';
import 'package:gtu_time/feature/theme_control/domain/entity/current_theme.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themeModeKey = 'themeMode';

@immutable
abstract interface class IThemeControlDatasource {
  CurrentTheme? getTheme();
  Future<void> saveTheme(CurrentTheme? themeMode);
}


@immutable
@LazySingleton(as: IThemeControlDatasource)
class ThemeControlDatasource implements IThemeControlDatasource {
  const ThemeControlDatasource({required SharedPreferences sharedPrefsStorage}) : _storage = sharedPrefsStorage;

  final SharedPreferences _storage;

  @override
  CurrentTheme? getTheme() {
    final theme = _storage.getString(_themeModeKey);
    return CurrentTheme.fromString(theme);
  }

  @override
  Future<void> saveTheme(CurrentTheme? themeMode) {
    if (themeMode == null) return _storage.remove(_themeModeKey);

    return _storage.setString(_themeModeKey, themeMode.name);
  }
}
