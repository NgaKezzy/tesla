import 'package:flutter/material.dart';
import 'package:telsa_mobile/common/widgets/box/custom_box.dart';
import 'package:telsa_mobile/core/color/app_color.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;

  const SearchWidget({
    super.key,
    required this.searchController,
    this.hintText = 'Search',
  });

  @override
  Widget build(BuildContext context) {
    return CustomBox(
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.zero,
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.placeholderColor,
          ),
          border: InputBorder.none,
          fillColor: Colors.transparent,
          filled: true,
          hintStyle: const TextStyle(
            color: AppColors.placeholderColor,
          ),
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
