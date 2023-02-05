import 'package:flutter/material.dart';
import 'package:cyberpay_mobile_2/core/configs/styles/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import '../../core/configs/styles/app_colors.dart';
import '../../core/widgets/primary_button.dart';


/// CableTvPurchase
class CableTvPurchase extends StatefulWidget {
  /// Instance of [ CableTvPurchase ]
  const CableTvPurchase({Key? key}) : super(key: key);

  @override
  State<CableTvPurchase> createState() => _CableTvPurchaseState();
}

class _CableTvPurchaseState extends State<CableTvPurchase> {
  final dataFormKey = GlobalKey<FormState>();
  String selectedPlan ='20GB Monthly Data Plan 5,000';

  @override
  Widget build(BuildContext context) {
    return       Scaffold(
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
            child: CustomScrollView(slivers: [
              SliverAppBar(
                  toolbarHeight: kToolbarHeight,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Container(
                    margin: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      'TV Subscription',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                  )),
              SliverToBoxAdapter(
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
                          offset: Offset(2, 12),
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Form(
                      key: dataFormKey,
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
                                      padding: EdgeInsets.only(left: 30, right: 30),
                                      child: DropdownButton(
                                        value: 'GOTV LITE (ANNUAL)'  ,
                                        items: [
                                          DropdownMenuItem(
                                            value: 'GOTV LITE (ANNUAL)',
                                            child: Text('GOTV LITE (ANNUAL)'),
                                          ),
                                          DropdownMenuItem(
                                              value: 'GOTV SUPA',
                                              child: Text('GOTV SUPA')),
                                          DropdownMenuItem(
                                            value: 'GOTV JOLLI 2,800',
                                            child: Text('GOTV JOLLI 2,800'),
                                          ) ,
                                          DropdownMenuItem(
                                            value: 'GOTV JINJA 1,900',
                                            child: Text('GOTV JINJA 1,900'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'GOTV MAX 4,150',
                                            child: Text('GOTV MAX 4,150'),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            selectedPlan = value!;
                                          });
                                        },
                                        icon: Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Icon(
                                              CupertinoIcons.chevron_down,
                                              size: 16,
                                            )),
                                        iconEnabledColor: AppColors.primary,
                                        //Icon color
                                        style: TextStyle( color: AppColors.primary, fontSize: 12 ),
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
                                decoration: InputDecoration(
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
                                decoration: InputDecoration(
                                  hintText: 'Phone number',
                                ),

                                keyboardType: TextInputType.number,
                                onChanged: (String? value) {
                                  setState(() {});
                                },
                                cursorColor: Colors.black12,
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
    ;
  }
}
