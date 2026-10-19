import 'package:flutter/material.dart';
import 'package:gtu_time/core/resources/fonts.gen.dart';
import 'package:gtu_time/core/theme/theme_extension.dart';

abstract class AppTheme {
  static ThemeData get lightThemeData => lightTheme;
  static ThemeData get darkThemeData => darkTheme;

  static AppThemeExtension themeExtension(BuildContext context) => Theme.of(context).extension<AppThemeExtension>()!;
}

final lightTheme = _getTheme(AppThemeExtension.light(), ThemeData.light());
final darkTheme = _getTheme(AppThemeExtension.dark(), ThemeData.light(), isDark: true);

ThemeData _getTheme(AppThemeExtension themeExtention, ThemeData baseTheme, {bool isDark = false}) {
  final baseTheme = ThemeData(
    useMaterial3: true,
    extensions: [themeExtention],
    fontFamily: FontFamily.inter,
    scaffoldBackgroundColor: themeExtention.colorsPalette.background.base,
    canvasColor: themeExtention.colorsPalette.background.base,
    colorScheme: ColorScheme.fromSeed(
      seedColor: themeExtention.colorsPalette.brand.primary,
      brightness: isDark ? Brightness.dark : Brightness.light,
      surface: themeExtention.colorsPalette.surfaces.primary,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: themeExtention.colorsPalette.brand.primary),
  );

  return baseTheme.copyWith(textTheme: baseTheme.textTheme.apply(fontFamily: FontFamily.inter));
}
