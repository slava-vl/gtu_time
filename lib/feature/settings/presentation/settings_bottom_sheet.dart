import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/resources/assets.gen.dart';
import 'package:gtu_time/core/theme/radiuses.dart';
import 'package:gtu_time/core/ui_kit/ui_kit.dart';
import 'package:gtu_time/feature/localization_control/domain/entity/locale_entity.dart';
import 'package:gtu_time/feature/localization_control/presentation/localization_scope.dart';
import 'package:gtu_time/feature/theme_control/domain/entity/current_theme.dart';
import 'package:gtu_time/feature/theme_control/presentation/theme_control_scope.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet._();

  static void show(BuildContext context) =>
      PrimaryBottomSheet.show(context: context, builder: (context) => const SettingsBottomSheet._());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: context.theme.spacings.s20),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: .symmetric(horizontal: context.theme.spacings.s4, vertical: context.theme.spacings.s8),
            child: Column(
              crossAxisAlignment: .start,
              spacing: context.theme.spacings.s4,
              children: [
                Text(
                  context.l10n.settings_title,
                  style: context.theme.textStyles.ag34.copyWith(color: context.theme.colorsPalette.text.primary),
                ),
                Text(
                  context.l10n.settings_subtitle,
                  style: context.theme.textStyles.ag23.copyWith(color: context.theme.colorsPalette.text.secondary),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: context.theme.colorsPalette.surfaces.glassStrong,
              border: .all(color: context.theme.colorsPalette.bordersAndLights.defaultColor),
              borderRadius: context.theme.radiuses.s16.circular,
            ),
            padding: .symmetric(vertical: context.theme.spacings.s12, horizontal: context.theme.spacings.s16),
            child: Column(
              spacing: context.theme.spacings.s12,
              children: [
                Row(
                  spacing: context.theme.spacings.s12,
                  children: [
                    Assets.icons.sunMoon20.svg(colorFilter: context.theme.colorsPalette.brand.primary.filter),
                    Flexible(
                      child: Text(
                        context.l10n.appearance_title,
                        style: context.theme.textStyles.ag36.copyWith(color: context.theme.colorsPalette.text.primary),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: context.theme.colorsPalette.surfaces.secondary,
                    borderRadius: context.theme.radiuses.s12.circular,
                  ),
                  padding: .all(context.theme.spacings.s4),
                  child: Row(
                    spacing: context.theme.spacings.s4,
                    children: [
                      Expanded(
                        child: SettingSelectItem(
                          isSelected: ThemeControlScope.currentThemeOf(context) == null,
                          title: context.l10n.theme_system,
                          onTap: () => ThemeControlScope.changeTheme(context, theme: null),
                        ),
                      ),
                      Expanded(
                        child: SettingSelectItem(
                          isSelected: ThemeControlScope.currentThemeOf(context) == CurrentTheme.light,
                          title: context.l10n.theme_light,
                          onTap: () => ThemeControlScope.changeTheme(context, theme: CurrentTheme.light),
                        ),
                      ),
                      Expanded(
                        child: SettingSelectItem(
                          isSelected: ThemeControlScope.currentThemeOf(context) == CurrentTheme.dark,
                          title: context.l10n.theme_dark,
                          onTap: () => ThemeControlScope.changeTheme(context, theme: CurrentTheme.dark),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: context.theme.spacings.s12),
          Container(
            decoration: BoxDecoration(
              color: context.theme.colorsPalette.surfaces.glassStrong,
              border: .all(color: context.theme.colorsPalette.bordersAndLights.defaultColor),
              borderRadius: context.theme.radiuses.s16.circular,
            ),
            padding: .symmetric(vertical: context.theme.spacings.s12, horizontal: context.theme.spacings.s16),
            child: Column(
              spacing: context.theme.spacings.s12,
              children: [
                Row(
                  spacing: context.theme.spacings.s12,
                  children: [
                    Assets.icons.languages28.svg(
                      width: context.theme.spacings.s20,
                      height: context.theme.spacings.s20,
                      colorFilter: context.theme.colorsPalette.brand.primary.filter,
                    ),
                    Flexible(
                      child: Text(
                        context.l10n.language_title,
                        style: context.theme.textStyles.ag36.copyWith(color: context.theme.colorsPalette.text.primary),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: context.theme.colorsPalette.surfaces.secondary,
                    borderRadius: context.theme.radiuses.s12.circular,
                  ),
                  padding: .all(context.theme.spacings.s4),
                  child: Row(
                    spacing: context.theme.spacings.s4,
                    children: LocaleEntity.values
                        .map(
                          (e) => Expanded(
                            child: SettingSelectItem(
                              isSelected: LocalizationScope.localeEntityOf(context) == e,
                              title: e.nativeName,
                              onTap: () => LocalizationScope.changeLocale(context, locale: e),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: context.theme.spacings.s12),
          Center(
            child: FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data;
                  if (data != null) {
                    return Text(
                      'version: ${data.version}',
                      style: context.theme.textStyles.ag18.copyWith(color: context.theme.colorsPalette.text.secondary),
                    );
                  }
                }
                return SizedBox.shrink();
              },
            ),
          ),
          SizedBox(height: MediaQuery.paddingOf(context).bottom + context.theme.spacings.s16),
        ],
      ),
    );
  }
}

class SettingSelectItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onTap;
  const SettingSelectItem({required this.isSelected, required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      decoration: BoxDecoration(
        color: isSelected
            ? context.theme.colorsPalette.surfaces.glassStrong
            : context.theme.colorsPalette.surfaces.glassStrong.withAlpha(0),
        borderRadius: context.theme.radiuses.s8.circular,
        border: isSelected ? .all(color: context.theme.colorsPalette.bordersAndLights.defaultColor) : null,
      ),
      child: GestureDetector(
        behavior: .translucent,
        onTap: isSelected ? null : onTap,
        child: Center(
          child: Row(
            mainAxisSize: .min,
            spacing: context.theme.spacings.s4,
            children: [
              Text(
                title,
                style: isSelected
                    ? context.theme.textStyles.ag24.copyWith(color: context.theme.colorsPalette.brand.primary)
                    : context.theme.textStyles.ag28.copyWith(color: context.theme.colorsPalette.text.disabled),
              ),
              AnimatedCrossFade(
                firstChild: Assets.icons.check11.svg(
                  width: context.theme.spacings.s12,
                  height: context.theme.spacings.s12,
                  colorFilter: context.theme.colorsPalette.brand.primary.filter,
                ),
                secondChild: SizedBox(height: context.theme.spacings.s12),
                crossFadeState: isSelected ? .showFirst : .showSecond,
                duration: kThemeAnimationDuration,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
