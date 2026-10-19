import 'dart:ui';

class ColorsPalette {
  final BrandColors brand;
  final BackgroundColors background;
  final SurfacesColors surfaces;
  final TextColors text;
  final BordersAndLightsColors bordersAndLights;
  final StatusColors status;
  final InteractiveColors interactive;

  const ColorsPalette({
    required this.brand,
    required this.background,
    required this.surfaces,
    required this.text,
    required this.bordersAndLights,
    required this.status,
    required this.interactive,
  });
}

class BrandColors {
  final Color primary;
  final Color primaryHover;
  final Color primaryPressed;
  final Color deep;
  final Color accent;
  final Color selection;

  const BrandColors({
    required this.primary,
    required this.primaryHover,
    required this.primaryPressed,
    required this.deep,
    required this.accent,
    required this.selection,
  });
}

class BackgroundColors {
  final Color base;
  final Color elevated;
  final Color overlay;

  const BackgroundColors({required this.base, required this.elevated, required this.overlay});
}

class SurfacesColors {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color glass;
  final Color glassStrong;
  final Color glassSubtle;
  final Color selected;
  final Color disabled;

  const SurfacesColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.glass,
    required this.glassStrong,
    required this.glassSubtle,
    required this.selected,
    required this.disabled,
  });
}

class TextColors {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color inverse;
  final Color disabled;
  final Color onPrimary;

  const TextColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.inverse,
    required this.disabled,
    required this.onPrimary,
  });
}

class BordersAndLightsColors {
  final Color subtle;
  final Color defaultColor;
  final Color strong;
  final Color focus;
  final Color highlight;
  final Color shadow;

  const BordersAndLightsColors({
    required this.subtle,
    required this.defaultColor,
    required this.strong,
    required this.focus,
    required this.highlight,
    required this.shadow,
  });
}

class StatusColors {
  final Color current;
  final Color upcoming;
  final Color completed;
  final Color cancelled;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  const StatusColors({
    required this.current,
    required this.upcoming,
    required this.completed,
    required this.cancelled,
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
  });
}

class InteractiveColors {
  final Color hover;
  final Color pressed;
  final Color focused;
  final Color disabled;

  const InteractiveColors({required this.hover, required this.pressed, required this.focused, required this.disabled});
}
