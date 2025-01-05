import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/widgets/app_bar/custom_app_bar.dart';
import 'package:telsa_mobile/common/widgets/bottom_sheet/show_model_bottom_sheet.dart';
import 'package:telsa_mobile/common/widgets/empty/empty_widget.dart';
import 'package:telsa_mobile/common/widgets/text_field/search_widget.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/constants/url_constants.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';
import 'package:telsa_mobile/features/other/cubit/product_cubit/product_cubit.dart';
import 'package:telsa_mobile/features/other/cubit/product_cubit/product_state.dart';
import 'package:telsa_mobile/features/other/models/product/product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController _searchController = TextEditingController();
  ProductCubit productCubit = di.get();

  @override
  void initState() {
    productCubit.getAllProduct();

    super.initState();
  }

  @override
  void dispose() {
    _searchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: CustomAppBar(
            title: 'Sản phẩm',
            enableBackButton: true,
            onBackPressed: () {
              context.pop();
            },
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: GestureDetector(
                  onTap: () {},
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
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SearchWidget(searchController: _searchController),
                  const Gap(26),
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state.products.isEmpty) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height - 200,
                            child: const EmptyWidget());
                      } else {
                        return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) =>
                                _buildItemProduct(state.products[index]),
                            separatorBuilder: (context, index) => const Gap(10),
                            itemCount: state.products.length);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.push(AppRouteConstant.createOrEditProductProviderPage);
            },
            backgroundColor: AppColors.primary,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          )),
    );
  }

  Widget _buildItemProduct(Product product) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.lightGrey, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          product.picture == null
              ? const Icon(
                  Icons.image_outlined,
                  size: 80,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.network(
                        '${UrlConstants.host}/${product.picture}',
                        fit: BoxFit.cover,
                      )),
                ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  product.branch ?? '',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text(
                  product.specification ?? '',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => ModalBottomSheetCustom(
                          listButtons: [
                            BottomSheetItem(
                              title: 'Sửa',
                              icon: Assets.svg.edit.path,
                              onTap: () {
                                context.push(
                                    AppRouteConstant
                                        .createOrEditProductProviderPage,
                                    extra: product);
                              },
                            ),
                            BottomSheetItem(
                              title: 'Xóa',
                              icon: Assets.svg.bin.path,
                              onTap: () {
                                productCubit.deleteProduct(product.id);
                              },
                            )
                          ],
                        ));
              },
              icon: const Icon(Icons.more_vert))
        ],
      ),
    );
  }
}
