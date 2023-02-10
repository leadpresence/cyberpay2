import 'package:cyberpay_mobile_2/common/configs/styles/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/configs/styles/app_colors.dart';
import '../../common/widgets/primary_button.dart';

/// ElectricityBillsPurchase
class ElectricityBillsPurchase extends StatefulWidget {
  /// creates an instance of [ElectricityBillsPurchase]
  const ElectricityBillsPurchase({Key? key}) : super(key: key);

  @override
  State<ElectricityBillsPurchase> createState() => _ElectricityBillsPurchaseState();
}

class _ElectricityBillsPurchaseState extends State<ElectricityBillsPurchase> {
  final electricityBillsFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
                onTap: () => Navigator.pop(context),
                child:const  Icon(
                  CupertinoIcons.back,
                  color: AppColors.primary,
                  size: 40,
                )),
          ),
          body: SafeArea(
              child: CustomScrollView(slivers: [
            SliverAppBar(
                toolbarHeight: kToolbarHeight,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                  margin:const  EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    'Ikeja Electric Distribution Company',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.bold),
                  ),
                )),
                const   SliverToBoxAdapter(
              child: gapH16,
            ),
            SliverToBoxAdapter(
                child: Container(
              width: screenSize(context).width,
              height: screenSize(context).height * 0.65,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
              margin: EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0,
                    offset:const  Offset(2, 12),
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Form(
                key: electricityBillsFormKey,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plan',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        gapH8,
                        DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.blue2.withOpacity(0.2),
                              border: Border.all(
                                  color: AppColors.ligthBlue, width: 1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                                padding:const  EdgeInsets.only(left: 30, right: 30),
                                child: DropdownButton(
                                  value: 'Ikeja Electric Prepaid',
                                  items: const [
                                         DropdownMenuItem(
                                      value: 'Ikeja Electric Prepaid',
                                      child: Text('Ikeja Electric Prepaid'),
                                    ),

                                  ],
                                  onChanged: (value) {
                                    print("You have selected $value");
                                  },
                                  icon: const Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Icon(
                                        CupertinoIcons.chevron_down,
                                        size: 16,
                                      )),
                                  iconEnabledColor: AppColors.primary,
                                  //Icon color
                                  style:const  TextStyle(
                                      color: AppColors.primary, fontSize: 12),

                                  dropdownColor: Colors.white,
                                  //dropdown background color
                                  underline: Container(),
                                  //remove underline
                                  isExpanded: true, //make true to make width 100%
                                ))),
                        gapH16,
                        Text(
                          'Enter Amount',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        gapH8,
                        TextFormField(
                          decoration:const  InputDecoration(
                            hintText: '0.00',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (String? value) {
                            setState(() {});
                          },
                          cursorColor: Colors.black12,
                          // keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (_) {},
                        ),
                        gapH16,
                        Text(
                          'Customer No.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        gapH8,
                        TextFormField(
                          decoration:const  InputDecoration(
                            hintText: 'Phone number',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (String? value) {
                            setState(() {});
                          },
                          cursorColor: Colors.black12,
                          // keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (_) {},
                        ),
                        gapH24,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(

                                buttonColor: AppColors.primary,
                                text: 'PAY',
                                onPressed: () {},
                            btnWidth: screenSize(context).width*.80
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            )),
          ])));
  }
}
