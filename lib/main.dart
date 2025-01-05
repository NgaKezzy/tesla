import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:telsa_mobile/common/local/local_storage.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/core/routers/app_router.dart';
import 'package:telsa_mobile/core/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  await setup();
  runApp(const App());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Đặt màu cho status bar
      statusBarIconBrightness: Brightness.dark, // Đặt màu icon (sáng hoặc tối)
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ToastificationWrapper(
        child: MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerConfig: AppRoutes().router,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
