import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/ui_kit/src/primary_checkbox.dart';
import 'package:shimmer/shimmer.dart';

abstract class GroupTile extends StatelessWidget {
  const GroupTile({super.key});

  factory GroupTile.loading() => _LoadingGroupTile();
  factory GroupTile.value({required String group, required bool isSelected, required VoidCallback onTap}) =>
      _ValueGroupTile(group, onTap, isSelected: isSelected);
}

class _ValueGroupTile extends GroupTile {
  final String group;
  final bool isSelected;
  final VoidCallback onTap;
  const _ValueGroupTile(this.group, this.onTap, {required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      decoration: BoxDecoration(
        borderRadius: context.theme.radiuses.s16.circular,
        border: Border.all(
          color: isSelected
              ? context.theme.colorsPalette.brand.primary
              : context.theme.colorsPalette.bordersAndLights.defaultColor,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(0, 2),
            color: context.theme.colorsPalette.bordersAndLights.shadow.withAlpha(10),
          ),
        ],
      ),
      child: Material(
        color: isSelected
            ? context.theme.colorsPalette.surfaces.selected
            : context.theme.colorsPalette.surfaces.glassStrong,
        borderRadius: context.theme.radiuses.s16.circular,
        child: InkWell(
          onTap: onTap,
          borderRadius: context.theme.radiuses.s16.circular,
          child: Padding(
            padding: .all(context.theme.spacings.s16),
            child: Row(
              spacing: context.theme.spacings.s12,
              children: [
                Expanded(
                  child: Column(
                    spacing: context.theme.spacings.s2,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        group,
                        style: context.theme.textStyles.ag35.copyWith(color: context.theme.colorsPalette.text.primary),
                      ),
                      Text(
                        context.l10n.computer_science,
                        style: context.theme.textStyles.ag23.copyWith(color: context.theme.colorsPalette.text.primary),
                      ),
                      Text(
                        'Bachelor · Year 3 · English',
                        style: context.theme.textStyles.ag18.copyWith(
                          color: context.theme.colorsPalette.text.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                PrimaryCheckbox(isSelected: isSelected),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingGroupTile extends GroupTile {
  const _LoadingGroupTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(context.theme.spacings.s16),
      decoration: BoxDecoration(
        color: context.theme.colorsPalette.surfaces.glassStrong,
        borderRadius: context.theme.radiuses.s16.circular,
        border: Border.all(color: context.theme.colorsPalette.bordersAndLights.defaultColor),
        boxShadow: [
          BoxShadow(
            color: context.theme.colorsPalette.bordersAndLights.shadow.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: context.theme.colorsPalette.surfaces.secondary,
        highlightColor: context.theme.colorsPalette.surfaces.glassStrong,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              height: 16,
              width: 80,
              decoration: BoxDecoration(
                color: context.theme.colorsPalette.surfaces.secondary,
                borderRadius: context.theme.radiuses.s4.circular,
              ),
            ),
            SizedBox(height: context.theme.spacings.s10),
            Container(
              height: 12,
              width: 220,
              decoration: BoxDecoration(
                color: context.theme.colorsPalette.surfaces.secondary,
                borderRadius: context.theme.radiuses.s4.circular,
              ),
            ),
            SizedBox(height: context.theme.spacings.s10),
            Container(
              height: 10,
              width: 150,
              decoration: BoxDecoration(
                color: context.theme.colorsPalette.surfaces.secondary,
                borderRadius: context.theme.radiuses.s4.circular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
