import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:telsa_mobile/features/auth/otp/otp_page.dart';

class OtpProviderPage extends StatelessWidget {
  const OtpProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = di.get();
    return BlocProvider.value(
      value: authCubit,
      child: const OtpPage(),
    );
  }
}
