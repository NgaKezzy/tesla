import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/other/cubit/product_cubit/product_cubit.dart';
import 'package:telsa_mobile/features/other/models/product/product.dart';
import 'package:telsa_mobile/features/other/product/create_or_edit_product_page.dart';

class CreateOrEditProductProviderPage extends StatelessWidget {
  const CreateOrEditProductProviderPage({super.key, this.product});
  final Product? product;

  @override
  Widget build(BuildContext context) {
    final ProductCubit productCubit = di.get();
    return BlocProvider.value(
      value: productCubit,
      child: CreateOrEditProductPage(
        product: product,
      ),
    );
  }
}
