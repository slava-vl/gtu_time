import 'package:flutter/material.dart';
import 'package:gtu_time/core/error/error_handler.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';

class ErrorCard extends StatelessWidget {
  final IErrorHandler error;
  final List<Widget> Function(BuildContext context) actionsBuilder;
  const ErrorCard({required this.error, required this.actionsBuilder, super.key});

  static void show(
    BuildContext context, {
    required IErrorHandler error,
    required List<Widget> Function(BuildContext context) actionsBuilder,
  }) => PrimaryBottomSheet.show(
    context: context,
    builder: (context) => Padding(
      padding: .only(
        top: context.theme.spacings.s16,
        left: context.theme.spacings.s16,
        right: context.theme.spacings.s16,
        bottom: context.theme.spacings.s16 + MediaQuery.paddingOf(context).bottom,
      ),
      child: _ErrorCardBody(error: error, actionsBuilder: actionsBuilder, crossAxisAlignment: .center),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorsPalette.surfaces.glassStrong,
        borderRadius: context.theme.radiuses.s16.circular,
        border: .all(color: context.theme.colorsPalette.bordersAndLights.defaultColor),
      ),
      padding: .all(context.theme.spacings.s24),
      child: _ErrorCardBody(error: error, actionsBuilder: actionsBuilder),
    );
  }
}

class _ErrorCardBody extends StatelessWidget {
  const _ErrorCardBody({required this.error, required this.actionsBuilder, this.crossAxisAlignment = .start});

  final IErrorHandler error;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> Function(BuildContext context) actionsBuilder;

  @override
  Widget build(BuildContext context) {
    final textAlign = crossAxisAlignment == .start ? TextAlign.start : TextAlign.center;
    return Column(
      spacing: context.theme.spacings.s16,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: .min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: context.theme.colorsPalette.surfaces.secondary,
            borderRadius: context.theme.radiuses.s18.circular,
          ),
          alignment: .center,
          child: error.iconFromError().svg(colorFilter: context.theme.colorsPalette.status.error.filter),
        ),
        Text(
          error.messageFromError(context),
          style: context.theme.textStyles.ag21.copyWith(color: context.theme.colorsPalette.text.primary),
          textAlign: textAlign,
        ),
        Text(
          error.descriptionFromError(context),
          style: context.theme.textStyles.ag23.copyWith(color: context.theme.colorsPalette.text.secondary),
          textAlign: textAlign,
        ),
        ...actionsBuilder(context),
      ],
    );
  }
}
