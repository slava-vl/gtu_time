import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/theme/radiuses.dart';

class ChooseListItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final VoidCallback? onDeleteTap;
  const ChooseListItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.onDeleteTap,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? context.theme.colorsPalette.surfaces.selected
          : context.theme.colorsPalette.surfaces.selected.withAlpha(0),
      shape: RoundedRectangleBorder(borderRadius: context.theme.radiuses.s12.circular),
      child: InkWell(
        borderRadius: context.theme.radiuses.s12.circular,
        onTap: onTap,
        child: Padding(
          padding: .symmetric(vertical: context.theme.spacings.s14, horizontal: context.theme.spacings.s12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      title,
                      style: context.theme.textStyles.ag22.copyWith(color: context.theme.colorsPalette.text.primary),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: context.theme.textStyles.ag18.copyWith(color: context.theme.colorsPalette.text.secondary),
                      ),
                  ],
                ),
              ),
              if (onDeleteTap != null)
                InkResponse(
                  onTap: onDeleteTap,
                  child: Assets.icons.x20.svg(
                    width: context.theme.spacings.s20,
                    height: context.theme.spacings.s20,
                    colorFilter: context.theme.colorsPalette.brand.primary.filter,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
