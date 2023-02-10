import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../../common/widgets/custom_list_item.dart';

/// StatefulWidget WalletTopUp
class WalletTopUp extends StatefulWidget {
    ///   /// creates an instance of [WalletTopUp]
  const WalletTopUp({Key? key}) : super(key: key);

  @override
  State<WalletTopUp> createState() => _WalletTopUpState();
}

class _WalletTopUpState extends State<WalletTopUp> {
  final topUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                toolbarHeight: kToolbarHeight,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    'Top Up',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.bold),
                  ),
                )),
            const SliverToBoxAdapter(
              child: gapH16,
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                child: Form(
                  key: topUpFormKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
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
                        ],
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
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: gapH24),
            SliverFillRemaining(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Select Payment Option',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const CustomListItem(
                      title: 'Pay with card XXX XXX XXX 2345',
                      noBackgroundColor: true,
                      imagePath: AppAssets.bank_card_ic,
                      boldText: false,
                    ),
                    const CustomListItem(
                      title: 'Pay with Bank',
                      noBackgroundColor: true,
                      imagePath: AppAssets.bank_card_ic,
                      boldText: false,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
