import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:telsa_mobile/common/services/other_service.dart';
import 'package:telsa_mobile/common/widgets/loading/dialog_loading.dart';
import 'package:telsa_mobile/common/widgets/toast/app_toast.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/other/cubit/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.otherService}) : super(const ProductState());
  final OtherService otherService;
  final Logger logger = di.get();

  Future<void> createProduct(
    String fullName,
    String code,
    int categoryId,
    String price,
    String unit,
    String specification,
    String description,
    String? picture,
  ) async {
    try {
      DialogLoading.showLoading();

      final response = await otherService.createProduct(
          fullName,
          code,
          categoryId,
          price,
          unit,
          specification,
          description,
          picture != null ? File(picture) : null);
      DialogLoading.hideLoading();
      getAllProduct();

      AppToast.toastSuccess(response.message);
    } catch (e) {
      DialogLoading.hideLoading();

      logger.e(e);
    }
  }

  Future<void> getAllProduct() async {
    emit(state.copyWith(
      status: ProductStatus.start,
    ));
    try {
      final response = await otherService.getAllProduct(1, 10, 0);
      emit(state.copyWith(
          products: response.data, status: ProductStatus.success));
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> deleteProduct(int id) async {
    emit(state.copyWith(
      status: ProductStatus.start,
    ));
    try {
      DialogLoading.showLoading();

      final response = await otherService.deleteProduct(id);
      getAllProduct();
      DialogLoading.hideLoading();
      AppToast.toastSuccess(response.message);
    } catch (e) {
      DialogLoading.hideLoading();

      logger.e(e);
    }
  }

  Future<void> updateProduct(
    int id,
    String fullName,
    String code,
    int categoryId,
    String price,
    String unit,
    String specification,
    String description,
    String? picture,
  ) async {
    emit(state.copyWith(
      status: ProductStatus.start,
    ));
    try {
      DialogLoading.showLoading();

      final response = await otherService.updateProduct(
        id,
          fullName,
          code,
          categoryId,
          price,
          unit,
          specification,
          description,
          picture != null ? File(picture) : null);
      DialogLoading.hideLoading();
      getAllProduct();
      AppToast.toastSuccess(response.message);
    } catch (e) {
      DialogLoading.hideLoading();

      logger.e(e);
    }
  }
}
