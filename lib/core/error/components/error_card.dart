import 'package:flutter/material.dart';
import 'package:gtu_time/core/error/error_handler.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';

class ErrorCard extends StatelessWidget {
  final IErrorHandler error;
  final VoidCallback onTap;
  const new({required this.error, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorsPalette.surfaces.glassStrong,
        borderRadius: context.theme.radiuses.s16.circular,
        border: .all(color: context.theme.colorsPalette.bordersAndLights.defaultColor),
      ),
      padding: .all(context.theme.spacings.s24),
      child: Column(
        spacing: context.theme.spacings.s16,
        crossAxisAlignment: .start,
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
          ),
          Text(
            error.descriptionFromError(context),
            style: context.theme.textStyles.ag23.copyWith(color: context.theme.colorsPalette.text.secondary),
          ),
          PrimaryButton(onTap: onTap, title: context.l10n.try_again, alignment: .center),
        ],
      ),
    );
  }
}
