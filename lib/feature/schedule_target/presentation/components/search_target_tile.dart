import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/ui_kit/src/primary_checkbox.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/group.dart';
import 'package:gtu_time/feature/schedule_target/domain/entity/teacher.dart';
import 'package:shimmer/shimmer.dart';

abstract class SearchTargetTile extends StatelessWidget {
  const SearchTargetTile({super.key});

  factory SearchTargetTile.loading() => _LoadingTile();
  factory SearchTargetTile.group({required Group group, required bool isSelected, required VoidCallback onTap}) =>
      _GroupTile(group, onTap, isSelected: isSelected);
  factory SearchTargetTile.teacher({required Teacher teacher, required bool isSelected, required VoidCallback onTap}) =>
      _TeacherTile(teacher, onTap, isSelected: isSelected);
}

class _GroupTile extends SearchTargetTile {
  final Group group;
  final bool isSelected;
  final VoidCallback onTap;
  const _GroupTile(this.group, this.onTap, {required this.isSelected});

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
                        group.number,
                        style: context.theme.textStyles.ag35.copyWith(color: context.theme.colorsPalette.text.primary),
                      ),
                      Text(
                        group.faculty,
                        style: context.theme.textStyles.ag23.copyWith(color: context.theme.colorsPalette.text.primary),
                      ),
                      Text(
                        '${group.level.localize(context)} · ${group.language}',
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

class _TeacherTile extends SearchTargetTile {
  final Teacher teacher;
  final bool isSelected;
  final VoidCallback onTap;
  const _TeacherTile(this.teacher, this.onTap, {required this.isSelected});

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
                        teacher.localizedNameOf(context),
                        style: context.theme.textStyles.ag35.copyWith(color: context.theme.colorsPalette.text.primary),
                      ),
                      if (teacher.programs.isNotEmpty)
                        Text(
                          teacher.programs.join(', '),
                          style: context.theme.textStyles.ag23.copyWith(
                            color: context.theme.colorsPalette.text.primary,
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

class _LoadingTile extends SearchTargetTile {
  const _LoadingTile();

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
