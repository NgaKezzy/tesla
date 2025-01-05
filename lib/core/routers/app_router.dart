import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/features/auth/login/login_provider/login_provider_page.dart';
import 'package:telsa_mobile/features/auth/otp/otp_provider/otp_provider_page.dart';
import 'package:telsa_mobile/features/auth/password/password_provider/password_provider_page.dart';
import 'package:telsa_mobile/features/auth/register_or_forgot_password/user_name_provider/user_name_provider_page.dart';
import 'package:telsa_mobile/features/contract/contact_provider/content_of_implementation_provider.dart';
import 'package:telsa_mobile/features/contract/screen/content_of_implementation_screen.dart';
import 'package:telsa_mobile/features/contract/screen/detail_contract_screen.dart';
import 'package:telsa_mobile/features/contract/screen/implementation_process_screen.dart';
import 'package:telsa_mobile/features/customer/customer_provider/create_or_edit_customer_provider_page.dart';
import 'package:telsa_mobile/features/customer/customer_provider/customer_provider_page.dart';
import 'package:telsa_mobile/features/customer/model/customer.dart';
import 'package:telsa_mobile/features/other/department/department_provider/create_or_edit_department_provider_page.dart';
import 'package:telsa_mobile/features/other/department/department_provider/department_provider_page.dart';
import 'package:telsa_mobile/features/other/models/product/product.dart';
import 'package:telsa_mobile/features/other/product/product_provider_page/create_or_edit_product_provider_page.dart';
import 'package:telsa_mobile/features/other/employee/employee_provider/create_or_edit_employee_provider_page.dart';
import 'package:telsa_mobile/features/other/employee/employee_provider/employee_provider_page.dart';
import 'package:telsa_mobile/features/other/models/department/department.dart';
import 'package:telsa_mobile/features/other/models/employee/employee.dart';
import 'package:telsa_mobile/features/other/other_provider/other_provider_page.dart';
import 'package:telsa_mobile/features/other/product/product_provider_page/product_provider_page.dart';
import 'package:telsa_mobile/features/report/report_provider/report_provider_page.dart';
import 'package:telsa_mobile/features/my_home_app.dart';
import 'package:telsa_mobile/features/splash/splash_page.dart';

class AppRouteConstant {
  AppRouteConstant._();

  static const String initial = '/';
  static const String myHomeApp = '/my-home-app';

  // Auth
  static const String loginPage = '/login-page';
  static const String userNamePage = '/user-name-page';
  static const String otpPage = '/otp-page';
  static const String passwordPage = '/password-page';

  // report
  static const String reportPage = '/report-page';

  // contract
  static const String detailContractScreen = '/detail-contract-screen';
  static const String implementationProcessScreen =
      '/implementation-process-screen';
  static const String contentOfImplementationScreen =
      '/content-Of-Implementation-Screen';

  // customer
  static const String customerPage = '/customer-page';
  static const String createOrEditCustomerProviderPage =
      '/create-or-edit-customer-page';

  // notification

  //other
  static const String otherPage = '/other-page';
  static const String departmentProviderPage = '/department-provider-page';
  static const String createOrEditDepartmentProviderPage =
      '/create-department-page';
  static const String deviceProviderPage = '/device-provider-page';
  static const String createOrEditProductProviderPage =
      '/create-or-edit-product-provider-page';

  static const String employeeScreen = '/employee-screen';
  static const String createOrEditEmployeePage =
      '/create-or-edit-employee-page';

  // Nested Key
  static final navigatorKeyMeansure = GlobalKey<NavigatorState>();
}

class AppRoutes {
  static final AppRoutes _singleton = AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal();

  GoRouter router = GoRouter(
    initialLocation: AppRouteConstant.initial,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouteConstant.initial,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashPage(),
      ),
      GoRoute(
        path: AppRouteConstant.reportPage,
        builder: (BuildContext context, GoRouterState state) =>
            const ReportProviderPage(),
      ),
      GoRoute(
        path: AppRouteConstant.loginPage,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginProviderPage(),
      ),
      GoRoute(
        path: AppRouteConstant.userNamePage,
        builder: (BuildContext context, GoRouterState state) =>
            const UserNameProviderPage(),
      ),
      GoRoute(
        path: AppRouteConstant.otpPage,
        builder: (BuildContext context, GoRouterState state) =>
            const OtpProviderPage(),
      ),
      GoRoute(
        path: AppRouteConstant.passwordPage,
        builder: (BuildContext context, GoRouterState state) =>
            const PasswordProviderPage(),
      ),
      GoRoute(
        path: AppRouteConstant.otherPage,
        builder: (BuildContext context, GoRouterState state) =>
            const OtherProviderPage(),
      ),
      GoRoute(
        path: AppRouteConstant.myHomeApp,
        builder: (BuildContext context, GoRouterState state) =>
            const MyHomeApp(),
      ),
      GoRoute(
        path: AppRouteConstant.departmentProviderPage,
        builder: (BuildContext context, GoRouterState state) =>
            const DepartmentProviderPage(),
      ),
      GoRoute(
        path: AppRouteConstant.createOrEditDepartmentProviderPage,
        builder: (BuildContext context, GoRouterState state) =>
            CreateOrEditDepartmentProviderPage(
                department: state.extra is Department
                    ? state.extra as Department
                    : null),
      ),
      GoRoute(
        path: AppRouteConstant.employeeScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const EmployeeProviderPage(),
      ),
      GoRoute(
        path: AppRouteConstant.createOrEditEmployeePage,
        builder: (BuildContext context, GoRouterState state) =>
            CreateOrEditEmployeeProviderPage(
          employee: state.extra is Employee ? state.extra as Employee : null,
        ),
      ),
      GoRoute(
        path: AppRouteConstant.deviceProviderPage,
        builder: (BuildContext context, GoRouterState state) =>
            const ProductProviderPage(),
      ),
      GoRoute(
        path: AppRouteConstant.createOrEditProductProviderPage,
        builder: (BuildContext context, GoRouterState state) =>
            CreateOrEditProductProviderPage(
          product: state.extra is Product ? state.extra as Product : null,
        ),
      ),
      GoRoute(
        path: AppRouteConstant.customerPage,
        builder: (BuildContext context, GoRouterState state) =>
            const CustomerProviderPage(),
      ),
      GoRoute(
        path: AppRouteConstant.createOrEditCustomerProviderPage,
        builder: (BuildContext context, GoRouterState state) =>
            CreateOrEditCustomerProviderPage(
          customer: state.extra is Customer ? state.extra as Customer : null,
        ),
      ),
      GoRoute(
        path: AppRouteConstant.detailContractScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const DetailContractScreen(),
      ),
      GoRoute(
        path: AppRouteConstant.implementationProcessScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const ImplementationProcessScreen(),
      ),
      GoRoute(
        path: AppRouteConstant.contentOfImplementationScreen,
        builder: (BuildContext context, GoRouterState state) =>
            const ContentOfImplementationProvider(),
      ),
    ],
  );
}
