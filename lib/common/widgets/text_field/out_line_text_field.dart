import 'package:flutter/material.dart';
import 'package:telsa_mobile/core/color/app_color.dart';

class OutlineTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final bool obscureText;
  final int? maxLines;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final Color? cursorColor;
  final Clip clipBehavior;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final String? hintText;
  final Widget? label;
  final String? labelText;
  final Widget? error;
  final BorderSide borderSide;
  final BorderRadius borderRadius;
  final BorderRadius borderRadiusFocused;
  final String? suffixText;
  final BorderSide borderSideFocused;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final EdgeInsets? contentPadding;

  const OutlineTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.autoValidateMode,
    this.obscureText = false,
    this.maxLines = 1,
    this.style,
    this.keyboardType,
    this.cursorColor,
    this.clipBehavior = Clip.hardEdge,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.fillColor = AppColors.white,
    this.hintText,
    this.hintStyle,
    this.labelStyle,
    this.label,
    this.labelText,
    this.error,
    this.suffixText,
    this.onChanged,
    this.borderSide = const BorderSide(color: AppColors.lightGrey),
    this.borderRadius = const BorderRadius.all(
      Radius.circular(16),
    ),
    this.borderRadiusFocused = const BorderRadius.all(
      Radius.circular(16),
    ),
    this.borderSideFocused = const BorderSide(color: AppColors.lightGrey),
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: autoValidateMode,
      obscureText: obscureText,
      maxLines: maxLines,
      style: style,
      keyboardType: keyboardType,
      cursorColor: cursorColor,
      clipBehavior: clipBehavior,
      textAlign: textAlign,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        suffixText: suffixText,
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        label: label,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        labelText: labelText,
        error: error,
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: borderSide,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: borderSide,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusFocused,
          borderSide: borderSideFocused,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
