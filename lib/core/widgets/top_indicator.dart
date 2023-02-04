
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/styles/app_assests.dart';
import '../configs/styles/app_colors.dart';
import '../configs/styles/app_sizes.dart';

/// StatelessWidget [TopIndicator]
class TopIndicator extends StatelessWidget {
  /// Creates instance of [TopIndicator]
  const TopIndicator({
    Key? key,
    required this.isProfileView,
    required this.isPinView,
    required this.isVerificationView,
  }) : super(key: key);
  final bool isProfileView;
  final bool isPinView;
  final bool isVerificationView;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: Row(
              children: [
                Column(
                  children: [SvgPicture.asset(AppAssets.profile)],
                ),
                gapW4,
                Column(
                  children: [
                    Text('Profile'),
                    gapH4,
                    if (isProfileView)
                      Container(
                        height: 2,
                        width: 45,
                        color: AppColors.dark_blue,
                      )
                    else
                      SizedBox.shrink()
                  ],
                )
              ],
            ),
          ),
          SvgPicture.asset(AppAssets.next_arrow),
          SizedBox(
            child: Row(
              children: [
                Column(
                  children: [SvgPicture.asset(AppAssets.secure)],
                ),
                gapW4,
                Column(
                  children: [
                    Text('Secure'),
                    gapH4,
                    if (isPinView)
                      Container(
                        height: 2,
                        width: 45,
                        color: AppColors.dark_blue,
                      )
                    else
                      SizedBox.shrink()
                  ],
                )
              ],
            ),
          ),
          SvgPicture.asset(AppAssets.next_arrow),
          SizedBox(
            child: Row(
              children: [
                Column(
                  children: [SvgPicture.asset(AppAssets.verify)],
                ),
                gapW4,
                Column(
                  children: [
                    Text('Verify'),
                    gapH4,
                    if (isVerificationView)
                      Container(
                        height: 2,
                        width: 45,
                        color: AppColors.dark_blue,
                      )
                    else
                      SizedBox.shrink()
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
