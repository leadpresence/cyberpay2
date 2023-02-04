import 'package:cyberpay_mobile_2/core/configs/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/configs/styles/app_assests.dart';
import '../../../core/configs/styles/app_colors.dart';
import '../../../core/configs/styles/app_sizes.dart';
import '../../../core/widgets/primary_button.dart';

///  AddNewBank
class AddNewBank extends StatefulWidget {
  /// creates instance [AddNewBank]
  const AddNewBank({Key? key}) : super(key: key);
  @override
  State<AddNewBank> createState() => _AddNewBankState();
}

class _AddNewBankState extends State<AddNewBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(children: [
          Row

            (
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // SvgPicture.asset(AppAssets.swap),
              gapW4,
              InkWell(
                onTap: ()=>context.pushNamed(AppRoute.savedBankCardMainView.name),
                child: Text(
                    'Saved Banks',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    )),
              ),


            ],),
          gapH24,
          Row(
            children: [
              Text(
                'Bank Name',
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
            decoration: InputDecoration(
              hintText: 'Bank Name',
            ),
            keyboardType: TextInputType.text,
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
          Row(
            children: [
              Text(
                'Account Number',
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
            maxLength: 11,
            decoration: InputDecoration(
              counter: Text(''),
              hintText: 'Account Number',
            ),
            keyboardType: TextInputType.number,
            onChanged: (String? value) {
              setState(() {});
            },
            cursorColor: Colors.black12,
            autovalidateMode:
            AutovalidateMode.onUserInteraction,
            validator: (_) {},
          ),
          gapH16,
          Row(
            children: [
              Text(
                'Account Name',
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
            decoration: InputDecoration(
              counter: Text(''),
              hintText: 'Account Name',
            ),
            keyboardType: TextInputType.name,
            onChanged: (String? value) {
              setState(() {});
            },
            cursorColor: Colors.black12,
            autovalidateMode:
            AutovalidateMode.onUserInteraction,
            validator: (_) {},
          ),
          
          PrimaryButton(text: 'CONFIRM',onPressed: (){},)

        ],),
      ),
    );
  }
}
