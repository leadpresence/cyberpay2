import 'package:cyberpay_mobile_2/common/configs/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../../common/widgets/custom_list_item.dart';
import '../../common/widgets/primary_button.dart';

/// StatefulWidget WithdrawFromWallet

class WithdrawFromWallet extends StatefulWidget {
  ///   /// creates an instance of [WithdrawFromWallet]
  const WithdrawFromWallet({Key? key}) : super(key: key);

  @override
  State<WithdrawFromWallet> createState() => _WithdrawFromWalletState();
}

class _WithdrawFromWalletState extends State<WithdrawFromWallet> {
  final withdrawFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            onTap: () => Navigator.pop(context),
            child: const Icon(
              CupertinoIcons.back,
              color: AppColors.primary,
              size: 40,
            )),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                  toolbarHeight: kToolbarHeight,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Container(
                    child: Text(
                      'Withdraw',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                  )),
              const SliverToBoxAdapter(
                child: gapH16,
              ),
              const SliverToBoxAdapter(
                child: gapH16,
              ),
              SliverToBoxAdapter(
                  child: Form(
                key: withdrawFormKey,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter Amount',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        gapH8,
                        TextFormField(
                          decoration: const InputDecoration(
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
                          'Plan',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: DropdownButton(
                                  value: 'GTB - 2345678910',
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'GTB - 2345678910',
                                      child: Text('GTB - 2345678910'),
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
                                  style: const TextStyle(
                                      color: AppColors.primary, fontSize: 12),

                                  dropdownColor: Colors.white,
                                  //dropdown background color
                                  underline: Container(),
                                  //remove underline
                                  isExpanded:
                                      true, //make true to make width 100%
                                ))),
                        gapH16,
                        Text(
                          'Transaction Pin',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        gapH8,
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: '********',
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (String? value) {
                            setState(() {});
                          },
                          cursorColor: Colors.black12,
                          // keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (_) {},
                        ),
                        gapH32,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(
                                buttonColor: AppColors.primary,
                                text: 'WITHDRAW',
                                onPressed: () => context.pushNamed(
                                    AppRoute.walletOtpVerification.name),
                                btnWidth: screenSize(context).width * .90),
                          ],
                        ),
                      ]),
                ),
              )),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
