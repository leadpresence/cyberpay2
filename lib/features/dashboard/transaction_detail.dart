import 'package:flutter/material.dart';

import '../../common/configs/styles/app_colors.dart';


///
class TransactionDetail extends StatelessWidget {
  const TransactionDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomScrollView(
                cacheExtent: 15.0,

                slivers: [
                  SliverAppBar(
                      toolbarHeight: kToolbarHeight,
                      automaticallyImplyLeading: false,
                      flexibleSpace: Text(
                        'Transaction Details',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: AppColors.black, fontWeight: FontWeight.bold),
                      )),
                ],),
        ),
      ),
    );
  }
}
