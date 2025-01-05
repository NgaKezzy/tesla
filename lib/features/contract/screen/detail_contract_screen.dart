import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/widgets/app_bar/custom_app_bar.dart';
import 'package:telsa_mobile/common/widgets/button/call_phone_button.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/features/contract/widget/Warranty_maintenance_repair.dart';

class DetailContractScreen extends StatefulWidget {
  const DetailContractScreen({super.key});

  @override
  State<DetailContractScreen> createState() => _DetailContractScreenState();
}

class _DetailContractScreenState extends State<DetailContractScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Chi tiết hợp đồng',
        onBackPressed: () {
          context.pop();
        },
        enableBackButton: true,
      ),
      body: Column(
        children: [
          _buildInfoContract(context),
          _buildRepairItem(),
        ],
      ),
    );
  }

  Widget _buildInfoContract(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    Assets.svg.contract.path,
                  ),
                ),
              ),
              const Gap(10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'HD00002',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Anh sơn',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '0154864651535',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Column(
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
                  const CallPhoneButton(phoneNumber: "846151"),
                ],
              ),
            ],
          ),
          const Divider(
            color: AppColors.placeholderColor,
          ),
          const Gap(16),
          const Text('Lô23A, KĐT Lê Trọng Tấn, An Khánh, Hoài Đức, Hà Nội')
        ],
      ),
    );
  }

  Widget _buildRepairItem() {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicator: const BoxDecoration(),
            dividerColor: AppColors.primary,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            controller: tabController,
            tabAlignment: TabAlignment.start,
            labelColor: AppColors.primary,
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            unselectedLabelColor: AppColors.black,
            onTap: (value) {},
            tabs: const [
              Tab(
                text: 'Bảo hành, bảo trì, trực sửa', // indices
              ),
              Tab(
                text: 'Thông tin hợp đồng', // future
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: WarrantyMaintenanceRepair(),
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
