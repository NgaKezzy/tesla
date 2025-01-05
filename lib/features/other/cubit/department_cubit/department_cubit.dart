import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:telsa_mobile/common/models/request/create_department_request.dart';
import 'package:telsa_mobile/common/services/other_service.dart';
import 'package:telsa_mobile/common/widgets/loading/dialog_loading.dart';
import 'package:telsa_mobile/common/widgets/toast/app_toast.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/other/cubit/department_cubit/department_state.dart';
import 'package:telsa_mobile/features/other/models/department/department.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  final OtherService otherService;
  final Logger logger = di.get();
  DepartmentCubit(this.otherService) : super(const DepartmentState());

  Future<void> createDepartment(
      {required String name, required String description}) async {
    emit(state.copyWith(status: DepartmentStatus.start));
    List<String> words = name.split(' ');
    String code = words.map((word) => word[0]).join();

    try {
      DialogLoading.showLoading();
      final response = await otherService.createDepartment(
          CreateOrEditDepartmentRequest(
              name: name, code: code, description: description));
      emit(state.copyWith(status: DepartmentStatus.success));

      DialogLoading.hideLoading();
      AppToast.toastSuccess(response.message);
    } catch (e) {
      DialogLoading.hideLoading();

      logger.f(e);
    }
  }

  Future<void> getAllDepartment() async {
    emit(state.copyWith(status: DepartmentStatus.start, departments: []));
    try {
      final response = await otherService.getAllDepartment(1, 100);
      emit(state.copyWith(
          status: DepartmentStatus.success, departments: response.data));
      logger.f(state.departments.last.permissionData);
    } catch (e) {
      DialogLoading.hideLoading();

      logger.f(e);
    }
  }

  Future<void> deleteDepartment(int id) async {
    try {
      DialogLoading.showLoading();

      final response = await otherService.deleteDepartment(id);
      DialogLoading.hideLoading();

      getAllDepartment();
      AppToast.toastSuccess(response.message);
    } catch (e) {
      DialogLoading.hideLoading();

      logger.f(e);
    }
  }

  Future<void> updateDepartment(int id, String name, String description) async {
    emit(state.copyWith(status: DepartmentStatus.start));

    List<String> words = name.split(' ');
    String code = words.map((word) => word[0]).join();
    try {
      DialogLoading.showLoading();

      final response = await otherService.updateDepartment(
          id,
          CreateOrEditDepartmentRequest(
              name: name, code: code, description: description));
      DialogLoading.hideLoading();

      getAllDepartment();
      AppToast.toastSuccess(response.message);
    } catch (e) {
      DialogLoading.hideLoading();

      logger.f(e);
    }
    emit(state.copyWith(status: DepartmentStatus.success));
  }

  void toggleCheckbox(int indexDepartment, int indexPermissionData) {
    emit(state.copyWith(status: DepartmentStatus.start));
    List<Department> newDepartments = state.departments;
    bool? check = newDepartments[indexDepartment]
        .permissionData[indexPermissionData]
        .check;
    newDepartments[indexDepartment].permissionData[indexPermissionData].check =
        !check!;
    emit(state.copyWith(
        departments: newDepartments, status: DepartmentStatus.success));
  }
}
