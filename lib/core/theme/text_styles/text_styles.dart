import 'package:flutter/material.dart';
import 'package:gtu_time/core/resources/fonts.gen.dart';

class TextStyles {
  static final TextStyles _instance = TextStyles._();
  factory TextStyles() => _instance;
  TextStyles._();

  /// Product-level statements
  /// Display: 32 / 700, Line Height: 40, Tracking: -0.6
  late final TextStyle display = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 40 / 32,
    letterSpacing: -0.6,
  );

  /// Screen titles
  /// H1: 28 / 700, Line Height: 34, Tracking: -0.4
  late final TextStyle h1 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 34 / 28,
    letterSpacing: -0.4,
  );

  /// Group identity and section titles
  /// H2: 24 / 600, Line Height: 30, Tracking: -0.3
  late final TextStyle h2 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 30 / 24,
    letterSpacing: -0.3,
  );

  /// Overlay and empty-state titles
  /// H3: 20 / 600, Line Height: 26, Tracking: -0.2
  late final TextStyle h3 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 26 / 20,
    letterSpacing: -0.2,
  );

  /// Supporting headings
  /// H4: 18 / 600, Line Height: 24, Tracking: 0
  late final TextStyle h4 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
    letterSpacing: 0,
  );

  /// Introductory explanations
  /// Body Large: 16 / 400, Line Height: 24, Tracking: 0
  late final TextStyle bodyLarge = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    letterSpacing: 0,
  );

  /// Standard interface copy
  /// Body: 14 / 400, Line Height: 20, Tracking: 0
  late final TextStyle body = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    letterSpacing: 0,
  );

  /// Selected values and key labels
  /// Body Emphasis: 14 / 500, Line Height: 20, Tracking: 0
  late final TextStyle bodyEmphasis = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
    letterSpacing: 0,
  );

  /// Control and short section labels
  /// Label: 12 / 500, Line Height: 16, Tracking: 0.1
  late final TextStyle label = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    letterSpacing: 0.1,
  );

  /// Secondary explanations
  /// Caption: 12 / 400, Line Height: 17, Tracking: 0
  late final TextStyle caption = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 17 / 12,
    letterSpacing: 0,
  );

  /// Room, building, instructor
  /// Small Metadata: 11 / 400, Line Height: 15, Tracking: 0
  late final TextStyle smallMetadata = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 15 / 11,
    letterSpacing: 0,
  );

  /// Timetable time column
  /// Schedule Time: 13 / 500, Line Height: 18, Tracking: 0
  late final TextStyle scheduleTime = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 18 / 13,
    letterSpacing: 0,
  );

  /// Action labels
  /// Button: 14 / 600, Line Height: 20, Tracking: 0
  late final TextStyle button = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0,
  );

  late final TextStyle ag16 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 18,
    fontWeight: FontWeight.w800,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag17 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag18 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag21 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag22 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag23 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag24 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag26 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag27 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag28 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag29 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag30 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag31 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag34 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag35 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.4,
    letterSpacing: 0,
  );
  late final TextStyle ag36 = const TextStyle(
    fontFamily: FontFamily.inter,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
  );
}
