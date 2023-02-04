import 'package:cyberpay_mobile_2/core/configs/styles/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/configs/styles/app_assests.dart';
import '../../core/configs/styles/app_colors.dart';

///  EmptyCardView StatelessWidget
class EmptyAddCardView extends StatelessWidget {
  /// Creates an instance of [  EmptyAddCardView]
  const EmptyAddCardView({Key? key,this.title=''}) : super(key: key);
  /// Title of the add card
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.ligthBlue,
      height: screenSize(context).width * 0.95,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child:    SizedBox(
          height: 150,
          width: 150,
            child: Column(
              children: [
                SvgPicture.asset(AppAssets.add_virtual_card),gapH8,
                Text(
                    title ?? 'Add Card',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  )),
              ],
            )),

      ),
    );
  }
}
