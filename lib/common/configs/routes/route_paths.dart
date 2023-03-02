import 'package:cyberpay_mobile_2/features/account/account_home.dart';
import 'package:cyberpay_mobile_2/features/airtime_data/data_purchase_datails.dart';
import 'package:cyberpay_mobile_2/features/dashboard/bvn_submission.dart';
import 'package:cyberpay_mobile_2/features/dashboard/dashboard_home.dart';
import 'package:cyberpay_mobile_2/features/login/login_view.dart';
import 'package:cyberpay_mobile_2/features/pay_bills/pay_utility_bills.dart';
import 'package:cyberpay_mobile_2/features/send_recieve_money/receive/request_money.dart';
import 'package:cyberpay_mobile_2/features/send_recieve_money/send/send_money.dart';
import 'package:cyberpay_mobile_2/features/sign_up/account_creation_view.dart';
import 'package:cyberpay_mobile_2/features/sign_up/sign_up_screen_state.dart';
import 'package:cyberpay_mobile_2/features/virtual_card/virtual_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../features/add_bank_and_card/add_main_view.dart';
import '../../../features/airtime_data/airtime_and_data.dart';
import '../../../features/airtime_data/airtime_purchase_details.dart';
import '../../../features/dashboard/dashboard_profile.dart';
import '../../../features/dashboard/dashboard_trasactions.dart';
import '../../../features/dashboard/face_verification.dart';
import '../../../features/onboarding/CyberpayOnBoarding.dart';
import '../../../features/onboarding/welcome_splash.dart';
import '../../../features/pay_bills/cable_tv_purchase.dart';
import '../../../features/pay_bills/electricity_bills_purchase.dart';
import '../../../features/pay_bills/internet_service_purchase.dart';
import '../../../features/pay_bills/lcc_bills.dart';
import '../../../features/saved/saved_card_and_bank.dart';
import '../../../features/sign_up/sign_up_screen_state.dart';
import '../../../features/sign_up/sign_up_screen_state.dart';
import '../../../features/wallet/otp_verify_wallet_transaction.dart';
import '../../../features/wallet/top_up_wallet.dart';
import '../../../features/wallet/wallet_home.dart';
import '../../../features/wallet/withdraw_from_wallet.dart';

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

  /// profileView
  profileView,

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
  dataPurchaseDetails,

  /// payUtilityBills
  payUtilityBills,

  /// electricityBillsPayment,
  electricityBillsPayment,

  ///cableBillsPayment,
  cableBillsPayment,

  /// internetServicesBillsPayment,
  internetServicesBillsPayment,

  /// lccServicesBillsPayment,
  lccServicesBillsPayment,

  /// settingsHomeView
  settingsHomeView,

  /// accountHome,
  accountHome,

  /// walletHome
  walletHome,

  /// walletWithdrawFund
  walletWithdrawFund,

  /// walletTop
  walletTopUp,

  ///  walletOtpVerification
  walletOtpVerification,

  /// transactions
  transactions,

  /// transactionsDetails
  transactionsDetails
}

/// gorouter provider
final goRouterProvider = Provider<GoRouter>((ref) {
// final authRepository = ref.watch(assetMgmtAuthRepositoryProvider);
// final sharedPreferences = ref.watch(sharedPreferencesServiceProvider);


  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: AppRoute.welcome.name,
      builder: (context, state) => const WelcomeSplash(),
      routes:<GoRoute> [
        GoRoute(
          path: 'loginView',
          name: AppRoute.loginView.name,
          pageBuilder: (context, state){
            return  NoTransitionPage(
                key: state.pageKey,
                child:   LoginView(key: state.pageKey,), );
          },
          // builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: 'introView',
          name: AppRoute.introView.name,
          builder: (context, state) => const CyberpayOnBoarding(),
        ),
        GoRoute(
            path: 'registerView',
            name: AppRoute.registerView.name,
            pageBuilder: (context, state){
              return  NoTransitionPage(
                key: state.pageKey,
                child:   AccountCreationView(key: state.pageKey,), );
            },
           // builder: (context, state) => const AccountCreationView(),

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
        GoRoute(
          path: 'payUtilityBills',
          name: AppRoute.payUtilityBills.name,
          builder: (context, state) => const PayUtilityBills(),
        ),
        GoRoute(
          path: 'lccServicesBillsPayment',
          name: AppRoute.lccServicesBillsPayment.name,
          builder: (context, state) => const LekkiConsessionPayment(),
        ),
        GoRoute(
          path: 'internetServicesBillsPayment',
          name: AppRoute.internetServicesBillsPayment.name,
          builder: (context, state) => const InternetServicePurchase(),
        ),
        GoRoute(
          path: 'cableBillsPayment',
          name: AppRoute.cableBillsPayment.name,
          builder: (context, state) => const CableTvPurchase(),
        ),
        GoRoute(
          path: 'electricityBillsPayment',
          name: AppRoute.electricityBillsPayment.name,
          builder: (context, state) => const ElectricityBillsPurchase(),
        ),
        GoRoute(
          path: 'profileView',
          name: AppRoute.profileView.name,
          builder: (context, state) => const Profile(),
        ),
        GoRoute(
          path: 'accountHome',
          name: AppRoute.accountHome.name,
          builder: (context, state) => const AccountHome(),
        ),
        GoRoute(
          path: 'walletHome',
          name: AppRoute.walletHome.name,
          builder: (context, state) => const WalletHome(),
        ),
        GoRoute(
          path: 'walletTopUp',
          name: AppRoute.walletTopUp.name,
          builder: (context, state) => const WalletTopUp(),
        ),
        GoRoute(
          path: 'walletWithdrawFund',
          name: AppRoute.walletWithdrawFund.name,
          builder: (context, state) => const WithdrawFromWallet(),
        ),
        GoRoute(
          path: 'walletOtpVerification',
          name: AppRoute.walletOtpVerification.name,
          builder: (context, state) => const WalletOtpVerification(),
        ),
        GoRoute(
          path: 'transactions',
          name: AppRoute.transactions.name,
          builder: (context, state) => const Transactions(),
        ),
        GoRoute(
          path: 'transactionsDetails',
          name: AppRoute.transactionsDetails.name,
          builder: (context, state) => const Transactions(),
        ),
      ],
    ),
  ],);
});


// the following assertion was thrown building Navigator-[GlobalObject<NavigatorState> _WidgetsAppState