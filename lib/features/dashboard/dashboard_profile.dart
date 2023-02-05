import 'package:cyberpay_mobile_2/core/configs/styles/app_assests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/configs/styles/app_colors.dart';

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
    return Scaffold(
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
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
