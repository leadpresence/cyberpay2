import 'package:cyberpay_mobile_2/features/saved/saved_bank_accounts.dart';
import 'package:cyberpay_mobile_2/features/saved/saved_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/configs/styles/app_colors.dart';
import '../../core/configs/styles/app_sizes.dart';

class SavedBankAndCardMainView extends StatefulWidget {
  const SavedBankAndCardMainView({Key? key}) : super(key: key);

  @override
  State<SavedBankAndCardMainView> createState() => _SavedBankAndCardMainViewState();
}

class _SavedBankAndCardMainViewState extends State<SavedBankAndCardMainView> {
  @override
  Widget build(BuildContext context) {
    return       DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              leading: InkWell(
                  onTap: () => context.pop,
                  child: Icon(
                    CupertinoIcons.back,
                    color: AppColors.primary,
                    size: 40,
                  )),
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
                        toolbarHeight: 140,
                        automaticallyImplyLeading: false,
                        flexibleSpace: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saved Bank',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            gapH24,
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.31),
                                ),
                              ),
                              child: TabBar(
                                // controller: _tabController,
                                labelStyle: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                                unselectedLabelStyle: TextStyle(
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
                                      child: Align(child: Text('Bank')),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Align(child: Text('Cards')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SliverFillRemaining(
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SavedBankAccounts(),
                            SavedCards()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
    ;
  }
}