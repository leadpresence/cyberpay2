import 'package:cyberpay_mobile_2/common/configs/routes/route_paths.dart';
import 'package:cyberpay_mobile_2/common/configs/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../common/configs/styles/app_assests.dart';
import '../../common/utils/app_strings.dart';
import '../../common/widgets/bubble_dots.dart';
import '../../common/widgets/primary_button.dart';
import 'CyberpayPreviewScreen.dart';

/// cyberpay Onboarding screens
class CyberpayOnBoarding extends StatefulWidget {
  /// Creates instance of [CyberpayOnBoarding]
  const CyberpayOnBoarding({Key? key}) : super(key: key);

  @override
  State<CyberpayOnBoarding> createState() => _CyberpayOnBoardingState();
}

class _CyberpayOnBoardingState extends State<CyberpayOnBoarding> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentIndex = 0;
  String _mNext = 'NEXT';

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 20,top: 10),
                height: 30,
                child: Center(child: SvgPicture.asset(AppAssets.cyberpayLogo))),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: headingsTr.length,
                onPageChanged: (int index) {
                  setState(() {
                    setState(() {
                      currentIndex = index;
                      if (index == (headingsTr.length - 1)) {
                        _mNext = AppText.getStartedTxt;
                      } else {
                        _mNext = AppText.kNext;
                      }
                    });
                    // currentIndex = index;
                  });
                },
                itemBuilder: (context, position) {
                  return CyberpayPreviewScreen(
                    image: imageListTr[position],
                    heading: headingsTr[position],
                    subHeading: subHeadingsTr[position],
                  );
                },
              ),
            ),

            SizedBox(
              height: 215,
              child: Column(
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 26.0, right: 22, top: 40),
                      child: PrimaryButton(
                        buttonColor:AppColors.primary ,
                          onPressed: () {
                            if (headingsTr.length == (currentIndex + 1)) {
                            context.pushNamed(AppRoute.loginView.name);
                            } else {
                              _pageController?.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,);
                            }
                          },
                          text:_mNext,),),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      imageListTr.length,
                      (index) => BubbleDots(index:index,position: currentIndex,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (currentIndex > 0) InkWell(
                                  onTap: () => _pageController.previousPage(
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease),
                                  child: SvgPicture.asset(
                                    AppAssets.previousIcon,
                                    semanticsLabel: 'Previous',
                                    color: Colors.black,
                                    // height: 24,
                                  ),
                                ) else SizedBox.shrink(),
                          if (currentIndex != 2) InkWell(
                                  onTap: () => context.pushNamed(
                                      AppRoute.loginView.name),
                                  child: Text('SKIP',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800)),
                                ) else SizedBox.shrink(),
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}




