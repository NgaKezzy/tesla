import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key, required this.items});

  final List<CategoryItem> items;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 4 > 50
        ? 50
        : MediaQuery.of(context).size.width / 4;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
      ),
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: items[index].onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: items[index].color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Center(
                    child: SvgPicture.asset(
                      items[index].icon,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              AutoSizeText(
                items[index].title,
                maxFontSize: 12,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
                minFontSize: 8,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        );
      },
    );
  }
}

class CategoryItem {
  const CategoryItem({
    required this.title,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  final String title;
  final String icon;
  final Function() onTap;
  final Color color;
}
