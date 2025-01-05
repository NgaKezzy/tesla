import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:telsa_mobile/features/customer/model/customer.dart';
import 'package:telsa_mobile/features/customer/widgets/build_customer_row.dart';

class BuildListCustomer extends StatelessWidget {
  const BuildListCustomer({super.key, required this.customers});
  final List<Customer> customers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: customers.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return BuildCustomerRow(
          customer: customers[index],
        );
      },
    );
  }
}
