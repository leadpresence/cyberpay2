import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/configs/styles/app_assests.dart';
import '../../common/widgets/custom_list_item.dart';

/// TabSettings
class TabSettings extends StatefulWidget {
  /// creates an instance of [ TabSettings]
  const TabSettings({Key? key}) : super(key: key);
  @override
  State<TabSettings> createState() => _TabSettingsState();
}

class _TabSettingsState extends State<TabSettings> {
  @override
  Widget build(BuildContext context) {

    return
      SingleChildScrollView(
        child: Column(
          children: const [
            CustomListItem(
            title: 'Enable Biometric login',
            imagePath: AppAssets.wallet_ic,
            noIcon: true,
          ),

          CustomListItem(
            title: 'Change Password',
            imagePath: AppAssets.bank_card_ic,
            noIcon: true,
          ),

          CustomListItem(
            title: 'Change Transaction Pin',
            imagePath: AppAssets.download_document,
            noIcon: true,
          ),

          CustomListItem(
            title: 'Account Verification',
            imagePath: AppAssets.qr_code_ic,
            noIcon: true,
          ),

          CustomListItem(
            title: 'Delete Account',
            imagePath: AppAssets.refer_a_friend,
            noIcon: true,
          ),

        ],
        ),
      );
  }
}
