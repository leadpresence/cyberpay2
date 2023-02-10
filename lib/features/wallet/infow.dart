import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/wallet_transaction.dart';


///  StatelessWidget InflowTransactions
class InflowTransactions extends StatelessWidget {
  ///creates a constructor for [InflowTransactions]
  const InflowTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: ListView.builder(   itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return const WalletTransaction(isInflow:true);
          }),
    );
  }
}

