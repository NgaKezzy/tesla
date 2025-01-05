import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/widgets/app_bar/custom_app_bar.dart';
import 'package:telsa_mobile/common/widgets/box/custom_box.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';
import 'package:telsa_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:telsa_mobile/features/other/widgets/account_section.dart';
import 'package:telsa_mobile/features/other/widgets/category_section.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  late AuthCubit authCubit;
  late List<CategoryItem> items;
  late List<AccountItem> accountItems;

  @override
  void initState() {
    super.initState();
    authCubit = BlocProvider.of<AuthCubit>(context);
    items = [
      CategoryItem(
        title: 'Phòng ban',
        icon: Assets.svg.department.path,
        onTap: () {
          context.push(AppRouteConstant.departmentProviderPage);
        },
        color: const Color(0xFFFF5400),
      ),
      CategoryItem(
        title: 'Nhân viên',
        icon: Assets.svg.user.path,
        onTap: () => context.push(AppRouteConstant.employeeScreen),
        color: AppColors.primary,
      ),
      CategoryItem(
        title: 'Thiết bị',
        icon: Assets.svg.device.path,
        onTap: () => context.push(AppRouteConstant.deviceProviderPage),
        color: AppColors.grey,
      ),
    ];
    accountItems = [
      AccountItem(
        icon: Assets.svg.user.path,
        title: 'Thông tin tài khoản',
        onTap: () {},
      ),
      AccountItem(
        icon: Assets.svg.logout.path,
        title: 'Đăng xuất',
        onTap: () {
          authCubit.logout();
          context.push(AppRouteConstant.initial);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Khác',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: topPadding + 16),
          child: Column(
            children: [
              CustomBox(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                child: CategorySection(
                  items: items,
                ),
              ),
              const Gap(16),
              CustomBox(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                child: AccountSection(
                  accountItems: accountItems,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
