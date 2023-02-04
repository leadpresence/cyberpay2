import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/configs/routes/route_paths.dart';
import '../../../core/configs/styles/app_assests.dart';
import '../../../core/configs/styles/app_colors.dart';
import '../../../core/configs/styles/app_sizes.dart';
import '../../../core/widgets/CustomExpandableCard.dart';
import '../../../core/widgets/custom_expansion_card.dart';
import '../../../core/widgets/primary_button.dart';

class RequestMoney extends StatefulWidget {
  const RequestMoney({Key? key}) : super(key: key);

  @override
  State<RequestMoney> createState() => _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney> {
  ScrollController scrollController = ScrollController();
  final requestMoneyContactKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
              toolbarHeight: kToolbarHeight,
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Request Money',
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.bold),
                ),
              )),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  PlanCard(
                    widget: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 16, right: 16, bottom: 16),
                        child:
                        Form(
                          key: requestMoneyContactKey,
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                            color: AppColors.ligthBlue,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 30, right: 30),
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
                                                padding:
                                                    EdgeInsets.only(left: 20),
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
                                  gapH24,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: PrimaryButton(
                                            buttonColor: AppColors.dark_blue,
                                            text: 'SEND',
                                            onPressed: () {
                                              context.pushNamed(
                                                  AppRoute.receiveMoney.name);
                                            }),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                      )
                    ],
                    key: widget.key,
                    title: 'REQUEST FROM CONTACTS',
                  ),
                  gapH16,
                  PlanCard(
                    widget: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 16, right: 16, bottom: 16),
                        child: Column(
                          children: [
                            Wrap(
                              children: [
                                Text(
                                    'https://cyberpay-wallets-frontend.vercel.app/pay/adaanya7049215647')
                              ],
                            ),
                            gapH16,
                            SizedBox(
                                width: screenSize(context).width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenSize(context).width * 0.4,
                                      child: SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.dark_blue,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1, // thickness
                                                color: AppColors
                                                    .dark_blue, // color
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                gapW4,
                                                Text('COPY ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              AppColors.white,
                                                        )),
                                                gapW8,
                                                SvgPicture.asset(
                                                  AppAssets.link_ic,
                                                  height: 18,
                                                  width: 16,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize(context).width * 0.4,
                                      child: SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.dark_blue,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1, // thickness
                                                color: AppColors
                                                    .dark_blue, // color
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                gapW4,
                                                Text('SHARE',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              AppColors.white,
                                                        )),
                                                gapW8,
                                                SvgPicture.asset(
                                                  AppAssets.share_ic,
                                                  height: 18,
                                                  width: 16,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                    title: 'SEND PAYMENT LINK',
                    key: widget.key,
                  ),
                  gapH16,
                  PlanCard(
                    key: widget.key,
                    widget: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 16, right: 16, bottom: 16),
                        child: Column(
                          children: [
                            Wrap(
                              children: [
                                Text(
                                    'Virtual Account No : 2345678910 (Wema Bank)')
                              ],
                            ),
                            gapH16,
                            SizedBox(
                                width: screenSize(context).width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenSize(context).width * 0.4,
                                      child: SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.dark_blue,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1, // thickness
                                                color: AppColors
                                                    .dark_blue, // color
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                gapW4,
                                                Text('COPY ',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              AppColors.white,
                                                        )),
                                                gapW8,
                                                SvgPicture.asset(
                                                  AppAssets.copy_document,
                                                  height: 18,
                                                  width: 16,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize(context).width * 0.4,
                                      child: SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.dark_blue,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 1, // thickness
                                                color: AppColors
                                                    .dark_blue, // color
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                gapW4,
                                                Text('SHARE',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              AppColors.white,
                                                        )),
                                                gapW8,
                                                SvgPicture.asset(
                                                  AppAssets.share_ic,
                                                  height: 18,
                                                  width: 16,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                    title: 'SEND ACCOUNT NUMBER',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}

