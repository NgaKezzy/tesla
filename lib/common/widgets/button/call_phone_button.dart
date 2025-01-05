import 'package:flutter/material.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/core/launcher/app_launcher.dart';

class CallPhoneButton extends StatelessWidget {
  const CallPhoneButton({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF33A867),
      ),
      child: InkWell(
        onTap: () async {
          // Call phone number
          await AppLauncher.instance.makePhoneCall(phoneNumber);
        },
        child: SizedBox(
          width: 30,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Assets.svg.phone.svg(),
          ),
        ),
      ),
    );
  }
}
