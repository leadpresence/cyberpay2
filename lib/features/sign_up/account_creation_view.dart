import 'dart:async';

import 'package:cyberpay_mobile_2/common/configs/routes/route_paths.dart';
import 'package:cyberpay_mobile_2/common/configs/styles/app_colors.dart';
import 'package:cyberpay_mobile_2/common/data/models/api/new_customer_wallet_request.dart';
import 'package:cyberpay_mobile_2/common/data/models/api/resend_otp_request.dart';
import 'package:cyberpay_mobile_2/common/data/models/api/verify_otp_request.dart';
import 'package:cyberpay_mobile_2/common/utils/async_value_ui.dart';
import 'package:cyberpay_mobile_2/common/utils/extensions.dart';
import 'package:cyberpay_mobile_2/features/sign_up/sign_up_screen_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../common/widgets/primary_button.dart';
import '../../common/widgets/top_indicator.dart';
import 'create_customer_controller.dart';

///  AccountCreationView
class AccountCreationView extends ConsumerStatefulWidget {
  /// creates and instance of [AccountCreationView]

  /// Construct AccountCreationView
  const AccountCreationView({super.key});

  @override
  ConsumerState<AccountCreationView> createState() =>
      _AccountCreationViewState();
}

class _AccountCreationViewState extends ConsumerState<AccountCreationView> {
  /// Keys
  final _createAccountPageController = PageController();
  final GlobalKey<FormState> _personalDetailsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> pinFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final Key firstKey = UniqueKey();
  final Key secondKey = UniqueKey();
  final Key thirdKey = UniqueKey();
  final Key grandParentKey = UniqueKey();
  final Key parentKey = UniqueKey();
  final Key childKey = UniqueKey();

  /// Profile Controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  StreamController<ErrorAnimationType>? pinErrorController;
  StreamController<ErrorAnimationType>? otpErrorController;

  /// Pin & otp Controllers
  TextEditingController pinTextEditingController = TextEditingController();
  TextEditingController otpTextEditingController = TextEditingController();
@override
void dispose() {
  firstNameController.dispose();
  lastNameController.dispose();
  emailController.dispose();
  phoneNumberController.dispose();
  passwordController.dispose();
  confirmPasswordController.dispose();
  super.dispose();
}
  bool hasError = false;
  bool isPasswordValid = false;
  String currentText = '';

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(
      createCustomerControllerProvider.select((state) => state.submitValue),
      (_, state) => state.showAlertDialogOnError(context),
      onError: (error, stackTrace) => debugPrint('An error occurred $error'),
    );

