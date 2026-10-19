import 'package:flutter/material.dart';
import 'package:gtu_time/core/theme/colors_palette/colors_palette.dart';
import 'package:gtu_time/core/theme/colors_palette/colors_palette_entity.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/theme/spacings.dart';
import 'package:gtu_time/core/theme/text_styles/text_styles.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final ColorsPalette colorsPalette;
  final TextStyles textStyles;
  final Radiuses radiuses;
  final Spacings spacings;

  AppThemeExtension({required this.colorsPalette})
    : textStyles = TextStyles(),
      radiuses = Radiuses(),
      spacings = Spacings();

  factory AppThemeExtension.light() => AppThemeExtension(colorsPalette: lightColorsPalette);
  factory AppThemeExtension.dark() => AppThemeExtension(colorsPalette: darkColorsPalette);

  @override
  ThemeExtension<AppThemeExtension> copyWith({ColorsPalette? colorsPalette}) =>
      AppThemeExtension(colorsPalette: colorsPalette ?? this.colorsPalette);

  @override
  ThemeExtension<AppThemeExtension> lerp(covariant ThemeExtension<AppThemeExtension>? other, double t) =>
      AppThemeExtension(colorsPalette: colorsPalette);
}
