import 'package:flutter/material.dart';
import 'package:telsa_mobile/core/color/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.bottom,
    this.onBackPressed,
    this.actions,
    bool? enableBackButton,
    this.centerTitle = true,
    this.titleWidget,
    this.leading,
    this.leadingWidth,
    this.backgroundColor = AppColors.primary,
  }) : enableBackButton = enableBackButton ?? false;

  final bool enableBackButton; // Non-nullable boolean
  final String? title;
  final PreferredSizeWidget? bottom;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Widget? titleWidget;
  final bool centerTitle;
  final Widget? leading;
  final double? leadingWidth;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      leading: enableBackButton
          ? Padding(
              padding: const EdgeInsets.only(left: 5),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                onTap: onBackPressed,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 15,
                    color: Color(0xFF555555),
                  ),
                ),
              ),
            )
          : leading,
      actions: actions,
      automaticallyImplyLeading: false,
      title: titleWidget ??
          Text(
            "$title",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
      bottom: bottom,
      leadingWidth: leadingWidth,
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(
      kToolbarHeight + (bottom?.preferredSize.height ?? 0.0),
    );
  }
}
