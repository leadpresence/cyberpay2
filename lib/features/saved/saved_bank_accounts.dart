

import 'package:cyberpay_mobile_2/common/configs/styles/app_assests.dart';
import 'package:cyberpay_mobile_2/common/configs/styles/app_colors.dart';
import 'package:cyberpay_mobile_2/common/configs/styles/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/configs/routes/route_paths.dart';
import '../virtual_card/card_preview.dart';

/// SavedBankAccounts
class SavedBankAccounts extends StatelessWidget {
  /// creates a constructor for [SavedBankAccounts]
  const SavedBankAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Row
          (
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(AppAssets.add_box),
            gapW4,
            InkWell(
              onTap: ()=>context.pushNamed(AppRoute.addingBankCardMainView.name),
              child: Text(
                  'Add Banks',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  )),
            ),


          ],),
        SizedBox(
          height: screenSize(context).width,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {

                return Container(
                  padding:const EdgeInsets.all(8),
                  margin:const  EdgeInsets.all(10),
                  width: screenSize(context).width*0.20,
                  height: screenSize(context).height*0.20,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary,width: 1),
                    borderRadius:const  BorderRadius.all(Radius.circular(8)),


                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        SvgPicture.asset(AppAssets.delete_bin_icon)
                        ],),
                      Wrap(children:const  [
                            CardTextDetailsItem(maxLInes: 2,identifier: 'Account Name ',value: 'Adanna Adebayo',),
                      ],),gapH8,
                      Wrap(children:const  [
                        CardTextDetailsItem(maxLInes: 1,identifier: 'Account Number',value: '2345678910',),

                      ],),gapH8,
                      const     Expanded(child:
                        CardTextDetailsItem(maxLInes: 1,identifier: 'Bank Name ',value: 'Guaranty Trust Bank',),

                     ),gapH16,
                    ],
                  ),

                );
              }),
        ),
      ],
    );
  }
}
