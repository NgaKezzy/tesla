import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/other/cubit/employee_cubit/employee_cubit.dart';
import 'package:telsa_mobile/features/other/employee/employee_page.dart';

class EmployeeProviderPage extends StatelessWidget {
  const EmployeeProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EmployeeCubit employeeCubit = di.get();
    return BlocProvider.value(
      value: employeeCubit,
      child: const EmployeePage(),
    );
  }
}
