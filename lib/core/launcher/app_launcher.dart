import 'package:url_launcher/url_launcher.dart';
class AppLauncher {
  AppLauncher._();

  static final AppLauncher instance = AppLauncher._();

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

}