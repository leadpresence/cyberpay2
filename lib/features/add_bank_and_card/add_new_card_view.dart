import 'package:cyberpay_mobile_2/core/configs/styles/app_assests.dart';
import 'package:cyberpay_mobile_2/core/widgets/leading_icon_custom_text_field.dart';
import 'package:cyberpay_mobile_2/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/configs/routes/route_paths.dart';
import '../../core/configs/styles/app_colors.dart';
import '../../core/configs/styles/app_sizes.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(children: [
          Row

            (
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // SvgPicture.asset(AppAssets.swap),
              gapW4,
              InkWell(
                onTap: ()=>context.pushNamed(AppRoute.savedBankCardMainView.name),
                child: Text(
                    'Saved Cards',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    )),
              ),


            ],),
          gapH24,
          Row(
            children: [
              Text(
                'Enter your card details',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          gapH24,

          Row(
            children: [
              Text(
                    'Card Number',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ],
          ),

          gapH8,
          LeadingIconCustomTextField(prefixIcon: Container(
            margin: EdgeInsets.all(10),
            height: 8,
            width: 8,
            child: SvgPicture.asset(AppAssets.card_icon),
          ),
          hintText: '0000 0000 0000 0000 ',
          ),
          gapH16,

          SizedBox(
          width: screenSize(context).width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                SizedBox(

                  width: screenSize(context).width*0.4,

                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Valid Till',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      gapH8,
                      LeadingIconCustomTextField(
                        hintText: 'MM/YY',
                        prefixIcon: Container(
                        margin: EdgeInsets.all(10),
                        height: 6,
                        width: 6,
                        child: SvgPicture.asset(AppAssets.calendar),

                      ),)

                    ],
                  ),
                ) ,
                SizedBox(

                  width: screenSize(context).width*0.4,

                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'CVV',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      gapH8,
                      LeadingIconCustomTextField(
                        keyboardType: TextInputType.number ,
                        maxLines: 3,
                        hintText: '123',
                        prefixIcon: Container(
                        margin: EdgeInsets.all(10),
                        height: 6,
                        width: 6,
                        child: SvgPicture.asset(AppAssets.padlock),
                      ),)
                    ],
                  ),
                )

            ],)
          ),

          gapH24,
          
          PrimaryButton(text: 'PAY ₦ 10',onPressed: (){},)
        ],)));
  }
}
