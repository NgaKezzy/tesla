import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/other/cubit/department_cubit/department_cubit.dart';
import 'package:telsa_mobile/features/other/cubit/employee_cubit/employee_cubit.dart';
import 'package:telsa_mobile/features/other/employee/create_or_edit_employee_page.dart';
import 'package:telsa_mobile/features/other/models/employee/employee.dart';

class CreateOrEditEmployeeProviderPage extends StatelessWidget {
  const CreateOrEditEmployeeProviderPage({super.key, this.employee});

  final Employee? employee;

  @override
  Widget build(BuildContext context) {
    final EmployeeCubit employeeCubit = di.get();
    final DepartmentCubit departmentCubit = di.get();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: employeeCubit,
        ),
        BlocProvider.value(
          value: departmentCubit,
        ),
      ],
      child: CreateOrEditEmployeePage(
        employee: employee,
      ),
    );
  }
}
