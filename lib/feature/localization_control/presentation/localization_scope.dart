import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtu_time/core/services/service_locator/service_locator.dart';
import 'package:gtu_time/feature/localization_control/bloc/localization_control_bloc.dart';
import 'package:gtu_time/feature/localization_control/domain/entity/locale_entity.dart';
import 'package:gtu_time/feature/localization_control/domain/repository/i_localization_control_repository.dart';
import 'package:nested/nested.dart';

@immutable
class LocalizationScope extends SingleChildStatelessWidget {
  const LocalizationScope({super.key});

  static Locale localeOf(BuildContext context, {bool listen = true}) =>
      (listen ? context.watch<LocalizationControlBloc>() : context.read<LocalizationControlBloc>())
          .state
          .currentLocalization
          .toLocale;

  static LocaleEntity localeEntityOf(BuildContext context, {bool listen = true}) =>
      (listen ? context.watch<LocalizationControlBloc>() : context.read<LocalizationControlBloc>())
          .state
          .currentLocalization;

  static String localeCode(BuildContext context, {bool listen = true}) =>
      (listen ? context.watch<LocalizationControlBloc>() : context.read<LocalizationControlBloc>())
          .state
          .currentLocalization
          .languageCode;

  static void changeLocale(BuildContext context, {required LocaleEntity locale}) =>
      context.read<LocalizationControlBloc>().add(LocalizationControlEvent.changeLocalization(locale: locale));

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => BlocProvider<LocalizationControlBloc>(
    create: (_) => LocalizationControlBloc(repository: getIt<ILocalizationControlRepository>()),
    child: _SystemLocaleChangeListener(child: child ?? const SizedBox.shrink()),
  );
}

class _SystemLocaleChangeListener extends StatefulWidget {
  const _SystemLocaleChangeListener({required this.child});
  final Widget child;

  @override
  State<_SystemLocaleChangeListener> createState() => _SystemLocaleChangeListenerState();
}

class _SystemLocaleChangeListenerState extends State<_SystemLocaleChangeListener> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    if (locales == null || locales.isEmpty) return;

    final locale = LocaleEntity.supported.firstWhereOrNull((l) => l.languageCode == locales.first.languageCode);
    if (locale == null) return;

    final currentLocale = LocalizationScope.localeEntityOf(context, listen: false);
    if (currentLocale == locale) return;

    LocalizationScope.changeLocale(context, locale: locale);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
