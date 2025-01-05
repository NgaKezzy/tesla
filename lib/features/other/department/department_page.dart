import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:telsa_mobile/common/widgets/app_bar/custom_app_bar.dart';
import 'package:telsa_mobile/common/widgets/bottom_sheet/show_model_bottom_sheet.dart';
import 'package:telsa_mobile/common/widgets/button/solid_button.dart';
import 'package:telsa_mobile/common/widgets/empty/empty_widget.dart';
import 'package:telsa_mobile/common/widgets/text_field/search_widget.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';
import 'package:telsa_mobile/features/other/cubit/department_cubit/department_cubit.dart';
import 'package:telsa_mobile/features/other/cubit/department_cubit/department_state.dart';
import 'package:telsa_mobile/features/other/models/department/department.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage({super.key});

  @override
  State<DepartmentPage> createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  final TextEditingController _searchController = TextEditingController();
  late DepartmentCubit departmentCubit;

  @override
  void initState() {
    departmentCubit = context.read<DepartmentCubit>();
    departmentCubit.getAllDepartment();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Phòng ban',
          enableBackButton: true,
          onBackPressed: () {
            context.pop();
          },
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 15,
                    color: Color(0xFF555555),
                  ),
                ),
              ),
            )
          ],
        ),
        body: BlocBuilder<DepartmentCubit, DepartmentState>(
          builder: (context, state) {
            if (state.departments.isEmpty) {
              return const EmptyWidget();
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SearchWidget(searchController: _searchController),
                  const Gap(26),
                  Expanded(
                    child: AnimationLimiter(
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 300),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: _buildItemDepartment(
                                        state.departments[index], index),
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) => const Gap(10),
                          itemCount: state.departments.length),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(AppRouteConstant.createOrEditDepartmentProviderPage);
          },
          backgroundColor: AppColors.primary,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildItemDepartment(Department department, int indexDepartment) {
    return Container(
      height: 65,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.greyC4D7E0, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                department.name,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
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
                                    _buildPermission(
                                        department: department,
                                        indexDepartment: indexDepartment);
                                  },
                                ),
                                BottomSheetItem(
                                  title: 'Sửa',
                                  icon: Assets.svg.edit.path,
                                  onTap: () {
                                    context.push(
                                        AppRouteConstant
                                            .createOrEditDepartmentProviderPage,
                                        extra: department);
                                  },
                                ),
                                BottomSheetItem(
                                  title: 'Xóa',
                                  icon: Assets.svg.bin.path,
                                  onTap: () {
                                    departmentCubit
                                        .deleteDepartment(department.id);
                                  },
                                )
                              ],
                            ));
                  },
                  icon: const Icon(Icons.more_vert))
            ],
          ),
        ],
      ),
    );
  }

  Future _buildPermission(
      {required Department department, required int indexDepartment}) {
    final DepartmentCubit departmentCubit = di.get();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => BlocProvider.value(
        value: departmentCubit,
        child: BlocBuilder<DepartmentCubit, DepartmentState>(
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 60,
                          height: 2,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        const Gap(16),
                        const Text('Phòng ban: '),
                        Text(
                          state.departments[indexDepartment].name,
                          style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    state.departments[indexDepartment].permissionData.isEmpty
                        ? const Expanded(child: EmptyWidget())
                        : Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.departments[indexDepartment]
                                  .permissionData.length,
                              itemBuilder: (context, index) => CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                dense: true,
                                value: state.departments[indexDepartment]
                                    .permissionData[index].check,
                                onChanged: (value) {
                                  departmentCubit.toggleCheckbox(
                                      indexDepartment, index);
                                },
                                title: Text(state.departments[indexDepartment]
                                    .permissionData[index].name
                                    .toString()),
                              ),
                            ),
                          ),
                    const Gap(8),
                    department.permissionData.isEmpty
                        ? const SizedBox()
                        : SolidButton(onTap: () {}, title: 'Áp dụng'),
                    const Gap(50)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
