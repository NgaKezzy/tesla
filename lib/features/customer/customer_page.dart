import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/widgets/app_bar/custom_app_bar.dart';
import 'package:telsa_mobile/common/widgets/empty/empty_widget.dart';
import 'package:telsa_mobile/common/widgets/text_field/search_widget.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';
import 'package:telsa_mobile/features/customer/cubit/customer_cubit.dart';
import 'package:telsa_mobile/features/customer/cubit/customer_state.dart';
import 'package:telsa_mobile/features/customer/widgets/build_list_customer.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final CustomerCubit customerCubit = di.get();
  @override
  void initState() {
    customerCubit.getAllCustomer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: "Khách hàng",
            enableBackButton: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: GestureDetector(
                  onTap: () => context
                      .push(AppRouteConstant.createOrEditCustomerProviderPage),
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
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
              top: 16,
            ),
            child: Column(
              children: [
                SearchWidget(
                  searchController: TextEditingController(),
                  hintText: 'Tìm kiếm khách hàng',
                ),
                const Gap(16),
                Expanded(
                  child: BlocBuilder<CustomerCubit, CustomerState>(
                    builder: (context, state) {
                      return RefreshIndicator(
                          displacement: 0.0,
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: state.customers.isEmpty
                                ? const EmptyWidget()
                                : BuildListCustomer(
                                    customers: state.customers,
                                  ),
                          ),
                          onRefresh: () async {});
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.push(AppRouteConstant.createOrEditCustomerProviderPage);
            },
            backgroundColor: AppColors.primary,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
