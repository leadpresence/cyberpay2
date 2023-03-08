import 'package:cyberpay_mobile_2/common/configs/styles/app_sizes.dart';
import 'package:cyberpay_mobile_2/features/account/tab_settings_home.dart';
import 'package:cyberpay_mobile_2/features/account/tab_update_personal_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_colors.dart';


/// AccountHome
class AccountHome extends StatefulWidget {
  /// Creates and instance of [AccountHome]
  const AccountHome({Key? key}) : super(key: key);

  @override
  State<AccountHome> createState() => _AccountHomeState();
}

class _AccountHomeState extends State<AccountHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  CupertinoIcons.back,
                  color: AppColors.primary,
                  size: 40,
                ),),
          ),
          body: SafeArea(
              child: Listener(
            onPointerDown: (_) {
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                currentFocus.focusedChild?.unfocus();
              }
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child:   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 88.2,
                          height: 90,
                          child: SvgPicture.asset(AppAssets.avatar),
                        ),
                      ],
                    ), ),
               const  SliverToBoxAdapter(child: gapH16),
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      flexibleSpace: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.31),
                              ),
                            ),
                            child: TabBar(
                              labelStyle: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,),
                              unselectedLabelStyle:const TextStyle(
                                  fontSize: 12.0,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,),
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
                                    child:const Align(child: Text(' Personal Details')),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child:const Align(child: Text('Security')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                      const SliverFillRemaining(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          TabUpdatePersonalDetails(),
                          TabSettings(),
                        ],
                      ),
                    ),

                  ],),),
          ),),),
    );
  }
}
