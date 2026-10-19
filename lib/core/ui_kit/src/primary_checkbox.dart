import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';

class PrimaryCheckbox extends StatelessWidget {
  final bool isSelected;
  final double dimension;
  const PrimaryCheckbox({required this.isSelected, this.dimension = 22, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Assets.icons.circleCheck22.svg(
        width: dimension,
        height: dimension,
        colorFilter: context.theme.colorsPalette.brand.primary.filter,
      ),
      secondChild: Assets.icons.circle22.svg(
        width: dimension,
        height: dimension,
        colorFilter: context.theme.colorsPalette.bordersAndLights.strong.filter,
      ),
      crossFadeState: isSelected ? .showFirst : .showSecond,
      duration: kThemeAnimationDuration,
    );
  }
}
