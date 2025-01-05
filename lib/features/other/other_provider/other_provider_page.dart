import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:telsa_mobile/features/other/cubit/other_cubit.dart';
import 'package:telsa_mobile/features/other/other_page.dart';

class OtherProviderPage extends StatelessWidget {
  const OtherProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = di.get();
    return BlocProvider.value(
      value: authCubit,
      child: const OtherPage(),
    );
  }
}
