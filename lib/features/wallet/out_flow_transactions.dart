import 'package:flutter/material.dart';

import '../../common/widgets/wallet_transaction.dart';
import 'infow.dart';


///  WalletTransaction
class OutFlowTransactions extends StatelessWidget {
  /// constructor [WalletTransaction]
  const OutFlowTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: ListView.builder(   itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return const WalletTransaction();
          }),
    );
  }
}
