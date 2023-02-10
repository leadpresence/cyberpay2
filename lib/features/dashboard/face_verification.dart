import 'package:cyberpay_mobile_2/common/configs/routes/route_paths.dart';
import 'package:cyberpay_mobile_2/common/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../../common/widgets/order_and_undered_list.dart';

/// FaceVerification
class FaceVerification extends StatefulWidget {
  /// Creates instance of [FaceVerification]
  const FaceVerification({Key? key}) : super(key: key);

  @override
  State<FaceVerification> createState() => _FaceVerificationState();
}

class _FaceVerificationState extends State<FaceVerification> {

  // bool? isImageSetToEnableButton = false;
  final passportSteps = [
    'Make sure your environment is well lit',
    'Make sure you’re facing the camera',
    'Make sure your face isn’t covered',
    'Keep your phone vertical',
  ];
  bool isImageSetToEnableButton({bool newState = false}){
    if(newState) {
     return true;
    }
    return newState;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(slivers: [
        SliverAppBar(
          leading: InkWell(
            onTap: ()=>Navigator.pop(context),
            child:const Icon(
              CupertinoIcons.back,
              color: AppColors.primary,
              size: 40,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.profile),
                  gapW4,
                  Column(
                    children: [
                      const  Text('FACE VERIFICATION'),
                      gapH4,
                      Container(
                        height: 2,
                        width: 125,
                        color: AppColors.dark_blue,
                      )
                    ],
                  ),
                  gapW32,
                  SvgPicture.asset(
                    AppAssets.next_arrow,
                    width: 90,
                  ),
                  gapW32,
                  SvgPicture.asset(AppAssets.bvn),
                  gapW4,
                  Column(
                    children: const [
                      Text('BVN'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
            const   SliverToBoxAdapter(
          child: gapH16,
        ),
        SliverToBoxAdapter(
          child: Container(
            width: screenSize(context).width,
            height: screenSize(context).height * 0.55,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
            margin:const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  offset:const Offset(2, 12),
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(children: [
              SvgPicture.asset(AppAssets.user_focus),
              Wrap(
                children: const [
                  Text(
                      'We’ll need you to take a portrait selfie to verify your identity.'),
                ],
              ),
              gapH8,
              Row(
                children: [
                  Text(
                    'Requirements',
                    overflow: TextOverflow.fade,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              gapH8,
              OrderedList(texts: passportSteps),
              gapH8,
              SizedBox(
                  width: 150,
                  height: 30,
                  child: PrimaryButton(text: 'OPEN CAMERA',
                    onPressed:() {
                    context.pushNamed(AppRoute.bvnSubmissionView.name);
                    },buttonColor: AppColors.dark_blue,))
            ]),
          ),
        ),

            SliverToBoxAdapter(
              child:
              Padding(
                padding:const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
                child: PrimaryButton(
                  onPressed: isImageSetToEnableButton() ? null : () {},
                text: 'NEXT',
                ),
              ),)

      ])),
    );
  }
}
