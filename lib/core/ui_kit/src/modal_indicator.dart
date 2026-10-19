import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/theme/radiuses.dart';

class ModalIndicator extends StatelessWidget {
  const ModalIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.theme.spacings.s16, bottom: context.theme.spacings.s8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.theme.colorsPalette.interactive.disabled,
          borderRadius: context.theme.radiuses.s24.circular,
        ),
        child: const SizedBox(width: 72, height: 5),
      ),
    );
  }
}
