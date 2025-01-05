import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:telsa_mobile/core/color/app_color.dart';

class BuildAccountSectionRow extends StatelessWidget {
  const BuildAccountSectionRow({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 28,
            height: 28,
            colorFilter: const ColorFilter.mode(
              AppColors.placeholderColor,
              BlendMode.srcIn,
            ),
            fit: BoxFit.contain,
          ),
          const Gap(10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
