import 'package:flutter/material.dart';

import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../../common/widgets/primary_button.dart';
import '../sign_up/account_creation_view.dart';

/// TabUpdatePersonalDetails
class TabUpdatePersonalDetails extends StatefulWidget {
  ///   creates an instance of [ TabUpdatePersonalDetails ]
  const TabUpdatePersonalDetails({Key? key}) : super(key: key);

  @override
  State<TabUpdatePersonalDetails> createState() => _TabUpdatePersonalDetailsState();
}

class _TabUpdatePersonalDetailsState extends State<TabUpdatePersonalDetails> {
  @override
  Widget build(BuildContext context) {
    final updatePersonalDetailsFormKey = GlobalKey<FormState>();
    return
      SingleChildScrollView(
        child: Form(
          key: updatePersonalDetailsFormKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                gapH24,
                Text(
                  'First Name',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapH8,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      // firstName = value;
                    });
                  },
                  cursorColor: Colors.black12,
                  // keyboardType: TextInputType.name,
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  validator: (_) {
                    // if (_submitted) {
                    //   if (firstName == null) {
                    //     return 'Required';
                    //   }
                    //   if (firstName!.isEmpty) {
                    //     return 'Required';
                    //   }
                    //
                    //   return null;
                    // } else {
                    //   return null;
                    // }
                  },
                ),
                gapH12,
                Text(
                  'Last Name',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapH8,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                  onChanged: (String? value) {
                    setState(() {});
                  },
                  cursorColor: Colors.black12,
                  // keyboardType: TextInputType.name,
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  validator: (_) {},
                ),
                gapH12,
                Text(
                  'Email',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapH8,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String? value) {
                    setState(() {});
                  },
                  cursorColor: Colors.black12,
                  // keyboardType: TextInputType.name,
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  validator: (_) {},
                ),
                gapH12,
                Text(
                  'Phone Number',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapH8,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'phone',
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (String? value) {
                    setState(() {});
                  },
                  cursorColor: Colors.black12,
                  // keyboardType: TextInputType.name,
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  validator: (_) {},
                ),
                gapH12,
                Text(
                  'Password',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapH8,
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: '*******',
                  ),
                  keyboardType:
                  TextInputType.visiblePassword,
                  onChanged: (String? value) {
                    setState(() {});
                  },
                  cursorColor: Colors.black12,
                  // keyboardType: TextInputType.name,
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  validator: (_) {},
                ),
                gapH12,
                Text(
                  'Confirm Password',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapH8,
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: '**********',
                  ),
                  keyboardType:
                  TextInputType.visiblePassword,
                  onChanged: (String? value) {
                    setState(() {});
                  },
                  cursorColor: Colors.black12,
                  // keyboardType: TextInputType.name,
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  validator: (_) {},
                ),
                gapH8,
                CheckPasswordWidget(
                  rightLenght: false,
                  hasUpcaseLowCase: false,
                  hasSpecialChar: false,
                  hasNumber: true,
                ),
                gapH12,
                PrimaryButton(
                    buttonColor: AppColors.primary,
                    text: 'Update',
                    onPressed: () {


                    })
              ]),
        ),
      );
  }
}
