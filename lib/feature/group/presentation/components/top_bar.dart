import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/theme/radiuses.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.theme.spacings.s12,
      children: [
        if (context.canPop())
          InkResponse(
            onTap: context.pop,
            child: Icon(Icons.arrow_back_ios_new_rounded, color: context.theme.colorsPalette.text.primary),
          ),
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: context.theme.colorsPalette.brand.primary,
            borderRadius: context.theme.radiuses.s16.circular,
          ),
          alignment: Alignment.center,
          child: Text(
            'GTU',
            style: context.theme.textStyles.ag16.copyWith(color: context.theme.colorsPalette.text.onPrimary),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.gtu_timetable,
                style: context.theme.textStyles.ag17.copyWith(color: context.theme.colorsPalette.text.primary),
              ),
              Text(
                context.l10n.your_academic_day_in_focus,
                style: context.theme.textStyles.ag18.copyWith(color: context.theme.colorsPalette.text.secondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
