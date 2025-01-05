import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/widgets/button/solid_button.dart';
import 'package:telsa_mobile/common/widgets/text_field/out_line_text_field.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';

class UserNamePage extends StatelessWidget {
  const UserNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 44,
            ).copyWith(
              top: MediaQuery.of(context).padding.top,
            ),
            child: Column(
              children: [
                const Gap(44),
                const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: AppColors.primary,
                ),
                const Gap(44),
                const Text(
                  'Nhập tên đăng nhập',
                ),
                const Gap(16),
                OutlineTextFormField(
                  hintText: 'Nhập email của bạn',
                  fillColor: AppColors.thinnestGrey,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.svg.user.svg(),
                  ),
                ),
                const Gap(24),
                SolidButton(
                  title: 'Tiếp tục',
                  onTap: () {
                    context.push(AppRouteConstant.otpPage);
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bạn đã có tài khoản?',
              ),
              TextButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed('/login');
                },
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
