import 'package:cyberpay_mobile_2/features/airtime_data/data_purchase_datails.dart';
import 'package:cyberpay_mobile_2/features/dashboard/bvn_submission.dart';
import 'package:cyberpay_mobile_2/features/dashboard/dashboard_home.dart';
import 'package:cyberpay_mobile_2/features/login/login_view.dart';
import 'package:cyberpay_mobile_2/features/send_recieve_money/receive/request_money.dart';
import 'package:cyberpay_mobile_2/features/send_recieve_money/send/send_money.dart';
import 'package:cyberpay_mobile_2/features/sign_up/account_creation_view.dart';
import 'package:cyberpay_mobile_2/features/virtual_card/virtual_card_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../features/airtime_data/airtime_and_data.dart';
import '../../../features/airtime_data/airtime_purchase_details.dart';
import '../../../features/dashboard/face_verification.dart';
import '../../../features/onboarding/CyberpayOnBoarding.dart';
import '../../../features/onboarding/welcome_splash.dart';
import '../../../features/add_bank_and_card/add_main_view.dart';
import '../../../features/saved/saved_card_and_bank.dart';

/// Enum for app routes
enum AppRoute {
  /// Welcome
  welcome,

  /// LoginView
  loginView,
 /// LoginPinView,
  loginPinView,

  /// PinSetupView,
  linSetupView,
 ///  dashboardHome
   dashboardHome,

  /// RegisterView,
  registerView,

  /// HomeView,
  homeView,

  /// BillsCategoryView,
  billsCategoryView,

  /// BillHomeView,
  billHomeView,

  /// BillSelectionView,
  billSelectionView,

  /// BillersView,
  billersView,

  /// IntroView,
  introView,

  /// TopUpViw,
  topUpView,

  /// Face verification 1
  faceVerificationView,
  ///bvnSubmissionView
  bvnSubmissionView,
  /// virtualCardView
   virtualCardView,
  ///Add card and bank main view
  addingBankCardMainView,
  ///Saved card and bank main view

  savedBankCardMainView,
  ///sendMoney
  sendMoney,
  ///recieveMoney
  receiveMoney,
 /// airtimeAndData
  airtimeAndData,
 /// airtimePurchaseDetails
  airtimePurchaseDetails,
  /// dataPurchaseDetails
  dataPurchaseDetails
}

/// gorouter provider
final goRouterProvider = Provider<GoRouter>((ref) {
// final authRepository = ref.watch(assetMgmtAuthRepositoryProvider);
// final sharedPreferences = ref.watch(sharedPreferencesServiceProvider);
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      name: AppRoute.welcome.name,
      builder: (context, state) => const WelcomeSplash(),
      routes: [
        GoRoute(
          path: 'loginView',
          name: AppRoute.loginView.name,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: 'introView',
          name: AppRoute.introView.name,
          builder: (context, state) => const CyberpayOnBoarding(),
        ),

        GoRoute(
          path: 'registerView',
          name: AppRoute.registerView.name,
          builder: (context, state) => const AccountCreationView(),
        ),
        GoRoute(
          path: 'dashboardHome',
          name: AppRoute.dashboardHome.name,
          builder: (context, state) => const DashboardHome(),
        ),
        GoRoute(
          path: 'faceVerificationView',
          name: AppRoute.faceVerificationView.name,
          builder: (context, state) => const FaceVerification(),
        ),
        GoRoute(
          path: 'bvnSubmissionView',
          name: AppRoute.bvnSubmissionView.name,
          builder: (context, state) => const BvnSubmission(),
        ),
        GoRoute(
          path: 'virtualCardView',
          name: AppRoute.virtualCardView.name,
          builder: (context, state) => const VirtualCards(),
        ),
        GoRoute(
          path: 'addingBankCardMainView',
          name: AppRoute.addingBankCardMainView.name,
          builder: (context, state) => const AddingBankCardMainView(),
        ),

        GoRoute(
          path: 'savedBankCardMainView',
          name: AppRoute.savedBankCardMainView.name,
          builder: (context, state) => const SavedBankAndCardMainView(),
        ),
        GoRoute(
          path: 'sendMoney',
          name: AppRoute.sendMoney.name,
          builder: (context, state) => const SendMoney(),
        ),
        GoRoute(
          path: 'receiveMoney',
          name: AppRoute.receiveMoney.name,
          builder: (context, state) => const RequestMoney(),
        ),
        GoRoute(
          path: 'airtimeAndData',
          name: AppRoute.airtimeAndData.name,
          builder: (context, state) => const AirtimeAndData(),
        ),
        GoRoute(
          path: 'airtimePurchaseDetails',
          name: AppRoute.airtimePurchaseDetails.name,
          builder: (context, state) => const AirtimePurchaseDetails(),
        ),
        GoRoute(
          path: 'dataPurchaseDetails',
          name: AppRoute.dataPurchaseDetails.name,
          builder: (context, state) => const DataPurchaseDetail(),
        ),
      ],
    ),
  ]);
});
