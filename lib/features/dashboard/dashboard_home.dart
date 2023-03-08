import 'dart:math' as math;

import 'package:cyberpay_mobile_2/common/configs/routes/route_paths.dart';
import 'package:cyberpay_mobile_2/common/configs/styles/app_colors.dart';
import 'package:cyberpay_mobile_2/common/configs/styles/app_sizes.dart';
import 'package:cyberpay_mobile_2/common/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../common/configs/styles/app_assests.dart';

/// Home to Cyberpay app
class DashboardHome extends StatefulWidget {
  /// Creates Instance of [DashboardHome]
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// -->START
    /// Initialization of responsive  Sizes of grids
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double itemHeight =
        (screenSize(context).height - kToolbarHeight - statusBarHeight) / 3;
    final double itemWidth = screenSize(context).width / 2;

    /// <--- END

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
              backgroundColor: AppColors.blue_form,
              pinned: true,
              elevation: kToolbarHeight * 2,
              leading: const SizedBox.shrink(),
              actions: [
                InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  splashColor: AppColors.primary.withOpacity(0.3),
                  onTap: () {
                    // context.pushNamed(AppRoute.profileView.name);
                  },
                    child: SvgPicture.asset(AppAssets.settings),),
                InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  splashColor: AppColors.primary.withOpacity(0.3),
                  onTap: () {
                    // context.pushNamed(AppRoute.transactions.name);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0, left: 8),
                    child: SvgPicture.asset(AppAssets.notifications),
                  ),
                ),
              ],
              centerTitle: true,
              title: Container(
                margin: const EdgeInsets.only(bottom: 20, top: 10),
                height: 30,
                child: Center(child: SvgPicture.asset(AppAssets.cyberpayLogo),),
              ),),
          SliverToBoxAdapter(
              child: Container(
            height: 80,
            padding: const EdgeInsets.only(left: 25, right: 25),
            width: screenSize(context).width,
            decoration: const BoxDecoration(
              color: Colors.grey,
              gradient: LinearGradient(
                colors: [
                  AppColors.dark_blue,
                  AppColors.dark_blue,
                  AppColors.primary,
                  AppColors.primary,
                  AppColors.primary,
                  AppColors.primary,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0, 0.2, 0.6, 0.6, 0.8, 1],
              ),
            ),
            child: Center(
              child: SizedBox(
                height: 44,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                      fillColor: AppColors.white,
                      hintText: 'Search',
                      prefix: Container(
                        margin: const EdgeInsets.only(left: 6, right: 6),
                        child: SvgPicture.asset(
                          AppAssets.search,
                          color: AppColors.primary,
                        ),
                      ),),
                  onChanged: (String? value) {
                    setState(() {});
                  },
                  cursorColor: Colors.black12,
                  // keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (_) {},
                ),
              ),
            ),
          ),),
          const SliverToBoxAdapter(child: gapH12),
          SliverToBoxAdapter(
            child: Container(
                height: screenSize(context).height * 0.180,
                margin: const EdgeInsets.symmetric(horizontal: 18),
                padding:const EdgeInsets.only(left: 25, right: 25),
                width: screenSize(context).width - 90,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppAssets.wallet_bg,),),
                    borderRadius: BorderRadius.all(Radius.circular(8),),),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text('Wallet Balance',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w800,),),
                      gapH8,
                    SizedBox(
                      width: screenSize(context).width*0.3,
                      height: 40,
                      child: Wrap(
                          children: [
                            Text('₦',style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: AppColors.white,
                                fontWeight: FontWeight.w800,),),
                            Text('0.00',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w800,),),],
                        ),
                    ),
                      gapH8,
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.4),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                              height: 20,
                              width: 65,
                              child: Text(
                                '',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                            SvgPicture.asset(AppAssets.hide_balance),
                            InkWell(
                              splashColor: AppColors.primary.withOpacity(0.3),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                              onTap: ()=>context.pushNamed(AppRoute.walletTopUp.name),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                height: 20,
                                width: 65,
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Text(
                                  'TOP-UP',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.bold,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),),
          ),
         const SliverToBoxAdapter(child: gapH8),
          SliverToBoxAdapter(
              child: Container(
            padding:const  EdgeInsets.symmetric(vertical: 15, horizontal: 18),
            margin:const  EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  offset:const  Offset(2, 12),
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 20,
                ),
              ],
            ),
            height: screenSize(context).height * 0.14,
            child: ListTile(
              leading: CircularPercentIndicator(
                radius: 28.0,
                lineWidth: 4.0,
                percent: 0.7,
                center:const  Text('30%'),
                progressColor: AppColors.green,
                animation: true,
              ),
              title: Text('Complete Profile',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w800,),),
              trailing: InkWell(
                  onTap: () {
                    context.pushNamed(AppRoute.faceVerificationView.name);
                  },
                  child: SvgPicture.asset(AppAssets.chevron_right),),
              subtitle: const Text(
                'Verify your details to allow you receive & send money',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),),
          const    SliverToBoxAdapter(child: gapH24),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SizedBox(
              height: screenSize(context).height * 0.28,
              width: screenSize(context).width,
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 1,
                shrinkWrap: false,
                children: List.generate(6, (index) {
                  return GestureDetector(
                    onTap: (){
                      if (index==0) {
                        /// Send
                        context.pushNamed(AppRoute.sendMoney.name);
                      } else if (index==1) {
                        /// Receive
                        context.pushNamed(AppRoute.receiveMoney.name);
                      } else if (index==2) {
                       /// Bills
                        context.pushNamed(AppRoute.payUtilityBills.name);
                      } else if (index==3) {
                        /// Airtime & Data
                        context.pushNamed(AppRoute.airtimeAndData.name);
                      } else if (index==4) {
                        /// virtualCardView
                        context.pushNamed(AppRoute.virtualCardView.name);
                      } else if (index==5) {
                        /// gaming
                        // context.pushNamed(AppRoute.gaming.name);
                      }
                    },
                    child: GridItemContainer(
                      imagePath: dashboardImageList[index],
                      title: dashboardHeadings[index],

                    ),
                  );
                }),
              ),
            ),
          ),),
        ],
      ),
    );
  }
}


/// GridItemContainer
class GridItemContainer extends StatelessWidget {
  /// Creates an instance of [GridItemContainer]
  GridItemContainer(
      {Key? key,
      required this.imagePath,
      required this.title,
      this.onOptionTap})
      : super(key: key);

  /// path to image
  final String imagePath;

  /// title of option
  final String title;

  /// Call back when option is tapped
  final Function? onOptionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.all(12),
      height: screenSize(context).height * 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(width: 0.5, color: AppColors.primary),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            offset:const  Offset(0, 10),
            color: Colors.blue.withOpacity(0.05),
            blurRadius: 14,
          ),
        ],
      ),
      child: Column(
        children: [
          SvgPicture.asset(imagePath),
          gapH16,
          Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w800,),
              // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
        ],
      ),
    );
  }


}
