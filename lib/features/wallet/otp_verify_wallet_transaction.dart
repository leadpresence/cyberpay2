import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../common/configs/routes/route_paths.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../../common/widgets/primary_button.dart';

/// WalletOtpVerification
class WalletOtpVerification extends StatefulWidget {
  /// constructor for [WalletOtpVerification]
  const WalletOtpVerification({Key? key}) : super(key: key);

  @override
  State<WalletOtpVerification> createState() => _WalletOtpVerificationState();
}

class _WalletOtpVerificationState extends State<WalletOtpVerification> {
  final withdrawalOtpFormKey = GlobalKey<FormState>();
  TextEditingController pinTextEditingController = TextEditingController();
  TextEditingController otpTextEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
                toolbarHeight: kToolbarHeight,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    'Verify transaction',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.bold),
                  ),
                )),
            const SliverToBoxAdapter(
              child: gapH16,
            ),
            SliverToBoxAdapter(
              child: Form(
                key: withdrawalOtpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(children: [
                      Text(
                          'Verify your account by entering the 6 digit code sent to',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.black,
                                  )),
                    ]),
                    gapH8,
                    Text('*******5678',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                      text: 'VERIFY',
                      isLoading: false,
                      onPressed: () {}, //state.isLoading ? null : _submit,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
