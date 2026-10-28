import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';

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
              physics: const ClampingScrollPhysics(),
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
                      ChooseListItem(
                        title: context.l10n.all_subgroups,
                        isSelected: initialSelectedValue == null,
                        onTap: () => context.pop(''),
                      ),
                      ...(subgroups..sort()).map(
                        (e) => ChooseListItem(
                          title: e,
                          isSelected: e == initialSelectedValue,
                          onTap: () => context.pop(e),
                        ),
                      ),
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
