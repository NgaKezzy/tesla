
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:telsa_mobile/common/widgets/button/solid_button.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';
import 'package:telsa_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:telsa_mobile/features/auth/cubit/auth_state.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late AuthCubit authCubit;

  @override
  void initState() {
    authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.emailResendTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: AppColors.primary,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.lightGrey),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.blue),
      ),
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 44,
              ).copyWith(
                top: MediaQuery.of(context).padding.top,
              ),
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const Gap(44),
                      const Icon(
                        Icons.account_circle,
                        size: 100,
                        color: AppColors.primary,
                      ),
                      const Gap(44),
                      const Text(
                        'Nhập mã xác nhận đã được gửi về Email:',
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'emailabc@gmail.com',
                          ),
                          Gap(8),
                          Text(
                            'Thay đổi',
                          ),
                        ],
                      ),
                      const Gap(16),
                      Pinput(
                        length: 4,
                        separatorBuilder: (index) => const Gap(8),
                        keyboardType: TextInputType.number,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        autofocus: true,
                        onCompleted: (value) {
                          context.push(AppRouteConstant.passwordPage);
                        },
                        onTap: () {},
                      ),
                      const Gap(16),
                      if (state.isEmailResendEnable)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Không nhận được mã?',
                            ),
                            TextButton(
                              onPressed: () {
                                if (!state.isEmailResendEnable) return;
                                authCubit.sendOtp();
                              },
                              child: const Text(
                                'Gửi lại',
                                style: TextStyle(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (!state.isEmailResendEnable)
                        Text(
                          '(Gửi lại sau ${state.emailResendTime}s)',
                          style: const TextStyle(color: AppColors.grey),
                        ),
                      const Gap(16),
                      SolidButton(
                        title: 'Xác nhận',
                        onTap: () {
                          // context.push(AppRouteConstant.otpPage);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
