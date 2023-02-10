import 'package:cyberpay_mobile_2/common/configs/routes/route_paths.dart';
import 'package:cyberpay_mobile_2/features/virtual_card/tab_dollar_card_view.dart';
import 'package:cyberpay_mobile_2/features/virtual_card/tab_naira_card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';


/// virtual card view
class VirtualCards extends StatefulWidget {
  ///  Creates [virtualcard] instance
  const VirtualCards({Key? key}) : super(key: key);

  @override
  State<VirtualCards> createState() => _VirtualCardsState();
}

class _VirtualCardsState extends State<VirtualCards> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    CupertinoIcons.back,
                    color: AppColors.primary,
                    size: 40,
                  )),
              elevation: 0,
              centerTitle: true,
            ),
            body: SafeArea(
              child: Listener(
                onPointerDown: (_) {
                  final currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild?.unfocus();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        flexibleSpace:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.31),
                                ),
                              ),
                              child: TabBar(
                                labelStyle: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                                unselectedLabelStyle:const TextStyle(
                                    fontSize: 12.0,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold),
                                labelPadding: const EdgeInsets.all(0),
                                unselectedLabelColor: AppColors.dark_blue,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.dark_blue,
                                ),
                                tabs: [
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child:const Align(child: Text('DOLLAR CARD')),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child:const Align(child: Text('NAIRA CARD')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.pushNamed(AppRoute.addingBankCardMainView.name);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.red,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 1, // thickness
                                        color: AppColors.red, // color
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  child: Text('+ New Card',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                           ?.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                )),
                          ],
                        ),
                      ),
                     const SliverToBoxAdapter(child: gapH16),
                      const SliverFillRemaining(
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            TabDollarCardView(),
                            TabNairaCard(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
