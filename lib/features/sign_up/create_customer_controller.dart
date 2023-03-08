import 'package:cyberpay_mobile_2/common/data/models/api/verify_otp_request.dart';
import 'package:cyberpay_mobile_2/features/sign_up/sign_up_screen_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/data/models/api/new_customer_wallet_request.dart';
import '../../common/data/models/api/new_customer_wallet_response.dart';
import '../../common/data/models/api/resend_otp_request.dart';
import '../../common/data/models/api/verify_otp_response.dart';
import '../../common/data/repositories/auth/authRepositoryImpl.dart';
import '../../common/utils/app_exception.dart';
import '../../common/utils/error_handlers.dart';

/// CreateCustomerController
class CreateCustomerController extends StateNotifier<SignUpScreenState> {
  /// An object used by providers to interact with other providers
  /// and the life-cycles of the application.
  Ref ref;

  /// CreateCustomerController Constructor
  CreateCustomerController(this.ref) : super(SignUpScreenState());



  ///A  Future method to createNewCustomer
  Future<NewCustomerWalletResponse> createNewCustomer(
    NewCustomerWalletRequest request,
  ) async {
    final repo = ref.read(authRepositoryImplProvider);

    /// Todo Add Hive to save user submitted data
    try {
      state = state.copyWith(verifyOtpValue: const AsyncLoading());
      final res = await repo.createNewCustomer(request);
      if (mounted) {
        state = state.copyWith(
          submitValue: const AsyncData(null),
          verifyOtpValue:   const AsyncData(null),
          otpVerified: false,
          stage: NewCustomerStage.verifyOtp,
        );
        state = state.copyWith(value: AsyncData(res));
      }

      return res;
    } on DioError catch (err, stackTraceMsg) {
      state = state.copyWith(
        verifyOtpValue:
            AsyncError(AppException(handleApiError(err)), stackTraceMsg),
      );
    }

    return NewCustomerWalletResponse(
      id: -1,
      otpGeneratedDateTime: '',
      message: '',
      otpExpiresIn: -1,
    );
  }

  /// verify otp for registration
  Future<VerifyOtpResponse> verifyOtp(VerifyOtpRequest otpRequest) async {
    final repo = ref.read(authRepositoryImplProvider);
    try {
      state = state.copyWith(verifyOtpValue: const AsyncLoading());
      final res = await repo.verifyUserOtp(otpRequest);
      if (mounted) {
        state = state.copyWith(
          submitValue: const AsyncData(null),
          verifyOtpValue: const AsyncData(null),
          otpVerified: true,
        );
      }


      return res;
    } on DioError catch (err, stackTraceMsg) {
      state = state.copyWith(
        verifyOtpValue:
            AsyncError(AppException(handleApiError(err)), stackTraceMsg),
      );
    }

    return VerifyOtpResponse(
      succeeded: false,
      message: '',
      data: null,
    );
  }
  /// Resend Otp for registration
  Future<VerifyOtpResponse> resendUserOtp(ResendOtpRequest resendOtpRequest) async {
    final repo = ref.read(authRepositoryImplProvider);
    try {
      state = state.copyWith(resendOtpValue: const AsyncLoading(),);
      final res = await repo.resendUserOtp(resendOtpRequest);
      if (mounted) {
        state = state.copyWith(
          submitValue: const AsyncData(null),
          verifyOtpValue: const AsyncData(null),
          otpVerified: false,
          resendOtpValue:   AsyncData(res),

        );
      }
      state = state.copyWith(resendOtpValue: AsyncData(res),);
      return res;
    } on DioError catch (err, stackTraceMsg) {
      state = state.copyWith(
        verifyOtpValue:
        AsyncError(AppException(handleApiError(err)), stackTraceMsg),
      );
    }

    /// used cos it returns same type of response
    return VerifyOtpResponse(
      succeeded: false,
      message: '',
      data: null,
    );
  }




}

/// provides the CreateCustomerController
final createCustomerControllerProvider =
    StateNotifierProvider<CreateCustomerController, SignUpScreenState>((ref) {
  return CreateCustomerController(ref);
});
