import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/customer/cubit/customer_cubit.dart';
import 'package:telsa_mobile/features/customer/customer_page.dart';

class CustomerProviderPage extends StatelessWidget {
  const CustomerProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomerCubit customerCubit = di.get();
    return BlocProvider.value(
      value: customerCubit,
      child: const CustomerPage(),
    );
  }
}