    final controller = ref.watch(createCustomerControllerProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: const Icon(
            CupertinoIcons.back,
            color: AppColors.primary,
            size: 40,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(bottom: 20, top: 10),
          height: 30,
          child: Center(child: SvgPicture.asset(AppAssets.cyberpayLogo)),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: screenSize(context).width,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomScrollView(
            key: grandParentKey,
            slivers: [
              SliverToBoxAdapter(
                key: parentKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Your Account',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: AppColors.red),
                    ),
                    gapH8,
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                  maxLines: 4,
                                  textScaleFactor: 1,
                                  text: TextSpan(
                                    text: 'Already have an account? ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.black,
                                        ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: ' Sign In',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = ()=>context.pushNamed(AppRoute.loginView.name),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                key: childKey,
                child: PageView(
                  controller: _createAccountPageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (int i) {
                    // setState(() {
                    //   if (i == 0) {
                    //     widget.creationState = NewCustomerStage.profile;
                    //   } else if (i == 1) {
                    //     widget.creationState = NewCustomerStage.setPin;
                    //   } else {
                    //     widget.creationState = NewCustomerStage.verifyOtp;
                    //   }
                    // });
                  },
                  children: [
                    /// First account creation View
                    SingleChildScrollView(

                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 12,
                      ),
                      key: firstKey,
                      child: Form(
                        key: _personalDetailsFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            gapH8,
                            const TopIndicator(
                              isProfileView: true,
                              isPinView: false,
                              isVerificationView: false,
                            ),
                            gapH24,
                            CustomTextField(
                              title: 'First Name',
                              inputType: TextInputType.text,
                              controller: firstNameController,
                              validator: (value) {
                                if (!value.toString().isValidName) {
                                  return 'Enter valid name';
                                }
                              },
                            ),
                            gapH12,
                            CustomTextField(
                              title: 'Last Name',
                              inputType: TextInputType.text,
                              controller: lastNameController,
                              validator: (value) {
                                if (!value.toString().isValidName) {
                                  return 'Enter valid last name';
                                }
                              },
                            ),
                            gapH12,
                            CustomTextField(
                              title: 'Email',
                              inputType: TextInputType.emailAddress,
                              controller: emailController,
                              validator: (value) {
                                if (!value.toString().isValidEmail) {
                                  return 'Enter valid email';
                                }
                              },
                            ),
                            gapH12,
                            CustomTextField(
                              title: 'Phone Number',
                              hint: '0XX XXXX XXXX',
                              inputType: TextInputType.phone,
                              controller: phoneNumberController,
                              validator: (value) {
                                if (!value.toString().isValidPhone) {
                                  return 'Enter valid phone number';
                                }
                              },
                            ),
                            gapH12,
                            CustomTextField(
                              title: 'Password',
                              inputType: TextInputType.phone,
                              controller: passwordController,
                              isPassword: true,
                              validator: (value) {
                                if (!value.toString().isValidPassword) {
                                  return 'Enter valid password';
                                }
                              },
                            ),
                            gapH12,
                            CustomTextField(
                              title: 'Confirm Password',
                              inputType: TextInputType.phone,
                              controller: confirmPasswordController,
                              isPassword: true,
                              validator: (value) {
                                if (!value.toString().isValidPassword) {
                                  setState(() {
                                    isPasswordValid = true;
                                  });
                                  return 'Enter valid password';
                                } else if (value !=
                                    passwordController.text.toString()) {
                                  return 'Password mismatch';
                                }
                              },
                            ),
                            gapH8,
                            CheckPasswordWidget(
                              rightLenght: isPasswordValid,
                              hasUpcaseLowCase: isPasswordValid,
                              hasSpecialChar: isPasswordValid,
                              hasNumber: isPasswordValid,
                            ),
                            gapH12,
                            Row(
                              children: [
                                Material(
                                  child: Checkbox(
                                    activeColor: AppColors.primary,
                                    value: controller.state.agreedToTerms,
                                    onChanged: (value) {
                                      setState(() {
                                        controller.state.agreedToTerms = value!;
                                      });
                                    },
                                  ),
                                ),
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
                                      text: 'I agree to the',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.black,
                                          ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '  Terms and Conditions',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.red,
                                              ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // Single tapped.
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            PrimaryButton(
                              buttonColor: AppColors.primary,
                              text: 'Next',
                              onPressed: () {
                                /// check if user agreed
                                ///go to the next page{
                                if (_personalDetailsFormKey.currentState!
                                    .validate()) {
                                  if (controller.state.agreedToTerms) {
                                    _createAccountPageController?.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  } else {
                                    const snackBar = SnackBar(
                                      content: Text(
                                        'Please check and agree to terms to continue',
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Transaction Pin View
                    SingleChildScrollView(
                      key: secondKey,
                      child: Form(
                        key: pinFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            gapH24,
                            const TopIndicator(
                              isProfileView: false,
                              isPinView: true,
                              isVerificationView: false,
                            ),
                            gapH32,
                            Wrap(
                              children: [
                                Text(
                                  'Enter a 6 digit security pin that will be used to \nconfirm all transactions',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.black,
                                      ),
                                ),
                              ],
                            ),
                            gapH8,
                            gapH32,
                            PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: AppColors.primary.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                              ),
                              length: 6,
                              obscuringCharacter: '*',
                              animationType: AnimationType.fade,
                              validator: (v) {
                                if (v == null) {
                                  return 'Required';
                                }
                                if (v.length < 6) {
                                  return 'Pin too short';
                                } else {
                                  return null;
                                }
                              },
                              pinTheme: PinTheme(
                                inactiveFillColor:
                                    AppColors.primary.withOpacity(.2),
                                activeColor: AppColors.primary.withOpacity(.2),
                                selectedFillColor:
                                    AppColors.primary.withOpacity(.2),
                                errorBorderColor: AppColors.primary,
                                selectedColor: AppColors.primary,
                                borderWidth: 0.5,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 60,
                                fieldWidth: 50,
                                activeFillColor:
                                    hasError ? Colors.orange : Colors.white,
                              ),
                              cursorColor: Colors.black,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              textStyle:
                                  const TextStyle(fontSize: 20, height: 1.6),
                              backgroundColor: Colors.transparent,
                              enableActiveFill: true,
                              errorAnimationController: pinErrorController,
                              controller: pinTextEditingController,
                              keyboardType: TextInputType.phone,
                              boxShadows: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                ),
                              ],
                              onCompleted: (v) {
                                debugPrint('Completed');
                              },
                              onChanged: (value) {
                                debugPrint(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                debugPrint('Allowing to paste $text');
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc

                                return true;
                              },
                            ),
                            gapH16,
                            Text(
                              hasError
                                  ? '*Please fill up all the cells properly'
                                  : '',
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            gapH48,
                            PrimaryButton(
                              buttonColor: AppColors.primary,
                              text: 'NEXT',
                              isLoading: controller.state.submitValue.isLoading,
                              onPressed: () {
                                setState(() {
                                  controller.state.stage =
                                      NewCustomerStage.setPin;
                                });

                                if (pinTextEditingController.text
                                        .toString()
                                        .length ==
                                    6) {
                                  controller.createNewCustomer(
                                    NewCustomerWalletRequest(
                                      mobileNo:
                                          phoneNumberController.text.toString(),
                                      //
                                      firstName:
                                          firstNameController.text.toString(),
                                      lastName:
                                          lastNameController.text.toString(),
                                      email: emailController.text.toString(),
                                      password:
                                          passwordController.text.toString(),
                                      countryCode: "+234",
                                      pin: pinTextEditingController.text
                                          .toString(),
                                    ),
                                  );
                                }

                                /// ToDo move to next screen only when Api returns success
                                _createAccountPageController?.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              }, //state.isLoading ? null : _submit,
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Verification View
                    SingleChildScrollView(
                      key: thirdKey,
                      child: Form(
                        key: otpFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            gapH24,
                            const TopIndicator(
                                isProfileView: false,
                                isPinView: false,
                                isVerificationView: true),
                            gapH32,
                            Wrap(
                              children: [
                                Text(
                                  'Verify your account by entering the 6 digit code sent to',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.black,
                                      ),
                                ),
                              ],
                            ),
                            gapH8,
                            Text(
                              '*******5678',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                            ),
                            gapH32,
                            PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: AppColors.primary.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                              ),
                              length: 6,
                              obscuringCharacter: '*',
                              animationType: AnimationType.fade,
                              validator: (v) {
                                if (v == null) {
                                  return 'Required';
                                }
                                if (v.length < 3) {
                                  return "";
                                } else {
                                  return null;
                                }
                              },
                              pinTheme: PinTheme(
                                inactiveFillColor:
                                    AppColors.primary.withOpacity(.2),
                                activeColor: AppColors.primary.withOpacity(.2),
                                selectedFillColor:
                                    AppColors.primary.withOpacity(.2),
                                errorBorderColor: AppColors.primary,
                                selectedColor: AppColors.primary,
                                borderWidth: 0.5,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 60,
                                fieldWidth: 50,
                                activeFillColor:
                                    hasError ? Colors.orange : Colors.white,
                              ),
                              cursorColor: Colors.black,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              textStyle:
                                  const TextStyle(fontSize: 20, height: 1.6),
                              backgroundColor: Colors.transparent,
                              enableActiveFill: true,
                              errorAnimationController: otpErrorController,
                              controller: otpTextEditingController,
                              keyboardType: TextInputType.phone,
                              boxShadows: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                ),
                              ],
                              onCompleted: (v) {
                                debugPrint('Completed');
                              },
                              // onTap: () {
                              //   print("Pressed");
                              // },
                              onChanged: (value) {
                                debugPrint(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                debugPrint('Allowing to paste $text');
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc

                                return true;
                              },
                            ),
                            gapH16,
                            Text(
                              hasError
                                  ? '*Please fill up all the cells properly'
                                  : '',
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            gapH16,
                            GestureDetector(
                              onTap: () {
                                ResendOtpRequest(
                                    mobileNo:
                                        phoneNumberController.text.toString(),
                                    countryCode: '+234');
                              },
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text: "Didn't get the code? ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' Resend in 60s',
                                      style: TextStyle(
                                        color: AppColors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            gapH48,
                            PrimaryButton(
                              buttonColor: AppColors.primary,
                              text: 'NEXT',
                              isLoading: false,
                              onPressed: () {
                                controller.verifyOtp(
                                  VerifyOtpRequest(
                                      mobileNo:
                                          phoneNumberController.text.toString(),
                                      otp: otpTextEditingController.text
                                          .toString(),),
                                );

                                // context.pushNamed(AppRoute.loginView.name);
                              }, //state.isLoading ? null : _submit,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}

/// StatelessWidget [CheckPasswordWidget]
class CheckPasswordWidget extends StatelessWidget {
  /// Creates instance of [CheckPasswordWidget]
  const CheckPasswordWidget({
    Key? key,
    required this.hasNumber,
    required this.hasSpecialChar,
    required this.hasUpcaseLowCase,
    required this.rightLenght,
  }) : super(key: key);
  final bool rightLenght;
  final bool hasUpcaseLowCase;
  final bool hasNumber;
  final bool hasSpecialChar;

  /// Styling

  @override
  Widget build(BuildContext context) {
    const styleForText = TextStyle(fontSize: 10, color: AppColors.primary);

    return Wrap(
      children: [
        const Text(
          'Use:',
          style: styleForText,
        ),
        SizedBox(
          child: Wrap(
            children: [
              SvgPicture.asset(
                  rightLenght ? AppAssets.check_good : AppAssets.check_wrong),
              gapW4,
              const Text('8-20 characters', style: styleForText),
            ],
          ),
        ),
        gapW4,
        SizedBox(
          child: Wrap(
            children: [
              SvgPicture.asset(hasUpcaseLowCase
                  ? AppAssets.check_good
                  : AppAssets.check_wrong),
              gapW4,
              const Text('Upper & Lowercase', style: styleForText),
            ],
          ),
        ),
        gapW4,
        SizedBox(
          child: Wrap(
            children: [
              SvgPicture.asset(
                hasNumber ? AppAssets.check_good : AppAssets.check_wrong,
              ),
              gapW4,
              const Text('Number (s)', style: styleForText),
            ],
          ),
        ),
        gapW4,
        SizedBox(
          child: Wrap(
            children: [
              SvgPicture.asset(hasSpecialChar
                  ? AppAssets.check_good
                  : AppAssets.check_wrong),
              gapW4,
              const Text('Special Characters', style: styleForText),
            ],
          ),
        ),
      ],
    );
  }
}
