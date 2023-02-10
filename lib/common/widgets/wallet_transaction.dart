
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../configs/styles/app_assests.dart';
import '../configs/styles/app_colors.dart';
import '../configs/styles/app_sizes.dart';

/// StatelessWidget OutFlowTransactions
class WalletTransaction extends StatelessWidget {

  /// if isInflow is true its a credit trransaction
  final bool isInflow;
  /// String Amount in trxn
  final String? amount;
  /// String Transaction Narration/ Category
  final String? category;


  /// constructor [OutFlowTransactions]
  const WalletTransaction({Key? key,this.isInflow=false, this.amount,this.category
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: screenSize(context).width,
      child:
      ListTile(
          leading:
          Container( height: 25, width: 25, decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(6),
          ),
            child: Center(
              child: SvgPicture.asset(AppAssets.internetIcon),
            ),
          ),
          title: Text(
           category?? 'Cyberspace LTE',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.black, fontWeight: FontWeight.normal),
          ),
          trailing: SizedBox(child:
          Wrap(children: [
             Text('₦',style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color:isInflow? AppColors.green:AppColors.red, fontWeight: FontWeight.normal)),

            Text(amount??'12,000.00',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                      ?.copyWith(color:isInflow? AppColors.green:AppColors.red, fontWeight: FontWeight.normal))
          ],),)
      ),
    );
  }
}

