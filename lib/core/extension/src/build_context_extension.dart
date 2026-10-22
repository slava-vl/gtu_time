import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/extension/src/go_router_extension.dart';
import 'package:gtu_time/core/l10n/app_localizations.g.dart';
import 'package:gtu_time/core/theme/app_theme.dart';
import 'package:gtu_time/core/theme/theme_extension.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get themeOf => Theme.of(this);
  AppThemeExtension get theme => AppTheme.themeExtension(this);

  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;

  AppLocalizations get l10n => AppLocalizations.of(this)!;

  /// Pop until the route with the given [path] is reached.
  /// Before use be sure that page exist under current route.
  /// /// Example
  /// ``` dart
  ///  context.popUntil(CommonRoutes.buyPage.path);
  /// ```
  void popUntil<T extends Object?>(String path, [T? result]) => GoRouter.of(this).popUntil(path, result);

  /// Pop until the route with the given [popUntilPath] is reached and push to [pushLocation].
  /// Example
  /// ``` dart
  ///  GoRouter.of(context).popUntil(SettingsScreen.route);
  /// ```
  void popUntilAndPush(String popUntilPath, String pushLocation, {Object? extra}) =>
      GoRouter.of(this).popUntilAndPush(popUntilPath, pushLocation, extra: extra);

  String formatFreePeriod(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    final parts = <String>[];

    if (hours > 0) {
      parts.add(l10n.hours_count(hours));
    }

    if (minutes > 0 || hours == 0) {
      parts.add(l10n.minutes_count(minutes));
    }

    final durationString = parts.join(' ');

    return '${l10n.free_period} · $durationString';
  }
}
