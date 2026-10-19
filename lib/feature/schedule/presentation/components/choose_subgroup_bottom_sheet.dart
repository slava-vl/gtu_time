import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/ui_kit/src/primary_bottom_sheet.dart';

class ChooseSubgroupBottomSheet extends StatelessWidget {
  final String? initialSelectedValue;
  final List<String> subgroups;
  const ChooseSubgroupBottomSheet._(this.initialSelectedValue, this.subgroups);

  static Future<String?> show(BuildContext context, {required List<String> subgroups, String? initialSelectedValue}) =>
      PrimaryBottomSheet.show(
        context: context,
        builder: (context) => ChooseSubgroupBottomSheet._(initialSelectedValue, subgroups),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(
        left: context.theme.spacings.s16,
        right: context.theme.spacings.s16,
        top: context.theme.spacings.s10,
        bottom: context.theme.spacings.s16 + MediaQuery.paddingOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        spacing: context.theme.spacings.s10,
        children: [
          Text(
            context.l10n.choose_a_subgroup,
            style: context.theme.textStyles.ag21.copyWith(color: context.theme.colorsPalette.text.primary),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Material(
                color: context.theme.colorsPalette.surfaces.glassStrong,
                shape: RoundedRectangleBorder(
                  borderRadius: context.theme.radiuses.s16.circular,
                  side: BorderSide(color: context.theme.colorsPalette.bordersAndLights.defaultColor),
                ),
                child: Padding(
                  padding: .all(context.theme.spacings.s8),
                  child: Column(
                    spacing: context.theme.spacings.s4,
                    children: [
                      _SubgroupItem(title: '', isSelected: initialSelectedValue == null),
                      ...(subgroups..sort()).map((e) => _SubgroupItem(title: e, isSelected: e == initialSelectedValue)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubgroupItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  const new({required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? context.theme.colorsPalette.surfaces.selected : Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: context.theme.radiuses.s12.circular),
      child: InkWell(
        borderRadius: context.theme.radiuses.s12.circular,
        onTap: () => context.pop(title),
        child: Padding(
          padding: .symmetric(vertical: context.theme.spacings.s14, horizontal: context.theme.spacings.s12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title.isEmpty ? context.l10n.all_subgroups : title,
                  style: context.theme.textStyles.ag22.copyWith(color: context.theme.colorsPalette.text.primary),
                ),
              ),
              if (isSelected)
                Assets.icons.check11.svg(
                  width: context.theme.spacings.s20,
                  height: context.theme.spacings.s20,
                  colorFilter: context.theme.colorsPalette.brand.primary.filter,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
