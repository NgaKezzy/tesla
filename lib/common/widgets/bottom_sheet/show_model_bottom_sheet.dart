import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/widgets/box/custom_box.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';

class ModalBottomSheetCustom extends StatelessWidget {
  const ModalBottomSheetCustom({
    super.key,
    required this.listButtons,
    this.title,
  });

  final List<BottomSheetItem> listButtons;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return CustomBox(
      child: Wrap(
        children: [
          title != null
              ? DecoratedBox(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.lightGrey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: const Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.placeholderColor,
                          ),
                        ),
                        Text(title ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                            )),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: SizedBox(
                    width: 50,
                    child: Divider(
                      color: AppColors.lightGrey,
                      thickness: 2,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: listButtons.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                BottomSheetItem item = listButtons[index];
                return _BuildButton(
                  item: item,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildButton extends StatelessWidget {
  final BottomSheetItem item;

  const _BuildButton({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        item.icon,
        width: 24,
        height: 24,
      ),
      title: Text(
        item.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF555555),
        ),
      ),
      onTap: () {
        // Close the bottom sheet
        context.pop();
        item.onTap();
      },
    );
  }
}

class BottomSheetItem {
  final String title;
  final String icon;
  final Function() onTap;

  BottomSheetItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
