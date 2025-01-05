import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/widgets/app_bar/custom_app_bar.dart';
import 'package:telsa_mobile/common/widgets/button/solid_button.dart';
import 'package:telsa_mobile/common/widgets/empty/empty_widget.dart';
import 'package:telsa_mobile/common/widgets/text_field/search_widget.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';
import 'package:telsa_mobile/features/other/cubit/employee_cubit/employee_cubit.dart';
import 'package:telsa_mobile/features/other/cubit/employee_cubit/employee_state.dart';
import 'package:telsa_mobile/features/other/employee/widgets/group_employee_widget.dart';
import 'package:telsa_mobile/features/other/models/employee/employee.dart';
import 'package:telsa_mobile/features/other/models/employee/group_employee.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final TextEditingController searchController = TextEditingController();
  final EmployeeCubit employeeCubit = di.get();

  @override
  void initState() {
    employeeCubit.getAllEmployee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.of(context).padding.bottom == 0
        ? 16.0
        : MediaQuery.of(context).padding.bottom;
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Danh sách nhân sự',
          enableBackButton: true,
          onBackPressed: () => context.pop(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: InkWell(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ).copyWith(
              top: 8,
              bottom: bottomPadding,
            ),
            child: BlocBuilder<EmployeeCubit, EmployeeState>(
              builder: (context, state) {
                if (state.groupEmployees.isEmpty) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const EmptyWidget());
                }
                return Column(
                  children: [
                    SearchWidget(
                      searchController: searchController,
                      hintText: 'Tìm kiếm nhân sự',
                    ),
                    const Gap(8),
                    ListView.builder(
                      itemCount: state.groupEmployees.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        GroupEmployee item = state.groupEmployees[index];
                        return GroupEmployeeWidget(
                          groupEmployee: item,
                        );
                      }),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(AppRouteConstant.createOrEditEmployeePage);
          },
          backgroundColor: AppColors.primary,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ));
  }
}
