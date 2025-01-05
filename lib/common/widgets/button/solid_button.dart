import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:telsa_mobile/core/color/app_color.dart';

class SolidButton extends StatefulWidget {
  const SolidButton._({
    super.key,
    required this.decoration,
    required this.onTap,
    required this.height,
    this.icon,
    this.iconImage,
    required this.title,
    required this.textStyle,
    required this.imageIconSize,
    required this.fit,
    required this.padding,
    this.trial,
  });

  final BoxDecoration decoration;
  final VoidCallback onTap;
  final double height;
  final Widget? icon;
  final String? iconImage;
  final String title;
  final TextStyle textStyle;
  final double imageIconSize;
  final BoxFit fit;
  final Widget? trial;
  final EdgeInsets padding;

  factory SolidButton({
    Key? key,
    BoxDecoration? decoration,
    required VoidCallback onTap,
    double height = 50.0,
    Widget? icon,
    String? iconImage,
    required String title,
    TextStyle? textStyle,
    double imageIconSize = 24.0,
    BoxFit fit = BoxFit.contain,
    Widget? trial,
    EdgeInsets? padding,
  }) {
    final defaultDecoration = BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(12),
    );

    const defaultTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    );

    padding = padding ?? EdgeInsets.zero;

    return SolidButton._(
      key: key,
      decoration: decoration ?? defaultDecoration,
      onTap: onTap,
      height: height,
      icon: icon,
      iconImage: iconImage,
      title: title,
      textStyle: textStyle ?? defaultTextStyle,
      imageIconSize: imageIconSize,
      fit: fit,
      padding: padding,
      trial: trial,
    );
  }

  @override
  State<SolidButton> createState() => _SolidButtonState();
}

class _SolidButtonState extends State<SolidButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: DecoratedBox(
        decoration: widget.decoration,
        child: Padding(
          padding: widget.padding,
          child: SizedBox(
            height: widget.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon != null ? widget.icon! : const SizedBox.shrink(),
                widget.iconImage != null
                    ? Image.asset(
                        widget.iconImage!,
                        width: widget.imageIconSize,
                        height: widget.imageIconSize,
                        fit: widget.fit,
                      )
                    : const SizedBox.shrink(),
                const Gap(8),
                Text(
                  widget.title,
                  style: widget.textStyle,
                ),
                const Gap(4),
                widget.trial != null ? widget.trial! : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
