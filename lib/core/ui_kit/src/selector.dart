import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/theme/radiuses.dart';

class Selector extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isDisabled;
  const new({required this.title, required this.onTap, required this.isDisabled, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.colorsPalette.surfaces.glassStrong,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.theme.colorsPalette.bordersAndLights.defaultColor),
        borderRadius: context.theme.radiuses.s12.circular,
      ),
      child: InkWell(
        borderRadius: context.theme.radiuses.s12.circular,
        hoverColor: context.theme.colorsPalette.interactive.pressed,
        highlightColor: context.theme.colorsPalette.interactive.pressed,
        onTap: isDisabled ? null : onTap,
        child: Padding(
          padding: .all(context.theme.spacings.s12),
          child: Row(
            spacing: context.theme.spacings.s12,
            mainAxisSize: .min,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: context.theme.textStyles.ag22.copyWith(
                    color: isDisabled
                        ? context.theme.colorsPalette.text.disabled
                        : context.theme.colorsPalette.text.primary,
                  ),
                ),
              ),
              Assets.icons.chevronDown18.svg(
                width: context.theme.spacings.s16,
                height: context.theme.spacings.s16,
                colorFilter: context.theme.colorsPalette.text.secondary.filter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
