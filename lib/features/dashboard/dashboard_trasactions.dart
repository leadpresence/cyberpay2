import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../common/configs/routes/route_paths.dart';
import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../../common/widgets/wallet_transaction.dart';


/// StatefulWidget Transactions
class Transactions extends StatefulWidget {
  /// create constructor [Transactions]
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                  toolbarHeight: kToolbarHeight,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Text(
                    'Transactions',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.bold),
                  )),
              const SliverToBoxAdapter(child: gapH16),
              SliverToBoxAdapter(
                child: Container(
                    height: screenSize(context).height * 0.180,
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    padding:const EdgeInsets.only(left: 25, right: 25),
                    width: screenSize(context).width - 90,
                    decoration: const  BoxDecoration(
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
                          SizedBox(
                            width: screenSize(context).width*0.3,
                            height: 40,
                            child: Wrap(
                              children: [
                                Text('₦',style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(color: AppColors.white,
                                    fontWeight: FontWeight.w800)),
                                Text('0.00',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge
                                        ?.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w800))],
                            ),
                          ),
                          gapH8,
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              const SizedBox(width:   65,),
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
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              const SliverToBoxAdapter(child: gapH8),
              SliverFillRemaining(
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return const WalletTransaction(isInflow: true);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
