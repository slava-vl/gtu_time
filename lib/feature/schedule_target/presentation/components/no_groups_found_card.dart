import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';

class NoGroupsFoundCard extends StatelessWidget {
  final TextEditingController searchController;
  const NoGroupsFoundCard({required this.searchController, super.key});

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
              color: context.theme.colorsPalette.brand.selection,
              borderRadius: context.theme.radiuses.s18.circular,
            ),
            alignment: .center,
            child: Assets.icons.searchX28.svg(colorFilter: context.theme.colorsPalette.brand.primary.filter),
          ),
          Text(
            context.l10n.no_groups_found,
            style: context.theme.textStyles.ag21.copyWith(color: context.theme.colorsPalette.text.primary),
          ),
          Text(
            context.l10n.no_groups_match_query(searchController.text),
            style: context.theme.textStyles.ag23.copyWith(color: context.theme.colorsPalette.text.secondary),
          ),
          PrimaryButton(
            onTap: searchController.clear,
            title: context.l10n.clear_query,
            alignment: .center,
            type: .secondary,
          ),
        ],
      ),
    );
  }
}
