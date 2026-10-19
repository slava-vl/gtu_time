import 'package:flutter/material.dart';

enum CurrentTheme {
  light,
  dark;

  ThemeMode get themeMode => this == CurrentTheme.light ? ThemeMode.light : ThemeMode.dark;

  static CurrentTheme? fromString(String? theme) {
    if (theme == CurrentTheme.light.name) {
      return CurrentTheme.light;
    }
    if (theme == CurrentTheme.dark.name) {
      return CurrentTheme.dark;
    }
    return null;
  }
}
