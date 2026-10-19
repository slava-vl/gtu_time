import 'package:flutter/material.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/theme/radiuses.dart';

class PrimaryButton extends StatefulWidget {
  final String? title;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final ButtonType type;
  final bool isLoading;
  final bool isDisabled;
  final VoidCallback? onTap;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool enableShadow;
  final EdgeInsetsGeometry? outerPadding;
  final bool isCircular;

  const PrimaryButton({
    required this.onTap,
    this.title,
    this.leftIcon,
    this.rightIcon,
    this.type = ButtonType.primary,
    this.isLoading = false,
    this.isDisabled = false,
    this.alignment,
    this.backgroundColor,
    this.foregroundColor,
    this.enableShadow = true,
    this.outerPadding,
    this.isCircular = false,
    super.key,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isTap = false;
  bool get isDisabled => widget.isDisabled || widget.onTap == null;

  EdgeInsetsGeometry get outerPadding {
    if (widget.outerPadding != null) return widget.outerPadding!;

    if (widget.title != null) {
      return .symmetric(vertical: context.theme.spacings.s16, horizontal: context.theme.spacings.s24);
    }
    return .all(context.theme.spacings.s16);
  }

  EdgeInsetsGeometry get textPadding {
    return .symmetric(horizontal: context.theme.spacings.s16);
  }

  BorderRadiusGeometry get borderRadius {
    if (widget.isCircular) {
      return .circular(1000);
    }
    return context.theme.radiuses.s12.circular;
  }

  double get iconDimension {
    return context.theme.spacings.s24;
  }

  TextStyle get textStyle {
    return context.theme.textStyles.ag22;
  }

  Color get backgroundColor {
    if (isDisabled) return context.theme.colorsPalette.surfaces.disabled;

    return widget.backgroundColor ??
        switch (widget.type) {
          .primary =>
            isTap ? context.theme.colorsPalette.brand.primaryPressed : context.theme.colorsPalette.brand.primary,
          .secondary =>
            isTap ? context.theme.colorsPalette.interactive.pressed : context.theme.colorsPalette.surfaces.primary,
          .tertiary =>
            isTap ? context.theme.colorsPalette.interactive.pressed : context.theme.colorsPalette.brand.selection,
          .text => isTap ? Colors.transparent : context.theme.colorsPalette.interactive.pressed,
        };
  }

  BoxBorder? get border {
    final borderColor = switch (widget.type) {
      .secondary => context.theme.colorsPalette.bordersAndLights.defaultColor,
      _ => null,
    };
    if (borderColor == null) return null;
    return .all(color: borderColor);
  }

  Color get foregroundColor {
    if (isDisabled) return context.theme.colorsPalette.text.disabled;

    return widget.foregroundColor ??
        switch (widget.type) {
          .primary => context.theme.colorsPalette.text.onPrimary,
          _ => context.theme.colorsPalette.brand.primary,
        };
  }

  void _onTap() {
    if (widget.isLoading) return;
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDisabled ? null : _onTap,
      onTapDown: (_) => setState(() => isTap = true),
      onTapCancel: () => setState(() => isTap = false),
      onTapUp: (_) => setState(() => isTap = false),
      child: AnimatedContainer(
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(color: backgroundColor, borderRadius: borderRadius, border: border),
        padding: outerPadding,
        alignment: widget.alignment,
        child: Opacity(
          opacity: widget.type == .text && widget.isLoading ? 0 : 1,
          child: Row(
            mainAxisSize: .min,
            children: [
              ?widget.leftIcon,
              if (widget.title != null)
                Flexible(
                  child: Padding(
                    padding: textPadding,
                    child: Text(widget.title!, style: textStyle.copyWith(color: foregroundColor)),
                  ),
                ),
              ?widget.rightIcon,
            ],
          ),
        ),
      ),
    );
  }
}

enum ButtonType { primary, secondary, tertiary, text }
