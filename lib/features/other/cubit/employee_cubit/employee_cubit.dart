import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import "package:collection/collection.dart";
import 'package:telsa_mobile/common/models/request/create_employee_request.dart';
import 'package:telsa_mobile/common/services/other_service.dart';
import 'package:telsa_mobile/common/widgets/loading/dialog_loading.dart';
import 'package:telsa_mobile/common/widgets/toast/app_toast.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/other/cubit/employee_cubit/employee_state.dart';
import 'package:telsa_mobile/features/other/models/employee/employee.dart';
import 'package:telsa_mobile/features/other/models/employee/group_employee.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  final OtherService otherService;
  final Logger logger = di.get();
  EmployeeCubit(this.otherService) : super(const EmployeeState());

  Future<void> getAllEmployee() async {
    try {
      final response = await otherService.getAllEmployee(1, 10);
      emit(state.copyWith(employees: response.data));
      if (response.data != null) {
        List<Employee> map = response.data ?? [];
        for (var element in map) {
          logger.d(element.departmentData.name);
        }

        var items = groupBy<Employee, String>(
            map, (Employee obj) => obj.departmentData.name);

        List<GroupEmployee> groups = items.entries
            .map((e) => GroupEmployee(employees: e.value, role: e.key))
            .toList();
        emit(state.copyWith(groupEmployees: groups));
        // logger.i(groups);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> createEmployee({
    String fullName = '',
    bool isCreateAccount = true,
    String username = '',
    String password = '',
    String code = '',
    int departmentId = -1,
    String position = '',
    String phoneNumber = '',
    String email = '',
    String gender = '',
    String address = '',
    String description = '',
    String dob = '',
    String? avatar,
  }) async {
    try {
      DialogLoading.showLoading();

      final response = await otherService.createEmployee(
        fullName,
        isCreateAccount,
        username,
        password,
        code,
        departmentId,
        position,
        phoneNumber,
        email,
        gender,
        address,
        description,
        dob,
        avatar != null ? File(avatar) : null,
      );
      DialogLoading.hideLoading();
      getAllEmployee();
      AppToast.toastSuccess(response.message);
    } catch (e, stackTrace) {
      DialogLoading.hideLoading();

      logger.e(e);
      logger.e(stackTrace);
    }
  }

  Future<void> updateEmployee({
    int id = -1,
    String fullName = '',
    bool isCreateAccount = true,
    String username = '',
    String password = '',
    String code = '',
    int departmentId = -1,
    String position = '',
    String phoneNumber = '',
    String email = '',
    String gender = '',
    String address = '',
    String description = '',
    String dob = '',
    String? avatar,
  }) async {
    try {
      DialogLoading.showLoading();

      final response = await otherService.updateEmployee(
        id,
        fullName,
        isCreateAccount,
        username,
        password,
        code,
        departmentId,
        position,
        phoneNumber,
        email,
        gender,
        address,
        description,
        dob,
        avatar != null ? File(avatar) : null,
      );
      DialogLoading.hideLoading();

      AppToast.toastSuccess(response.message);
      getAllEmployee();
    } catch (e, stackTrace) {
      DialogLoading.hideLoading();

      logger.e(e);
      logger.e(stackTrace);
    }
  }

  Future<void> deleteEmployee(Employee employee) async {
    try {
      DialogLoading.showLoading();

      final response = await otherService.deleteEmployee(employee.id);
      DialogLoading.hideLoading();
      AppToast.toastSuccess(response.message);
      getAllEmployee();
    } catch (e) {
      DialogLoading.hideLoading();

      logger.e(e);
    }
  }
}
