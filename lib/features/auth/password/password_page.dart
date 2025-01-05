import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:telsa_mobile/common/widgets/button/solid_button.dart';
import 'package:telsa_mobile/common/widgets/text_field/out_line_text_field.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    var top = MediaQuery.of(context).padding.top;
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
              top: top,
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
                OutlineTextFormField(
                  hintText: 'Mật khẩu mới',
                  fillColor: AppColors.thinnestGrey,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.svg.lock.svg(),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.svg.eye.svg(),
                  ),
                ),
                const Gap(16),
                OutlineTextFormField(
                  hintText: 'Nhập lại mật khẩu',
                  fillColor: AppColors.thinnestGrey,
                  obscureText: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.svg.lock.svg(),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.svg.eye.svg(),
                  ),
                ),
                const Gap(24),
                SolidButton(onTap: () {}, title: 'Lưu'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Quay về trang'),
              TextButton(
                // onPressed: () => context.push(AppRouteConstant.userNamePage),
                onPressed: () {},
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
