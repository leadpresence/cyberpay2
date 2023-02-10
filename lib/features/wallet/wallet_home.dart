import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../common/configs/routes/route_paths.dart';
import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import 'infow.dart';
import 'out_flow_transactions.dart';

///  WalletHome
class WalletHome extends StatefulWidget {
  /// constructor for [WalletHome]
  const WalletHome({Key? key}) : super(key: key);

  @override
  State<WalletHome> createState() => _WalletHomeState();
}

class _WalletHomeState extends State<WalletHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              onTap: () => Navigator.pop(context),
              child: const Icon(
                CupertinoIcons.back,
                color: AppColors.primary,
                size: 40,
              )),
        ),
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                  toolbarHeight: kToolbarHeight,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      'Wallet',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                  )),
              SliverToBoxAdapter(
                child: Container(
                    height: screenSize(context).height * 0.180,
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    width: screenSize(context).width - 90,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AppAssets.wallet_bg)),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
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
                                      fontWeight: FontWeight.w800)),
                          gapH8,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Text('₦',style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(color: AppColors.white,
                                  fontWeight: FontWeight.w800)),
                              SizedBox(
                                width: screenSize(context).width*0.4,
                                child: Text('2400000000000.000000000',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w800)),
                              ),
                            ],
                          ),
                          gapH8,
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppAssets.hide_balance),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              const SliverToBoxAdapter(child: gapH4),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  width: screenSize(context).width - 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          splashColor: AppColors.primary.withOpacity(0.3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          onTap: ()=>context.pushNamed(AppRoute.walletTopUp.name),
                          child: SvgPicture.asset(AppAssets.topup)),
                      InkWell(
                          splashColor: AppColors.primary.withOpacity(0.3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          onTap: ()=>context.pushNamed(AppRoute.walletWithdrawFund.name),
                          child: SvgPicture.asset(AppAssets.withdraw)),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: gapH24),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  // padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TabBar(
                    labelStyle: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 12.0,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
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
                          child: const Align(child: Text('INFLOW')),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Align(child: Text('OUTFLOW')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverFillRemaining(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    InflowTransactions(),
                   OutFlowTransactions(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
