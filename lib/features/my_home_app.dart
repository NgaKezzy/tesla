import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/features/contract/contract_page.dart';
import 'package:telsa_mobile/features/customer/customer_provider/customer_provider_page.dart';
import 'package:telsa_mobile/features/notification/notification_page.dart';
import 'package:telsa_mobile/features/other/other_provider/other_provider_page.dart';
import 'package:telsa_mobile/features/report/report_provider/report_provider_page.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  int pageIndex = 0;
  List<Widget> pages = [
    const ReportProviderPage(),
    const ContractPage(),
    const CustomerProviderPage(),
    const NotificationPage(),
    const OtherProviderPage(),
  ];

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: IndexedStack(
          index: pageIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIndex,
          unselectedIconTheme: const IconThemeData(color: Colors.green),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: AppColors.grey,
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: const TextStyle(fontSize: 10),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.svg.chartSquare.path,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Báo cáo',
              activeIcon: SvgPicture.asset(
                Assets.svg.chartSquare.path,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),

            // news
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.svg.calendar.path,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Hợp đồng',
              activeIcon: SvgPicture.asset(
                Assets.svg.calendar.path,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),

            // more
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.svg.usersGroup.path,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Khách hàng',
              activeIcon: SvgPicture.asset(
                Assets.svg.usersGroup.path,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.svg.bell.path,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Thông báo',
              activeIcon: SvgPicture.asset(
                Assets.svg.bell.path,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.svg.menu.path,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Khác',
              activeIcon: SvgPicture.asset(
                Assets.svg.menu.path,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
