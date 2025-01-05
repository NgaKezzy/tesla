import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/other/cubit/department_cubit/department_cubit.dart';
import 'package:telsa_mobile/features/other/department/department_page.dart';

class DepartmentProviderPage extends StatelessWidget {
  const DepartmentProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DepartmentCubit departmentCubit = di.get();
    return BlocProvider.value(
    value: departmentCubit,
      child: const DepartmentPage(),
    );
  }
}
