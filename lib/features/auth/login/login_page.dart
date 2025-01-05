import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:telsa_mobile/common/widgets/button/solid_button.dart';
import 'package:telsa_mobile/common/widgets/text_field/out_line_text_field.dart';
import 'package:telsa_mobile/common/widgets/toast/app_toast.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';
import 'package:telsa_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:telsa_mobile/features/auth/cubit/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthCubit authCubit = di.get();
  bool _isSavePassword = false;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    userNameController.text = 'admin';
    passwordController.text = '123456';
    super.initState();
  }

  void _onSavePasswordChanged(bool? value) {
    setState(() {
      _isSavePassword = value ?? false;
    });
  }

  @override
  void dispose() {
    userNameController.clear();
    passwordController.clear();
    super.dispose();
  }

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
                  textInputAction: TextInputAction.next,
                  controller: userNameController,
                  hintText: 'Tên đăng nhập/Email',
                  fillColor: AppColors.thinnestGrey,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Assets.svg.user.svg(),
                  ),
                ),
                const Gap(16),
                OutlineTextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  hintText: 'Mật khẩu',
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
                const Gap(4),
                Row(
                  children: [
                    Checkbox(
                      value: _isSavePassword,
                      onChanged: _onSavePasswordChanged,
                    ),
                    const Text(
                      "Giữ tôi luôn đăng nhập",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Quên mật khẩu?',
                          style: TextStyle(fontSize: 10)),
                    ),
                  ],
                ),
                const Gap(16),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state.isSignInSuccess == true) {
                      context.push(AppRouteConstant.myHomeApp);
                    }
                  },
                  child: SolidButton(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        authCubit.signIn(
                            isRememberLogin: _isSavePassword,
                            username: userNameController.text,
                            password: passwordController.text);
                      },
                      title: 'Đăng nhập'),
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
              const Text('Bạn chưa có tài khoản?'),
              TextButton(
                onPressed: () => context.push(AppRouteConstant.userNamePage),
                child: const Text('Kích hoạt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
