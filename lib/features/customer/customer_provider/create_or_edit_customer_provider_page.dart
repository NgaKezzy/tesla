import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/customer/create_or_edit_customer_page.dart';
import 'package:telsa_mobile/features/customer/cubit/customer_cubit.dart';
import 'package:telsa_mobile/features/customer/model/customer.dart';

class CreateOrEditCustomerProviderPage extends StatelessWidget {
  const CreateOrEditCustomerProviderPage({super.key, this.customer});

  final Customer? customer;

  @override
  Widget build(BuildContext context) {
    final CustomerCubit customerCubit = di.get();
    return BlocProvider.value(
      value: customerCubit,
      child: CreateOrEditCustomerPage(
        customer: customer,
      ),
    );
  }
}
