import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtu_time/core/services/service_locator/service_locator.dart';
import 'package:gtu_time/feature/theme_control/bloc/theme_control_bloc.dart';
import 'package:gtu_time/feature/theme_control/domain/entity/current_theme.dart';
import 'package:gtu_time/feature/theme_control/domain/repository/i_theme_control_repository.dart';
import 'package:nested/nested.dart';

@immutable
class ThemeControlScope extends SingleChildStatelessWidget {
  const ThemeControlScope({super.key});

  static ThemeMode? themeOf(BuildContext context, {bool listen = true}) =>
      (listen ? context.watch<ThemeControlBloc>() : context.read<ThemeControlBloc>()).state.currentTheme?.themeMode;

  static CurrentTheme? currentThemeOf(BuildContext context, {bool listen = true}) =>
      (listen ? context.watch<ThemeControlBloc>() : context.read<ThemeControlBloc>()).state.currentTheme;

  static void changeTheme(BuildContext context, {required CurrentTheme? theme}) =>
      context.read<ThemeControlBloc>().add(ThemeControlEvent.changeTheme(theme));

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => BlocProvider<ThemeControlBloc>(
    create: (_) => ThemeControlBloc(repository: getIt<IThemeControlRepository>()),
    child: child,
  );
}
