import 'package:cyberpay_mobile_2/common/data/models/api/login_request.dart';
import 'package:cyberpay_mobile_2/common/utils/extensions.dart';
import 'package:cyberpay_mobile_2/common/widgets/custom_text_field.dart';
import 'package:cyberpay_mobile_2/features/dashboard/dashboard_tabs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/configs/routes/route_paths.dart';
import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../../common/widgets/primary_button.dart';
import 'login_controller.dart';

/// LoginWithPhone
class LoginWithPhone extends ConsumerStatefulWidget {
  /// LoginWithPhone
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends ConsumerState<LoginWithPhone> {
  final withPhoneKey = GlobalKey<FormState>();
  bool userLoggedIn = false;
  TextEditingController loginPhoneNumberController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  void navigate(){
      if (userLoggedIn) {
        context.pushReplacementNamed(AppRoute.dashboardTabs.name);
      }
  }

  /// Handles login submission
  Future<void> submit() async {
    if (withPhoneKey.currentState!.validate()) {
      final success = await ref.watch(loginControllerProvider.notifier).login(
            LoginRequest(
              mobileNumber: loginPhoneNumberController.text.toString(),
              password: loginPasswordController.text.toString(),),);
      if (success) {
        if (mounted) {
          setState(() {
            userLoggedIn = true;
          });
        }
      }
    }
    navigate();
  }
  @override
  void dispose() {
    loginPhoneNumberController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginController = ref.watch(loginControllerProvider);
    final loginControllerNotifier = ref.watch(loginControllerProvider.notifier);

    return SingleChildScrollView(
      child: Form(
        key: withPhoneKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH8,
            CustomTextFormField(
              title: 'Phone Number',
              hint: '0XX XXXX XXXX',
              inputType: TextInputType.phone,
              controller: loginPhoneNumberController,
              validator: (value) {
                if (!value.toString().isValidPhone) {
                  return 'Enter valid phone number';
                }
              },
            ),
            gapH12,
            CustomTextFormField(
              title: 'Password',
              controller: loginPasswordController,
              hint: '*******',
              inputType: TextInputType.visiblePassword,
              isPassword: true,
              validator: (value) {
                if (!value.toString().isValidPassword) {
                  return 'Enter valid password';
                } else if (value != loginPasswordController.text.toString()) {
                  return 'Password mismatch';
                }
              },
            ),
            gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Reset password',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                  ),
                ),
              ],
            ),
            gapH24,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 90,
                          width: 100,
                          child: Column(
                            children: [
                              SvgPicture.asset(AppAssets.login_finger_print),
                              Text(
                                'Login by Fingerprint',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.black,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16.0),
                const Text('OR'),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 90,
                          width: 100,
                          child: Column(
                            children: [
                              SvgPicture.asset(AppAssets.login_face),
                              Text(
                                'Login by Face ID',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.black,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            gapH48,
            PrimaryButton(
              buttonColor: AppColors.primary,
              isLoading: loginController.submitValue.isLoading,
              text: 'SIGN IN',
              onPressed:loginController.submitValue.isLoading ? null : submit,
              //     () {
              //   submit();
              //   if (userLoggedIn) {
              //     context.pushReplacementNamed(AppRoute.dashboardTabs.name);
              //   }
              // }
             // ,
            ),
            gapH8,
            Container(
              child: RichText(
                // Controls visual overflow
                overflow: TextOverflow.ellipsis,
                // Controls how the text should be aligned horizontally
                textAlign: TextAlign.end,
                // Control the text direction
                textDirection: TextDirection.rtl,
                // Whether the text should break at soft line breaks
                // softWrap: true,
                // Maximum number of lines for the text to span
                maxLines: 4,
                // The number of font pixels for each logical pixel
                textScaleFactor: 1,
                text: TextSpan(
                  text: 'Don’t have an account?',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Sign up',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.red,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushNamed(AppRoute.registerView.name);
                          // Single tapped.
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
