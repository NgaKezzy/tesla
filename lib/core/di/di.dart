import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:telsa_mobile/common/services/customer_service.dart';
import 'package:telsa_mobile/common/services/other_service.dart';
import 'package:telsa_mobile/core/dio/app_dio.dart';
import 'package:telsa_mobile/common/services/auth_service.dart';
import 'package:telsa_mobile/core/logger/app_logger.dart';
import 'package:telsa_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:telsa_mobile/features/customer/cubit/customer_cubit.dart';
import 'package:telsa_mobile/features/other/cubit/employee_cubit/employee_cubit.dart';
import 'package:telsa_mobile/features/other/cubit/department_cubit/department_cubit.dart';
import 'package:telsa_mobile/features/other/cubit/product_cubit/product_cubit.dart';

final di = GetIt.instance;

Future<void> setup() async {
  di.registerSingleton<Logger>(AppLogger().provideLogger());
  di.registerSingleton<Dio>(AppNetwork().provideDio());

  // service
  di.registerSingleton<AuthService>(AuthService(di.get()));
  di.registerSingleton<OtherService>(OtherService(di.get()));
  di.registerSingleton<CustomerService>(CustomerService(di.get()));

  // cubit
  di.registerSingleton<AuthCubit>(AuthCubit(authService: di.get()));
  di.registerSingleton<EmployeeCubit>(EmployeeCubit(di.get()));
  di.registerSingleton<DepartmentCubit>(DepartmentCubit(di.get()));
  di.registerSingleton<ProductCubit>(ProductCubit(otherService: di.get()));
  di.registerSingleton<CustomerCubit>(CustomerCubit(customerService: di.get()));
}
