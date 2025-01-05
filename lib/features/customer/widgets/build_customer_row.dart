import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/widgets/bottom_sheet/show_model_bottom_sheet.dart';
import 'package:telsa_mobile/common/widgets/button/call_phone_button.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';
import 'package:telsa_mobile/features/customer/cubit/customer_cubit.dart';
import 'package:telsa_mobile/features/customer/model/customer.dart';

class BuildCustomerRow extends StatelessWidget {
  const BuildCustomerRow({super.key, required this.customer});

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    final CustomerCubit customerCubit = di.get();
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.svg.user.svg(),
            const Gap(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    customer.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      const Gap(4),
                      Text(
                        customer.phoneNumber ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(8),
            CallPhoneButton(phoneNumber: customer.phoneNumber ?? ""),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => ModalBottomSheetCustom(
                          listButtons: [
                            BottomSheetItem(
                              title: 'Sửa',
                              icon: Assets.svg.edit.path,
                              onTap: () {
                                context.push(
                                    AppRouteConstant
                                        .createOrEditCustomerProviderPage,
                                    extra: customer);
                              },
                            ),
                            BottomSheetItem(
                              title: 'Xóa',
                              icon: Assets.svg.bin.path,
                              onTap: () {
                                customerCubit.deleteCustomer(customer.id);
                              },
                            )
                          ],
                        ));
              },
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.more_vert,
                size: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Gap(4),
        const Divider(
          height: 1,
          color: AppColors.lightGrey,
          thickness: 1,
        ),
        const Gap(4),
      ],
    );
  }
}
