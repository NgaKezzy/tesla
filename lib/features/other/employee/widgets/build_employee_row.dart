import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/widgets/bottom_sheet/show_model_bottom_sheet.dart';
import 'package:telsa_mobile/common/widgets/button/call_phone_button.dart';
import 'package:telsa_mobile/common/widgets/button/solid_button.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';
import 'package:telsa_mobile/features/other/cubit/employee_cubit/employee_cubit.dart';
import 'package:telsa_mobile/features/other/models/employee/employee.dart';

class BuildEmployeeRow extends StatelessWidget {
  const BuildEmployeeRow({
    super.key,
    required this.employee,
  });

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    EmployeeCubit employeeCubit = di.get();

    return BlocProvider.value(
      value: employeeCubit,
      child: Column(
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
                      employee.fullName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      employee.phoneNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(8),
              CallPhoneButton(phoneNumber: employee.phoneNumber),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => ModalBottomSheetCustom(
                            listButtons: [
                              BottomSheetItem(
                                title: 'Phân quyền',
                                icon: Assets.svg.decentralization.path,
                                onTap: () {
                                  _buildPermission(context);
                                },
                              ),
                              BottomSheetItem(
                                title: 'Sửa',
                                icon: Assets.svg.edit.path,
                                onTap: () {
                                  context.push(
                                      AppRouteConstant.createOrEditEmployeePage,
                                      extra: employee);
                                },
                              ),
                              BottomSheetItem(
                                title: 'Xóa',
                                icon: Assets.svg.bin.path,
                                onTap: () {
                                  employeeCubit.deleteEmployee(employee);
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
      ),
    );
  }

  Future _buildPermission(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 80,
                    height: 2,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              const Gap(16),
              const Row(
                children: [
                  Gap(16),
                  Text('Phòng ban: '),
                  Text('Phòng kinh doanh'),
                ],
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                value: true,
                onChanged: (value) {},
                title: const Text('Hồ sơ'),
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                value: true,
                onChanged: (value) {},
                title: const Text('Hồ sơ'),
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                value: true,
                onChanged: (value) {},
                title: const Text('Hồ sơ'),
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                value: true,
                onChanged: (value) {},
                title: const Text('Hồ sơ'),
              ),
              const Spacer(),
              SolidButton(onTap: () {}, title: 'Áp dụng'),
              const Gap(50)
            ],
          ),
        ),
      ),
    );
  }
}
