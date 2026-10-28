// dart format width=120

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_right_18.svg
  SvgGenImage get arrowRight18 => const SvgGenImage('assets/icons/arrow_right_18.svg');

  /// File path: assets/icons/calendar_check_28.svg
  SvgGenImage get calendarCheck28 => const SvgGenImage('assets/icons/calendar_check_28.svg');

  /// File path: assets/icons/check_11.svg
  SvgGenImage get check11 => const SvgGenImage('assets/icons/check_11.svg');

  /// File path: assets/icons/chevron_down_18.svg
  SvgGenImage get chevronDown18 => const SvgGenImage('assets/icons/chevron_down_18.svg');

  /// File path: assets/icons/chevron_right_20.svg
  SvgGenImage get chevronRight20 => const SvgGenImage('assets/icons/chevron_right_20.svg');

  /// File path: assets/icons/circle_22.svg
  SvgGenImage get circle22 => const SvgGenImage('assets/icons/circle_22.svg');

  /// File path: assets/icons/circle_alert_28.svg
  SvgGenImage get circleAlert28 => const SvgGenImage('assets/icons/circle_alert_28.svg');

  /// File path: assets/icons/circle_check_22.svg
  SvgGenImage get circleCheck22 => const SvgGenImage('assets/icons/circle_check_22.svg');

  /// File path: assets/icons/circle_x_18.svg
  SvgGenImage get circleX18 => const SvgGenImage('assets/icons/circle_x_18.svg');

  /// File path: assets/icons/coffee_14.svg
  SvgGenImage get coffee14 => const SvgGenImage('assets/icons/coffee_14.svg');

  /// File path: assets/icons/languages_28.svg
  SvgGenImage get languages28 => const SvgGenImage('assets/icons/languages_28.svg');

  /// File path: assets/icons/radio_11.svg
  SvgGenImage get radio11 => const SvgGenImage('assets/icons/radio_11.svg');

  /// File path: assets/icons/search_18.svg
  SvgGenImage get search18 => const SvgGenImage('assets/icons/search_18.svg');

  /// File path: assets/icons/search_x_28.svg
  SvgGenImage get searchX28 => const SvgGenImage('assets/icons/search_x_28.svg');

  /// File path: assets/icons/settings_20.svg
  SvgGenImage get settings20 => const SvgGenImage('assets/icons/settings_20.svg');

  /// File path: assets/icons/sun_moon_20.svg
  SvgGenImage get sunMoon20 => const SvgGenImage('assets/icons/sun_moon_20.svg');

  /// File path: assets/icons/wifi_off_28.svg
  SvgGenImage get wifiOff28 => const SvgGenImage('assets/icons/wifi_off_28.svg');

  /// File path: assets/icons/x_20.svg
  SvgGenImage get x20 => const SvgGenImage('assets/icons/x_20.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    arrowRight18,
    calendarCheck28,
    check11,
    chevronDown18,
    chevronRight20,
    circle22,
    circleAlert28,
    circleCheck22,
    circleX18,
    coffee14,
    languages28,
    radio11,
    search18,
    searchX28,
    settings20,
    sunMoon20,
    wifiOff28,
    x20,
  ];
}

abstract final class Assets {
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(_assetName, assetBundle: bundle, packageName: package);
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
