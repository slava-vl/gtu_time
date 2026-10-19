import 'package:flutter/foundation.dart';
import 'package:gtu_time/feature/theme_control/data/data_source/theme_control_datasource.dart';
import 'package:gtu_time/feature/theme_control/domain/entity/current_theme.dart';
import 'package:gtu_time/feature/theme_control/domain/repository/i_theme_control_repository.dart';
import 'package:injectable/injectable.dart';

@immutable
@LazySingleton(as: IThemeControlRepository)
class ThemeControlRepository implements IThemeControlRepository {
  const ThemeControlRepository({required IThemeControlDatasource themeControlDatasource})
    : _storage = themeControlDatasource;

  final IThemeControlDatasource _storage;

  @override
  CurrentTheme? getTheme() => _storage.getTheme();

  @override
  Future<void> saveTheme(CurrentTheme? themeMode) {
    return _storage.saveTheme(themeMode);
  }
}
