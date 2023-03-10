import 'package:cyberpay_mobile_2/common/configs/routes/route_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../../common/widgets/CustomExpandableCard.dart';

/// AirtimeAndData
class AirtimeAndData extends StatefulWidget {
  /// creates an instance of [AirtimeAndData]
  const AirtimeAndData({Key? key}) : super(key: key);

  @override
  State<AirtimeAndData> createState() => _AirtimeAndDataState();
}

class _AirtimeAndDataState extends State<AirtimeAndData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child:const Icon(
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
                    margin: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      'Mobile Airtime & Data',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                  )),
              SliverToBoxAdapter(
                  child: Container(
                height: screenSize(context).width * 0.20,
                padding: const EdgeInsets.only(left: 25, right: 25),
                width: screenSize(context).width,
                decoration:const  BoxDecoration(
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
                            margin:const  EdgeInsets.only(left: 6, right: 6),
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
            const  SliverToBoxAdapter(child: gapH16),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      PlanCard(
                        widget: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 10, right: 10, bottom: 16),
                            child: Container(
                              height: screenSize(context).height * 0.15,
                              width: screenSize(context).width,
                              padding:const EdgeInsets.only(
                                  left: 16, right: 16, top: 4, bottom: 4),
                              decoration:
                             const BoxDecoration(color: AppColors.ligthBlue),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap:(){},
                                      child: const ProvidersCircleAirtimeData(color: AppColors.red,iconPath: AppAssets.airtel,)),
                                  GestureDetector(
                                      onTap:(){},

                                      child: const ProvidersCircleAirtimeData(color: AppColors.lemon,iconPath: AppAssets.nine_mobile,)),
                                  GestureDetector(
                                      onTap:(){
                                        context.pushNamed(AppRoute.airtimePurchaseDetails.name);
                                      },
                                      child:const ProvidersCircleAirtimeData(color: AppColors.green,iconPath: AppAssets.glo,)),
                                  GestureDetector(
                                      onTap:(){},
                                      child:const ProvidersCircleAirtimeData(color: AppColors.yellow,iconPath: AppAssets.mtn,)),
                                ],
                              ),
                            ),
                          )

                        ],
                        key: widget.key,
                        title: 'Mobile Airtime',
                      ),
                      gapH16,
                      PlanCard(
                        widget: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 10, right: 10, bottom: 16),
                            child: Container(
                              height: screenSize(context).height * 0.15,
                              width: screenSize(context).width,
                              padding:const EdgeInsets.only(
                                  left: 16, right: 16, top: 4, bottom: 4),
                              decoration:
                              const      BoxDecoration(color: AppColors.ligthBlue),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap:(){},
                                      child:const ProvidersCircleAirtimeData(color: AppColors.red,iconPath: AppAssets.airtel,)),
                                  GestureDetector(
                                      onTap:(){},

                                      child:const ProvidersCircleAirtimeData(color: AppColors.lemon,iconPath: AppAssets.nine_mobile,)),
                                  GestureDetector(
                                      onTap:(){},

                                      child:const ProvidersCircleAirtimeData(color: AppColors.green,iconPath: AppAssets.glo,)),
                                  GestureDetector(
                                      onTap:()=>context.pushNamed(AppRoute.dataPurchaseDetails.name),

                                      child:const ProvidersCircleAirtimeData(color: AppColors.yellow,iconPath: AppAssets.mtn,)),
                                ],
                              )
                            ),
                          )
                        ],
                        key: widget.key,
                        title: 'Mobile Data',
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
/// StatelessWidget for colors Circle
class ProvidersCircleAirtimeData extends StatelessWidget {
  /// Constructor for [ProvidersCircleAirtimeData]
  const ProvidersCircleAirtimeData(
      {Key? key, required this.color, required this.iconPath})
      : super(key: key);

  final Color? color;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.all(5),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: color ?? AppColors.red),
      child: Container(
          height: 35,
          width: 35,
          decoration:const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: Colors.white),
          child:Center(child: Image.asset(iconPath??'')),),
    );
  }
}
