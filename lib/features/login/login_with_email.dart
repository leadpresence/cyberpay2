import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/configs/routes/route_paths.dart';
import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../../common/widgets/primary_button.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final withEmailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
      child:  Form(
        key:withEmailKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH8,
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
                decoration:const  InputDecoration(
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
                decoration:const  InputDecoration(
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
              gapH8,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Text('Reset password',style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                      fontWeight:
                      FontWeight.bold,
                      color: AppColors.black,
                    ),),
                  )
                ],),
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
                          onTap: (){
                          },
                          child: SizedBox(
                            height: 90,
                            width: 100,
                            child: Column(
                              children: [
                                SvgPicture.asset(AppAssets.login_finger_print),
                                Text('Login by Fingerprint',style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                  fontWeight:
                                  FontWeight.normal,
                                  color: AppColors.black,
                                ),)
                              ],
                            ),),
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
                        child:InkWell(
                          onTap: (){
                          },
                          child: SizedBox(
                            height: 90,
                            width: 100,
                            child: Column(
                              children: [
                                SvgPicture.asset(AppAssets.login_face),
                                Text('Login by Face ID',style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                  fontWeight:
                                  FontWeight.normal,
                                  color: AppColors.black,
                                ),)
                              ],
                            ),),

                        ),
                      ),
                    ],
                  ),
                ],
              ),

              gapH48,
              PrimaryButton(
                  buttonColor: AppColors.primary,
                  text: 'SIGN IN',
                  onPressed: () {
                    context.pushNamed(AppRoute.dashboardHome.name);


                  }),
              gapH8,
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
                    text: 'Don’t have an account?',
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
                        '  Sign up',
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
                          context.pushNamed(AppRoute.registerView.name);
                            // Single tapped.
                          },
                      ),
                    ],
                  ),
                ),
              ),

            ]),
      ),
    );
  }
}
