import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/l10n/app_localizations.g.dart';
import 'package:gtu_time/core/router/app_router.dart';
import 'package:gtu_time/core/services/service_locator/service_locator.dart';
import 'package:gtu_time/core/theme/app_theme.dart';
import 'package:gtu_time/feature/group/presentation/selected_group_scope.dart';
import 'package:gtu_time/feature/localization_control/presentation/localization_scope.dart';
import 'package:gtu_time/feature/schedule/presentation/schedule_main_scope.dart';
import 'package:gtu_time/feature/theme_control/presentation/theme_control_scope.dart';
import 'package:nested/nested.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Nested(
      children: const [LocalizationScope(), ThemeControlScope(), ScheduleMainScope(), SelectedGroupScope()],
      child: _MaterialApp(),
    );
  }
}

class _MaterialApp extends StatefulWidget {
  const _MaterialApp();

  @override
  State<_MaterialApp> createState() => _MaterialAppState();
}

class _MaterialAppState extends State<_MaterialApp> {
  final GoRouter _router = getIt<AppRouter>().router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeControlScope.themeOf(context),
      locale: LocalizationScope.localeOf(context),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
