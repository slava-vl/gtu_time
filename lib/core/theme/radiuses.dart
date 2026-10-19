import 'package:flutter/material.dart';

class Radiuses {
  double get s4 => 4;

  /// Radius: small
  double get s8 => 8;

  /// Radius: medium
  double get s12 => 12;

  double get s14 => 14;

  /// Radius: large
  double get s16 => 16;

  double get s18 => 18;

  /// Radius: xlarge
  double get s24 => 24;

  /// Radius: pill
  double get s999 => 999;

  static const Radiuses _instance = Radiuses._();
  factory Radiuses() => _instance;
  const Radiuses._();
}

extension CircularBorderRadius on double {
  BorderRadius get circular => BorderRadius.circular(this);
}
