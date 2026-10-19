import 'package:flutter/widgets.dart';
import 'package:gtu_time/core/error/error_handler.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';

extension ErrorExtension on IErrorHandler {
  String messageFromError(BuildContext context) => when(
    timeout: (_) => context.l10n.error_timeout_message,
    dio: (_) => context.l10n.error_dio_message,
    connection: () => context.l10n.error_timeout_message,
    unknown: (_) => context.l10n.error_dio_message,
    apiError: (_) => context.l10n.error_dio_message,
  );

  String descriptionFromError(BuildContext context) => when(
    timeout: (_) => context.l10n.error_timeout_description,
    dio: (_) => context.l10n.error_unknown_description,
    connection: () => context.l10n.error_timeout_description,
    unknown: (_) => context.l10n.error_unknown_description,
    apiError: (_) => context.l10n.error_unknown_description,
  );

  SvgGenImage iconFromError() {
    return when(
      timeout: (_) => Assets.icons.wifiOff28,
      dio: (_) => Assets.icons.circleAlert28,
      connection: () => Assets.icons.wifiOff28,
      unknown: (_) => Assets.icons.circleAlert28,
      apiError: (_) => Assets.icons.circleAlert28,
    );
  }
}
