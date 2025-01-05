import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:telsa_mobile/core/gen/assets.gen.dart';
import 'package:telsa_mobile/features/other/widgets/build_account_section_row.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key, required this.accountItems});

  final List<AccountItem> accountItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tài khoản',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15,
              )),
          ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BuildAccountSectionRow(
                  icon: accountItems[index].icon,
                  title: accountItems[index].title,
                  onTap: accountItems[index].onTap,
                ),
              );
            },
            itemCount: accountItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}

class AccountItem {
  final String icon;
  final String title;
  final Function() onTap;

  AccountItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
