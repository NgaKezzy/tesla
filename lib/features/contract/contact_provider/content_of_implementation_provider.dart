import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telsa_mobile/features/contract/cubit/contract_cubit.dart';
import 'package:telsa_mobile/features/contract/screen/content_of_implementation_screen.dart';

class ContentOfImplementationProvider extends StatelessWidget {
  const ContentOfImplementationProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContractCubit(),
      child: const ContentOfImplementationScreen(),
    );
  }
}
