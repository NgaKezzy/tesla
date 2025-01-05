import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';
import 'package:telsa_mobile/features/contract/contract_page.dart';

class WarrantyMaintenanceRepair extends StatelessWidget {
  const WarrantyMaintenanceRepair({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return _buildItem(context);
        },
        separatorBuilder: (context, index) => const Gap(10),
        itemCount: 5);
  }

  Widget _buildItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouteConstant.implementationProcessScreen);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: SvgPicture.asset(
                                Assets.svg.repair.path,
                              ),
                            ),
                          ),
                          const Gap(8),
                          const Text(
                            'HD00002',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Gap(10),
                      RichText(
                        text: const TextSpan(
                          text: 'Tên thang: ',
                          style: TextStyle(color: AppColors.grey),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Thang 1',
                                style: TextStyle(color: AppColors.black)),
                          ],
                        ),
                      ),
                      const Gap(10),
                      RichText(
                        text: const TextSpan(
                          text: 'Loại thang: ',
                          style: TextStyle(color: AppColors.grey),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Thang khách',
                                style: TextStyle(color: AppColors.black)),
                          ],
                        ),
                      ),
                      const Gap(10),
                      RichText(
                        text: const TextSpan(
                          text: 'Tốc độ: ',
                          style: TextStyle(color: AppColors.grey),
                          children: <TextSpan>[
                            TextSpan(
                                text: '5m/s',
                                style: TextStyle(color: AppColors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'Đang lắp đặt',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      const Gap(16),
                      const Gap(10),
                      RichText(
                        text: const TextSpan(
                          text: 'Tải trọng: ',
                          style: TextStyle(color: AppColors.grey),
                          children: <TextSpan>[
                            TextSpan(
                                text: '500kg',
                                style: TextStyle(color: AppColors.black)),
                          ],
                        ),
                      ),
                      const Gap(10),
                      RichText(
                        text: const TextSpan(
                          text: 'Số điểm dừng: ',
                          style: TextStyle(color: AppColors.grey),
                          children: <TextSpan>[
                            TextSpan(
                                text: '5',
                                style: TextStyle(color: AppColors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              color: AppColors.placeholderColor,
            ),
            const Gap(16),
            const Text('Lô23A, KĐT Lê Trọng Tấn, An Khánh, Hoài Đức, Hà Nội'),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    'Sửa chữa',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const Row(
                  children: [Text('Hoàng Nam'), Icon(Icons.person)],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
