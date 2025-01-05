import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:telsa_mobile/common/services/customer_service.dart';
import 'package:telsa_mobile/common/widgets/loading/dialog_loading.dart';
import 'package:telsa_mobile/common/widgets/toast/app_toast.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/customer/cubit/customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit({required this.customerService}) : super(const CustomerState());
  final CustomerService customerService;
  final Logger logger = di.get();

  Future<void> createCustomer(
    String name,
    String code,
    String phoneNumber,
    String email,
    String address,
    String dob,
    String description,
    String? avatar,
  ) async {
    DialogLoading.showLoading();

    try {
      final response = await customerService.createCustomer(
          name,
          code,
          phoneNumber,
          email,
          address,
          dob,
          description,
          avatar != null ? File(avatar) : null);
      DialogLoading.hideLoading();
      AppToast.toastSuccess(response.message);
    } catch (e) {
      DialogLoading.hideLoading();

      logger.e(e);
    }
  }

  Future<void> getAllCustomer() async {
    try {
      final response = await customerService.getAllCustomer(1, 10);
      emit(state.copyWith(customers: response.data));
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> deleteCustomer(int id) async {
    DialogLoading.showLoading();

    try {
      final response = await customerService.deleteCustomer(id);
      getAllCustomer();
      DialogLoading.hideLoading();
      AppToast.toastSuccess(response.message);
    } catch (e) {
      DialogLoading.hideLoading();

      logger.e(e);
    }
  }

  Future<void> updateCustomer(
    int id,
    String name,
    String code,
    String phoneNumber,
    String email,
    String address,
    String dob,
    String description,
    String? avatar,
  ) async {
    DialogLoading.showLoading();

    try {
      final response = await customerService.updateCustomer(
          id,
          name,
          code,
          phoneNumber,
          email,
          address,
          dob,
          description,
          avatar != null ? File(avatar) : null);
      getAllCustomer();
      DialogLoading.hideLoading();
      AppToast.toastSuccess(response.message);
    } catch (e) {
      DialogLoading.hideLoading();

      logger.e(e);
    }
  }
}
