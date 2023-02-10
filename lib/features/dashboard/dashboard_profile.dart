import 'package:cyberpay_mobile_2/common/configs/routes/route_paths.dart';
import 'package:cyberpay_mobile_2/common/configs/styles/app_assests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../../common/widgets/custom_list_item.dart';

/// Profile
class Profile extends StatefulWidget {
  /// Profile
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              CupertinoIcons.back,
              color: AppColors.primary,
              size: 40,
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  expandedHeight:kToolbarHeight/2,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      'Profile',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                  )),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 88.2,
                          height: 90,
                          child: SvgPicture.asset(AppAssets.avatar),
                        )
                      ],
                    ),
                    gapH8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Adanna Adebayo',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    gapH4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'adabayo@gmail.com',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    gapH4,
                    Container(
                      height: 30,
                      width: screenSize(context).width * 0.75,
                      decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Virtual Account Number: ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '2345678910',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    gapH24,
                      GestureDetector(
                        onTap: ()=>context.pushNamed(AppRoute.accountHome.name),
                        child: const CustomListItem(
                        title: 'Account',
                        imagePath: AppAssets.user,
                    ),
                      ),
                    GestureDetector(
                      onTap: ()=>context.pushNamed(AppRoute.walletHome.name),
                      child: const CustomListItem(
                        title: 'Wallet',
                        imagePath: AppAssets.wallet_ic,
                      ),
                    ),
                    const CustomListItem(
                      title: 'Bank & Cards',
                      imagePath: AppAssets.bank_card_ic,
                    ),
                    const CustomListItem(
                      title: 'Download Account Statement',
                      imagePath: AppAssets.download_document,
                    ),
                    const CustomListItem(
                      title: 'QR Code',
                      imagePath: AppAssets.qr_code_ic,
                    ),
                    const CustomListItem(
                      title: 'Refer A Friend',
                      imagePath: AppAssets.refer_a_friend,
                    ),  const CustomListItem(
                      title: 'Log out',
                      noBackgroundColor: true,
                      imagePath: AppAssets.sign_out,
                    ),
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
