import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gtu_time/core/extension/extensions.dart';
import 'package:gtu_time/core/theme/colors_palette/colors_palette_entity.dart';
import 'package:gtu_time/core/theme/radiuses.dart';

class PrimaryInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? description;
  final Widget? prefixWidget;
  final double? prefixIconPadding;
  final Widget? suffixWidget;
  final double? suffixIconPadding;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType keyboardType;
  final InputState state;
  final bool autofocus;
  final bool enabled;
  final VoidCallback? onTap;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;

  // Controls whether the maxLength counter (e.g. "0/7") is shown
  final bool showCounter;

  const PrimaryInput({
    required this.hintText,
    required this.controller,
    this.description,
    this.prefixWidget,
    this.prefixIconPadding,
    this.suffixWidget,
    this.suffixIconPadding,
    this.state = InputState.enabled,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.onTap,
    this.maxLength = 100,
    this.inputFormatters,
    this.showCounter = false,
    this.contentPadding,
    super.key,
  });

  @override
  State<PrimaryInput> createState() => _PrimaryInputState();
}

class _PrimaryInputState extends State<PrimaryInput> {
  final _key = GlobalKey();

  TextEditingController get controller => widget.controller;
  ColorsPalette get palette => context.theme.colorsPalette;
  bool hasFocus = false;

  Color get borderColor => switch (widget.state) {
    .enabled => hasFocus ? palette.bordersAndLights.focus : palette.bordersAndLights.defaultColor,
    .error => palette.status.error,
    .disabled => palette.bordersAndLights.defaultColor,
  };

  Color get descriptionColor => switch (widget.state) {
    .enabled => palette.text.secondary,
    .error => palette.status.error,
    .disabled => palette.text.secondary.withAlpha(20),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      key: _key,
      mainAxisSize: .min,
      spacing: context.theme.spacings.s8,
      crossAxisAlignment: .start,
      children: [
        Focus(
          onFocusChange: (focus) => setState(() => hasFocus = focus),
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: kThemeAnimationDuration,
              height: context.theme.spacings.s48,
              decoration: BoxDecoration(
                color: palette.surfaces.glassStrong,
                borderRadius: context.theme.radiuses.s14.circular,
                border: .all(color: borderColor),
              ),
              child: Row(
                spacing: context.theme.spacings.s12,
                children: [
                  if (widget.prefixWidget != null)
                    Padding(
                      padding: .only(
                        top: widget.prefixIconPadding ?? context.theme.spacings.s14,
                        bottom: widget.prefixIconPadding ?? context.theme.spacings.s14,
                        left: widget.prefixIconPadding ?? context.theme.spacings.s14,
                      ),
                      child: widget.prefixWidget,
                    ),
                  Expanded(
                    child: TextField(
                      autofocus: widget.autofocus,
                      controller: controller,
                      enabled: widget.enabled && widget.state != .disabled,
                      maxLength: widget.maxLength,
                      inputFormatters: widget.inputFormatters,
                      keyboardType: widget.keyboardType,
                      cursorColor: palette.brand.primary,
                      decoration: InputDecoration(
                        isDense: true,
                        border: .none,
                        hintText: widget.hintText,
                        hintStyle: context.theme.textStyles.ag23.copyWith(color: palette.text.secondary),
                        contentPadding: widget.contentPadding ?? .zero,
                        counterText: widget.showCounter ? null : '',
                      ),
                      style: context.theme.textStyles.ag23.copyWith(color: palette.text.primary),
                      onChanged: (_) => setState(() {}),
                      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                  if (widget.suffixWidget != null)
                    Padding(
                      padding: .only(
                        top: widget.suffixIconPadding ?? context.theme.spacings.s14,
                        bottom: widget.suffixIconPadding ?? context.theme.spacings.s14,
                        right: widget.suffixIconPadding ?? context.theme.spacings.s14,
                      ),
                      child: widget.suffixWidget,
                    ),
                ],
              ),
            ),
          ),
        ),
        if (widget.description != null)
          Text(widget.description!, style: context.theme.textStyles.ag28.copyWith(color: descriptionColor)),
      ],
    );
  }
}

enum InputState { enabled, error, disabled }
