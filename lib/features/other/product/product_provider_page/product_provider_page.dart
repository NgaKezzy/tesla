import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/other/cubit/product_cubit/product_cubit.dart';
import 'package:telsa_mobile/features/other/product/product_page.dart';

class ProductProviderPage extends StatelessWidget {
  const ProductProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductCubit productCubit = di.get();
    return BlocProvider.value(
      value: productCubit,
      child: const ProductPage(),
    );
  }
}
