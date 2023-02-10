import 'package:cyberpay_mobile_2/common/configs/routes/route_paths.dart';
import 'package:cyberpay_mobile_2/common/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_colors.dart';
import '../../common/configs/styles/app_sizes.dart';

///  BvnSubmission View
class BvnSubmission extends StatefulWidget {
  /// Creates instance [ BvnSubmission ]
  const BvnSubmission({Key? key}) : super(key: key);

  @override
  State<BvnSubmission> createState() => _BvnSubmissionState();
}

class _BvnSubmissionState extends State<BvnSubmission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverAppBar(
              leading: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  CupertinoIcons.back,
                  color: AppColors.primary,
                  size: 40,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                child: SizedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.profile),
                      gapW4,
                      Column(
                        children: const [
                          Text('FACE VERIFICATION',style: TextStyle(color: AppColors.green),),

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
                        children: [
                          const Text('BVN'),
                          gapH4,
                          Container(
                            height: 2,
                            width: 25,
                            color: AppColors.dark_blue,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
           const SliverToBoxAdapter(
              child: gapH16,
            ),
            SliverToBoxAdapter(
              child: Container(
                width: screenSize(context).width,
                height: screenSize(context).height * 0.55,
                padding:const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                margin: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0,
                      offset: Offset(2, 12),
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                          'Fill in your BVN details'),
                    ],
                  ),
                  gapH8,
                  gapH12,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
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
                  gapH4,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Why do we need your BVN?',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.blue2,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  gapH8,

                ]),
              ),
            ),

            SliverToBoxAdapter(
              child:
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
                child: PrimaryButton(
                  onPressed:  () {
                    context.pushNamed(
                      AppRoute.virtualCardView.name
                    );
                  },
                  buttonColor: AppColors.primary,
                  text: 'SUBMIT',
                ),
              ),)

          ])),

    );
  }
}
