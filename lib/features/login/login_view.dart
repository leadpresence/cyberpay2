import 'package:cyberpay_mobile_2/core/configs/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/configs/styles/app_assests.dart';
import '../../core/configs/styles/app_sizes.dart';
import 'login_with_email.dart';
import 'login_with_phone.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {

    return
      DefaultTabController(
        length: 2,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Container(
                  margin: EdgeInsets.only(bottom: 20, top: 10),
                  height: 30,
                  child:
                      Center(child: SvgPicture.asset(AppAssets.cyberpayLogo))),
            ),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      toolbarHeight: 140,
                      automaticallyImplyLeading: false,
                      flexibleSpace: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: AppColors.red),
                          ),
                          gapH8,
                          Text(
                            'Login to your account. ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey),
                          ),
                          gapH24,
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.31),
                              ),
                            ),
                            child: TabBar(

                              labelStyle:TextStyle(color: AppColors.white,fontSize: 12.0,fontWeight: FontWeight.bold),
                              unselectedLabelStyle: TextStyle(fontSize: 12.0,color: AppColors.white,fontWeight: FontWeight.bold),
                              labelPadding: const EdgeInsets.all(0),
                              unselectedLabelColor: AppColors.dark_blue,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.dark_blue,
                              ),
                              tabs: [
                                Tab(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child:   Align(
                                        child: Text('EMAIL ADDRESS')
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child:   Align(
                                        child: Text('PHONE NUMBER')),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          LoginWithEmail(),
                          LoginWithPhone(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
