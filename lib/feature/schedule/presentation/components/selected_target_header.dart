import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/router/routes_enum.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';
import 'package:gtu_time/feature/schedule/presentation/components/choose_group_bottom_sheet.dart';
import 'package:gtu_time/feature/schedule_target/presentation/selected_targets_scope.dart';
import 'package:gtu_time/feature/settings/presentation/settings_bottom_sheet.dart';

class SelectedTargetHeader extends StatelessWidget {
  const SelectedTargetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final target = SelectedTargetsScope.targetOf(context, listen: true);
    return Row(
      spacing: context.theme.spacings.s12,
      children: [
        Expanded(
          child: GestureDetector(
            behavior: .translucent,
            onTap: () async {
              final res = await ChooseGroupBottomSheet.show(context);
              if (res == null || !context.mounted) return;
              if (res == -1) {
                unawaited(context.push(CommonRoutes.scheduleTarget.path));
                return;
              }
              SelectedTargetsScope.changeIndex(context, index: res);
            },
            child: Padding(
              padding: .symmetric(vertical: context.theme.spacings.s4),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    spacing: context.theme.spacings.s2,
                    children: [
                      Flexible(
                        child: Text(
                          target?.title(context) ?? '-',
                          style: context.theme.textStyles.ag27.copyWith(
                            color: context.theme.colorsPalette.text.primary,
                          ),
                        ),
                      ),
                      Assets.icons.chevronRight20.svg(colorFilter: context.theme.colorsPalette.brand.primary.filter),
                    ],
                  ),
                  Text(
                    target?.subtitle(context) ?? '-',
                    style: context.theme.textStyles.ag28.copyWith(color: context.theme.colorsPalette.text.secondary),
                  ),
                ],
              ),
            ),
          ),
        ),
        PrimaryButton(
          onTap: () => SettingsBottomSheet.show(context),
          outerPadding: .all(context.theme.spacings.s12),
          type: .secondary,
          leftIcon: Assets.icons.settings20.svg(colorFilter: context.theme.colorsPalette.text.primary.filter),
        ),
      ],
    );
  }
}
