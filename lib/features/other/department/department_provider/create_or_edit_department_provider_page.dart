import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/other/department/create_or_edit_department_page.dart';
import 'package:telsa_mobile/features/other/cubit/department_cubit/department_cubit.dart';
import 'package:telsa_mobile/features/other/models/department/department.dart';

class CreateOrEditDepartmentProviderPage extends StatelessWidget {
  const CreateOrEditDepartmentProviderPage({super.key, this.department});
  final Department? department;

  @override
  Widget build(BuildContext context) {
    final DepartmentCubit departmentCubit = di.get();

    return BlocProvider.value(
      value: departmentCubit,
      child: CreateOrEditDepartmentPage(
        department: department,
      ),
    );
  }
}
