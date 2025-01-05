import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        Assets.animations.newAnimEmpty,
        height: 350,
      ),
    );
  }
}

