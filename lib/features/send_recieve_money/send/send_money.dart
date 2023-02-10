import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/configs/routes/route_paths.dart';
import '../../../common/configs/styles/app_assests.dart';
import '../../../common/configs/styles/app_colors.dart';
import '../../../common/configs/styles/app_sizes.dart';
import '../../../common/widgets/primary_button.dart';
import '../../sign_up/account_creation_view.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final walletToWalletKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child:const Icon(
                CupertinoIcons.back,
                color: AppColors.primary,
                size: 40,
              )),
        ),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomScrollView(slivers: [
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Text(
                          'Wallet To Wallet Transfer',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                      child:
                      Form(
                    key: walletToWalletKey,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            gapH32,
                            Text(
                              'Contact Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
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
                                        EdgeInsets.only(left: 30, right: 30),
                                    child: DropdownButton(
                                      value: "Wallet 1",
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("Wallet 1"),
                                          value: "Wallet 1",
                                        ),
                                        DropdownMenuItem(
                                            child: Text("Wallet 2"),
                                            value: "Wallet 2"),
                                        DropdownMenuItem(
                                          child: Text("Wallet 3"),
                                          value: "Wallet 3",
                                        )
                                      ],
                                      onChanged: (value) {
                                        print("You have selected $value");
                                      },
                                      icon: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Icon(
                                            CupertinoIcons.chevron_down,
                                            size: 16,
                                          )),
                                      iconEnabledColor: AppColors.primary,
                                      //Icon color
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 12),

                                      dropdownColor: Colors.white,
                                      //dropdown background color
                                      underline: Container(),
                                      //remove underline
                                      isExpanded:
                                          true, //make true to make width 100%
                                    ))),
                            gapH16,
                            Text(
                              'Enter Amount',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (_) {},
                            ),
                            gapH16,
                            Text(
                              'Transaction Pin',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            gapH8,
                            TextFormField(
                              obscureText: true,
                              maxLength: 6,

                              decoration: InputDecoration(
                                counter: Text(''),
                                hintText: '*******',
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (String? value) {
                                setState(() {});
                              },
                              cursorColor: Colors.black12,
                              // keyboardType: TextInputType.name,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (_) {},
                            ),
                            gapH24,
                            PrimaryButton(
                                buttonColor: AppColors.primary,
                                text: 'SEND',
                                onPressed: () {
                                  context.pushNamed(AppRoute.receiveMoney.name);
                                }),
                            gapH24,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppAssets.share),
                                gapW4,
                                InkWell(
                                  onTap: () => context.pushNamed(
                                      AppRoute.addingBankCardMainView.name),
                                  child: Text('Invite a friend',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black,
                                          )),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  )),
                ]))));
  }
}
