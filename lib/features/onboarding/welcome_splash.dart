import 'dart:async';

import 'package:cyberpay_mobile_2/common/configs/routes/route_paths.dart';
import 'package:cyberpay_mobile_2/common/configs/styles/app_assests.dart';
import 'package:cyberpay_mobile_2/common/data/local/shared_pref_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/data/local/shared_preference_service.dart';

/// Cyberpay Splash
class WelcomeSplash extends ConsumerStatefulWidget {
  /// Cyberpay Splash Constructor
  const WelcomeSplash({Key? key}) : super(key: key);

  @override
  ConsumerState<WelcomeSplash> createState() => _WelcomeSplashState();
}

class _WelcomeSplashState extends ConsumerState<WelcomeSplash> {
  @override
  void initState() {
    super.initState();

    final sharedPref = ref.read(sharedPreferencesServiceProvider);
    Timer(
      const Duration(seconds: 3),
      () {
        /// Check if user is logged in
        if (sharedPref.isLoggedInValue) {
          debugPrint('IS_LOGGED_IN::=>${sharedPref.isLoggedInValue}');
          context.pushNamed(AppRoute.dashboardHome.name);
        }
        context.pushNamed(AppRoute.introView.name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: SvgPicture.asset(AppAssets.cyberpayLogo)),);
  }
}
