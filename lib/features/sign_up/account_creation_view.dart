import 'dart:async';

import 'package:cyberpay_mobile_2/core/configs/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/configs/routes/route_paths.dart';
import '../../core/configs/styles/app_assests.dart';
import '../../core/configs/styles/app_sizes.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/top_indicator.dart';

///  AccountCreationView
class AccountCreationView extends StatefulWidget {
  /// creates and instance of [AccountCreationView]
  const AccountCreationView({Key? key}) : super(key: key);

  @override
  State<AccountCreationView> createState() => _AccountCreationViewState();
}

class _AccountCreationViewState extends State<AccountCreationView> {
  final _personalDetailsFormKey = GlobalKey<FormState>();
  final _createAccountPageController = PageController();
  final pin_formKey = GlobalKey<FormState>();
  final otp_formKey = GlobalKey<FormState>();
  TextEditingController pinTextEditingController = TextEditingController();
  TextEditingController otpTextEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;

  String currentText = '';
  
  int creationState = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: Icon(CupertinoIcons.back, color: AppColors.primary,size: 40,),
          elevation: 0,
          centerTitle: true,
          title: Container(
              margin: EdgeInsets.only(bottom: 20, top: 10),
              height: 30,
              child: Center(child: SvgPicture.asset(AppAssets.cyberpayLogo))),
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
                  width: screenSize(context).width,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: CustomScrollView(
                      slivers: [
                    SliverToBoxAdapter(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      child:
                                      RichText(
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
                                                ..onTap = () {},
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
                        ])),
                    SliverFillRemaining(
                        child: PageView(
                      controller: _createAccountPageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (int i) {
                        setState(() {
                          creationState = i;
                        });
                      },
                      children: [
                        /// First account creation View
                        SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 12),
                            child:
                            Form(
                              key:_personalDetailsFormKey,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    gapH8,
                                    TopIndicator(
                                        isProfileView: true,
                                        isPinView: false,
                                        isVerificationView: false),
                                    gapH24,
                                    Text(
                                      'First Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    gapH8,
                                    TextFormField(
                                      decoration: InputDecoration(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    gapH8,
                                    TextFormField(
                                      decoration: InputDecoration(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    gapH8,
                                    TextFormField(
                                      decoration: InputDecoration(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    gapH8,
                                    TextFormField(
                                      decoration: InputDecoration(
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
                                      style: Theme.of(context)
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
                                      decoration: InputDecoration(
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
                                      style: Theme.of(context)
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
                                      decoration: InputDecoration(
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
                                    Row(
                                      children: [
                                        Material(
                                          child: Checkbox(
                                            activeColor: AppColors.primary,
                                            value: false,
                                            //controller
                                            // .pCheckedAgreement.value,
                                            onChanged: (value) {
                                              // controller.pCheckedAgreement.value =
                                              // !controller
                                              //     .pCheckedAgreement.value;
                                            },
                                          ),
                                        ),
                                        Container(
                                          // margin: const EdgeInsets.only(top: 8),
                                          // width: AppAssets
                                          //     .screenSize(context)
                                          //     .width * 0.55,
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
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: AppColors.black,
                                                  ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      '  Terms and Conditions',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: AppColors.red,
                                                      ),
                                                  recognizer:
                                                      TapGestureRecognizer()
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

                                          creationState + 1 ;
                                          _createAccountPageController?.nextPage(
                                              duration: const Duration(milliseconds: 500),
                                              curve: Curves.ease,);

                                        })
                                  ]),
                            )),
                        /// Transaction Pin View
                        SingleChildScrollView(child:
                        Form(
                          key: pin_formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              gapH24,
                              TopIndicator(
                                  isProfileView: false,
                                  isPinView: true,
                                  isVerificationView: false),
                              gapH32,

                            Wrap(
                              children: [Text(
                              'Enter a 6 digit security pin that will be used to \nconfirm all transactions',
                                style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black,
                                )),
                           ] ),
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
                                  if (v.length < 3) {
                                    return "";
                                  } else {
                                    return null;
                                  }
                                },
                                pinTheme: PinTheme(
                                  inactiveFillColor: AppColors.primary.withOpacity(.2),
                                  activeColor: AppColors.primary.withOpacity(.2),
                                  selectedFillColor: AppColors.primary.withOpacity(.2),
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
                                animationDuration: const Duration(milliseconds: 300),
                                textStyle: const TextStyle(fontSize: 20, height: 1.6),
                                backgroundColor: Colors.transparent,
                                enableActiveFill: true,
                                errorAnimationController: errorController,
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
                                hasError ? '*Please fill up all the cells properly' : '',
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
                                isLoading: false,
                                onPressed: () {
                                  creationState + 1 ;
                                  _createAccountPageController?.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,);
                                }, //state.isLoading ? null : _submit,
                              ),
                            ],
                          ),
                        ),
                            ),
                        /// Verification View
                        SingleChildScrollView(child:
                        Form(
                          key: otp_formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              gapH24,
                              TopIndicator(
                                  isProfileView: false,
                                  isPinView: false,
                                  isVerificationView: true),
                              gapH32,

                            Wrap(
                              children: [Text(
                              'Verify your account by entering the 6 digit code sent to',
                                style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black,
                                )),
                           ] ),
                              gapH8,
                              Text(
                            '*******5678',
                              style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                              )),
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
                                  inactiveFillColor: AppColors.primary.withOpacity(.2),
                                  activeColor: AppColors.primary.withOpacity(.2),
                                  selectedFillColor: AppColors.primary.withOpacity(.2),
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
                                animationDuration: const Duration(milliseconds: 300),
                                textStyle: const TextStyle(fontSize: 20, height: 1.6),
                                backgroundColor: Colors.transparent,
                                enableActiveFill: true,
                                errorAnimationController: errorController,
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
                                hasError ? '*Please fill up all the cells properly' : '',
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              gapH16,
                              GestureDetector(
                                onTap: () {},
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    text: "Didn't get the code? ",
                                    style: TextStyle(color: Colors.black54, fontSize: 15),
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
                                  context
                                      .pushNamed(AppRoute.loginView.name);
                                }, //state.isLoading ? null : _submit,
                              ),
                            ],
                          ),
                        ),
                            )
                      ],
                    ))
                  ]))),
        ));
  }
}

/// StatelessWidget [CheckPasswordWidget]
class CheckPasswordWidget extends StatelessWidget {
  /// Creates instance of [CheckPasswordWidget]
  CheckPasswordWidget(
      {Key? key,
      required this.hasNumber,
      required this.hasSpecialChar,
      required this.hasUpcaseLowCase,
      required this.rightLenght})
      : super(key: key);
  final bool rightLenght;
  final bool hasUpcaseLowCase;
  final bool hasNumber;
  final bool hasSpecialChar;

  /// Styling
  final styleForText = TextStyle(fontSize: 10, color: AppColors.primary);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Use:',
          style: styleForText,
        ),
        SizedBox(
          child: Wrap(
            children: [
              SvgPicture.asset(
                  rightLenght ? AppAssets.check_good : AppAssets.check_wrong),
              gapW4,
              Text('8-20 characters', style: styleForText),
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
              Text('Upper & Lowercase', style: styleForText),
            ],
          ),
        ),
        gapW4,
        SizedBox(
          child: Wrap(
            children: [
              SvgPicture.asset(
                  hasNumber ? AppAssets.check_good : AppAssets.check_wrong),
              gapW4,
              Text('Number (s)', style: styleForText),
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
              Text('Special Characters', style: styleForText),
            ],
          ),
        )
      ],
    );
  }
}
