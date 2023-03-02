import 'package:cyberpay_mobile_2/common/configs/styles/app_colors.dart';
import 'package:cyberpay_mobile_2/common/utils/async_value_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/configs/styles/app_assests.dart';
import '../../common/configs/styles/app_sizes.dart';
import '../sign_up/create_customer_controller.dart';
import 'login_controller.dart';
import 'login_with_email.dart';
import 'login_with_phone.dart';

/// LoginView
class LoginView extends ConsumerStatefulWidget {
  /// Constructor LoginView
  const LoginView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final emailViewKey = UniqueKey();
  final phoneViewKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(
      createCustomerControllerProvider.select((state) => state.submitValue),
          (_, state) => state.showAlertDialogOnError(context),
      onError: (error, stackTrace) => debugPrint('An error occurred $error'),
    );

    final controller = ref.watch(loginControllerProvider.notifier);

    return
      DefaultTabController(
        length: 2,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 10),
                  height: 30,
                  child:
                      Center(child: SvgPicture.asset(AppAssets.cyberpayLogo)),),
            ),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      toolbarHeight: 140,
                      automaticallyImplyLeading: false,
                      flexibleSpace: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: AppColors.red),
                          ),
                          gapH8,
                          Text(
                            'Login to your account. ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey),
                          ),
                          gapH24,
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.31),
                              ),
                            ),
                            child: TabBar(

                              labelStyle:const TextStyle(color: AppColors.white,fontSize: 12.0,fontWeight: FontWeight.bold),
                              unselectedLabelStyle: const TextStyle(fontSize: 12.0,color: AppColors.white,fontWeight: FontWeight.bold),
                              labelPadding: const EdgeInsets.all(0),
                              unselectedLabelColor: AppColors.dark_blue,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.dark_blue,
                              ),
                              tabs: [
                                Tab(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child:   const Align(
                                        child: Text('EMAIL ADDRESS'),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child:   const Align(
                                        child: Text('PHONE NUMBER'),),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                      SliverFillRemaining(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          LoginWithEmail(key: emailViewKey,),
                          LoginWithPhone(key: phoneViewKey,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),),);
  }}


  // The following assertion was thrown building Navigator - [ LabeledGlobalKey<NavigatorState> ()](dependencies (HeroControllerScope,UnmanagedRestorationScope)