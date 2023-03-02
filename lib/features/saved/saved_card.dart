import 'package:cyberpay_mobile_2/common/configs/styles/app_colors.dart';
import 'package:cyberpay_mobile_2/common/configs/styles/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/configs/routes/route_paths.dart';
import '../../common/configs/styles/app_assests.dart';
import '../virtual_card/card_preview.dart';

class SavedCards extends StatelessWidget {
  const SavedCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return       Column(
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
                  'Add Card',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),),
            ),


          ],),
        SizedBox(
          height: screenSize(context).width,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {

                return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(10),
                  width: screenSize(context).width*0.20,
                  height: screenSize(context).height*0.155,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary,width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(AppAssets.delete_bin_icon)
                        ],),
                      Wrap(children: [
                        CardTextDetailsItem(maxLInes: 1,identifier: 'Card Number',value: 'xxxx xxxx xxxx 3456',),
                      ],),gapH8,

                      Expanded(child:
                      CardTextDetailsItem(maxLInes: 1,identifier: 'Valid till',value: '12/11',),

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
