import 'package:cyberpay_mobile_2/features/add_bank_and_card/add_new_card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import 'add_new_bank_view.dart';

/// AddingBankCardMainView
class AddingBankCardMainView extends StatefulWidget {
  /// creates[AddingBankCardMainView] instance
  const AddingBankCardMainView({Key? key}) : super(key: key);

  @override
  State<AddingBankCardMainView> createState() => _AddingBankCardMainViewState();
}

class _AddingBankCardMainViewState extends State<AddingBankCardMainView> {

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              leading: GestureDetector(
                  onTap: () => context.pop,
                  child:const Icon(
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
                    physics:const BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        toolbarHeight: 140,
                        automaticallyImplyLeading: false,
                        flexibleSpace: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add Bank',
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
                                labelStyle:const TextStyle(
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
                                      child: const Align(child: Text('Bank')),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child:const Align(child: Text('Cards')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const   SliverFillRemaining(
                        child: TabBarView(
                          physics:   NeverScrollableScrollPhysics(),
                          children: [
                            AddNewBank(),
                            AddNewCard(),
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
