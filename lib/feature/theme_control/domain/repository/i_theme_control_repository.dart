import 'package:flutter/foundation.dart' show immutable;
import 'package:gtu_time/feature/theme_control/domain/entity/current_theme.dart';

@immutable
abstract interface class IThemeControlRepository {
  CurrentTheme? getTheme();
  Future<void> saveTheme(CurrentTheme? themeMode);
}
