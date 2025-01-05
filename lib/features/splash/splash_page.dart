import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/local/local_storage.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    SharedPrefs sharedPrefs = SharedPrefs();
    bool isLogin = sharedPrefs.getIsRememberLogin() ?? false;

    Timer(const Duration(seconds: 3), () {
      if (isLogin) {
        context.push(AppRouteConstant.myHomeApp);
      } else {
        context.push(AppRouteConstant.loginPage);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash',
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w500,
              color: AppColors.primary),
        ),
      ),
    );
  }
}
