
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

import '../configs/routes/route_paths.dart';
import '../configs/styles/app_assests.dart';

/// Class for all strings on application
class AppText{
  static const String getStartedTxt = 'GET STARTED';
  static const String kNext = 'NEXT';
}


/// List of CyberPay   headings texts onBoarding screens
const List<String> headingsTr = [
  'PAY BILLS WITH EASE',
  'SHOP WITH NO DELAYS',
  'BUSINESS ON YOUR PHONE',
];

/// List of CyberPay   dashbord texts
const List<String> dashboardHeadings = [
  'SEND MONEY',
  'RECEIVE MONEY',
  'PAY UTILITIES',
  'AIRTIME & DATA',
  'VIRTUAL CARD',
  'GAMING',
];


/// List of CyberPay sub headings texts onBoarding screens
const List<String> subHeadingsTr = [
  'Access all your needs in one place. Make \npayments to multiple service providers from \none safe & secure place.',
  'See it, Like it! Want it? Buy it. No delays.',
  'Access all your needs in one place. Make \npayments to multiple service providers from \none safe & secure place.',
];

/// List of images  for CyberPay on boarding screens
const List<String> imageListTr = [
  AppAssets.tr_onboarding1,
  AppAssets.tr_onboarding2,
  AppAssets.tr_onboarding3,
];

/// List of images  for CyberPay on boarding screens
const List<String> dashboardImageList = [
  AppAssets.send_money_coins,
  AppAssets.recieve_money,
  AppAssets.utility_bills,
  AppAssets.airtime_data,
  AppAssets.virtual_cards,
  AppAssets.gaming,
];

