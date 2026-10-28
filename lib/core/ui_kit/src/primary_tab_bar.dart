import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/theme/radiuses.dart';

class PrimaryTabBarItem<T> extends Equatable {
  final String title;
  final T value;
  final bool isSelected;
  final SvgGenImage? icon;

  const PrimaryTabBarItem({required this.title, required this.value, required this.isSelected, this.icon});

  @override
  List<Object?> get props => [title, isSelected, icon];
}

class PrimaryTabBar<T> extends StatelessWidget {
  final List<PrimaryTabBarItem<T>> items;
  final ValueChanged<T> onTap;
  const PrimaryTabBar({required this.onTap, required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: context.theme.colorsPalette.surfaces.secondary,
        borderRadius: context.theme.radiuses.s12.circular,
      ),
      padding: .all(context.theme.spacings.s4),
      child: Row(
        spacing: context.theme.spacings.s4,
        children: items
            .map(
              (e) => Expanded(
                child: SettingSelectItem(item: e, onTap: () => onTap(e.value)),
              ),
            )
            .toList(),
      ),
    );
  }
}

class SettingSelectItem<T> extends StatelessWidget {
  final PrimaryTabBarItem<T> item;
  final VoidCallback onTap;
  const SettingSelectItem({required this.item, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      decoration: BoxDecoration(
        color: item.isSelected
            ? context.theme.colorsPalette.surfaces.glassStrong
            : context.theme.colorsPalette.surfaces.glassStrong.withAlpha(0),
        borderRadius: context.theme.radiuses.s8.circular,
        border: item.isSelected ? .all(color: context.theme.colorsPalette.bordersAndLights.defaultColor) : null,
      ),
      child: GestureDetector(
        behavior: .translucent,
        onTap: item.isSelected ? null : onTap,
        child: Center(
          child: Row(
            mainAxisSize: .min,
            spacing: context.theme.spacings.s4,
            children: [
              ?item.icon?.svg(
                width: context.theme.spacings.s12,
                height: context.theme.spacings.s12,
                colorFilter: item.isSelected
                    ? context.theme.colorsPalette.brand.primary.filter
                    : context.theme.colorsPalette.text.disabled.filter,
              ),
              Text(
                item.title,
                style: item.isSelected
                    ? context.theme.textStyles.ag24.copyWith(color: context.theme.colorsPalette.brand.primary)
                    : context.theme.textStyles.ag28.copyWith(color: context.theme.colorsPalette.text.disabled),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
