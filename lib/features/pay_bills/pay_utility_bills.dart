import 'package:cyberpay_mobile_2/core/configs/routes/route_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/configs/styles/app_assests.dart';
import '../../core/configs/styles/app_colors.dart';
import '../../core/configs/styles/app_sizes.dart';
import '../../core/widgets/CustomExpandableCard.dart';

/// PayUtilityBills
class PayUtilityBills extends StatefulWidget {
  /// creates an instance of [PayUtilityBills]
  const PayUtilityBills({Key? key}) : super(key: key);

  @override
  State<PayUtilityBills> createState() => _PayUtilityBillsState();
}

class _PayUtilityBillsState extends State<PayUtilityBills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                CupertinoIcons.back,
                color: AppColors.primary,
                size: 40,
              )),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  toolbarHeight: kToolbarHeight,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Container(
                    margin: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      'Pay Utilities',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                  )),
              SliverToBoxAdapter(
                  child: Container(
                height: screenSize(context).width * 0.20,
                padding: EdgeInsets.only(left: 25, right: 25),
                width: screenSize(context).width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppAssets.search_bar_bg))

                    // ),
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
                            margin: EdgeInsets.only(left: 6, right: 6),
                            child: SvgPicture.asset(
                              AppAssets.search,
                              color: AppColors.primary,
                            ),
                          )),
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
              )),

              /// BODY ---->
              ///
              SliverToBoxAdapter(child: gapH16),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      PlanCard(
                        key: widget.key,
                        title: 'Electricity',
                        widget: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 10, right: 10, bottom: 16),
                            child: Container(
                              height: screenSize(context).height * 0.15,
                              width: screenSize(context).width,
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, top: 4, bottom: 4),
                              decoration:
                              BoxDecoration(color: AppColors.ligthBlue),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      context.pushNamed(AppRoute.electricityBillsPayment.name);

                                    },
                                      child: ProvidersCircleAirtimeData(color: AppColors.red,iconPath: AppAssets.ikeja,)),
                                  GestureDetector(
                                      onTap:(){
                                        context.pushNamed(AppRoute.electricityBillsPayment.name);
                                      },

                                      child: ProvidersCircleAirtimeData(color: AppColors.darkYellow,iconPath: AppAssets.ibadan,)),
                                  GestureDetector(
                                      onTap:(){
                                        context.pushNamed(AppRoute.electricityBillsPayment.name);
                                      },
                                      child: ProvidersCircleAirtimeData(color: AppColors.primary,iconPath: AppAssets.enugu,)),
                                  GestureDetector(
                                      onTap:(){},
                                      child: ProvidersCircleAirtimeData(color: AppColors.dark_blue,iconPath: AppAssets.eko,)),
                                GestureDetector(
                                      onTap:(){},
                                      child: ProvidersCircleAirtimeData(color: AppColors.midBlue,iconPath: AppAssets.jos,)),
                                ],
                              ),
                            ),
                          )

                        ],

                      ),
                      gapH16,
                      PlanCard(
                        key: widget.key,
                        title: 'Cable TV',
                        widget: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 10, right: 10, bottom: 16),
                            child: Container(
                              height: screenSize(context).height * 0.15,
                              width: screenSize(context).width,
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, top: 4, bottom: 4),
                              decoration:
                                  BoxDecoration(color: AppColors.ligthBlue),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap:(){
                                        context.pushNamed(AppRoute.cableBillsPayment.name);
                                      },
                                      child: ProvidersCircleAirtimeData(color: AppColors.darkred,iconPath: AppAssets.iroktv,)),
                                  GestureDetector(
                                      onTap:(){
                                        context.pushNamed(AppRoute.cableBillsPayment.name);

                                      },

                                      child: ProvidersCircleAirtimeData(color: AppColors.midBlue,iconPath: AppAssets.startimes,)),
                                  GestureDetector(
                                      onTap:(){
                                        context.pushNamed(AppRoute.cableBillsPayment.name);

                                      },
                                      child: ProvidersCircleAirtimeData(color: AppColors.green,iconPath: AppAssets.gotv,)),
                                  GestureDetector(
                                      onTap:()=>                 context.pushNamed(AppRoute.cableBillsPayment.name),

                                      child: ProvidersCircleAirtimeData(color: AppColors.primary,iconPath: AppAssets.dstv,)),
                                ],
                              )
                            ),
                          )
                        ],

                      ),
                      gapH16,
                      PlanCard(
                        key: widget.key,
                        title: 'Internet Services',
                        widget: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 10, right: 10, bottom: 16),
                            child: Container(
                              height: screenSize(context).height * 0.15,
                              width: screenSize(context).width,
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, top: 4, bottom: 4),
                              decoration:
                                  BoxDecoration(color: AppColors.ligthBlue),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap:(){
                                        context.pushNamed(AppRoute.internetServicesBillsPayment.name);
                                      },
                                      child: ProvidersCircleAirtimeData(color: AppColors.green,iconPath: AppAssets.smile,)),
                                  gapW8,
                                  GestureDetector(
                                      onTap:(){},

                                      child: ProvidersCircleAirtimeData(color: AppColors.primary,iconPath: AppAssets.cyberSpace,)),
                                ],
                              )
                            ),
                          )
                        ],

                      ),
                      gapH16,
                      PlanCard(
                        key: widget.key,
                        title: 'Transport & Tolls',
                        widget: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 10, right: 10, bottom: 16),
                            child: Container(
                              height: screenSize(context).height * 0.15,
                              width: screenSize(context).width,
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, top: 4, bottom: 4),
                              decoration:
                                  BoxDecoration(color: AppColors.ligthBlue),
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap:(){
                                        context.pushNamed(AppRoute.lccServicesBillsPayment.name);
                                      },
                                      child: ProvidersCircleAirtimeData(color: AppColors.lightBrown,iconPath: AppAssets.lcc,)),
                               ],
                              )
                            ),
                          )
                        ],

                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class ProvidersCircleAirtimeData extends StatelessWidget {
  const ProvidersCircleAirtimeData(
      {Key? key, required this.color, required this.iconPath})
      : super(key: key);

  final Color? color;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: color ?? AppColors.red),
      child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.white),
          child:Center(child: Image.asset(iconPath??'')),),
    );
  }
}
