import 'dart:async';

import 'package:cyberpay_mobile_2/core/configs/routes/route_paths.dart';
import 'package:cyberpay_mobile_2/core/configs/styles/app_assests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

/// Cyberpay Splash
class WelcomeSplash extends StatefulWidget {
  /// Cyberpay Splash Constructor
  const WelcomeSplash({Key? key}) : super(key: key);

  @override
  State<WelcomeSplash> createState() => _WelcomeSplashState();
}

class _WelcomeSplashState extends State<WelcomeSplash> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () {
          /// Check if user is logged in
              context.pushNamed(AppRoute.introView.name);
        });
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
        child: SvgPicture.asset(AppAssets.cyberpayLogo)
      ));

  }
}
