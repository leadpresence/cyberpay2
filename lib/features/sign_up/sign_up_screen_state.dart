import 'package:cyberpay_mobile_2/common/data/models/api/new_customer_wallet_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// SignUp Screen States
class SignUpScreenState {
  /// Account creation profile,setPin verifyOtp
 NewCustomerStage stage;

  /// NewCustomerWalletResponse response
  final AsyncValue<NewCustomerWalletResponse?> value;

  /// return if is loading
  bool get isLoading => value.isLoading;

  /// The verify otp value.
  final AsyncValue<void> verifyOtpValue;

  /// The submit value.
  final AsyncValue<void> submitValue;
  /// Resend otp
  final AsyncValue<void> resendOtpValue;

  /// otp verified
  bool otpVerified;

  /// terms
  bool agreedToTerms;

  /// Constructor  SignUpScreenState
  SignUpScreenState({
    this.stage = NewCustomerStage.profile,
    this.value = const AsyncValue.data(null),
    this.submitValue = const AsyncValue.data(null),
    this.resendOtpValue = const AsyncValue.data(null),
    this.verifyOtpValue = const AsyncValue.data(null),
    this.agreedToTerms = false,
    this.otpVerified = false,
  });

  /// Copy With

  SignUpScreenState copyWith({
    NewCustomerStage? stage,
    AsyncValue<NewCustomerWalletResponse?>? value,
    AsyncValue<void>? verifyOtpValue,
    AsyncValue<void>? submitValue,
    AsyncValue<void>? resendOtpValue,
    bool agreedToTerms =false,
    bool? otpVerified,
  }) {
    return SignUpScreenState(
      stage: stage ?? this.stage,
      value: value ?? this.value,
      otpVerified: otpVerified ?? this.otpVerified,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
      submitValue: submitValue ?? this.submitValue,
      resendOtpValue: resendOtpValue ?? this.resendOtpValue,
      verifyOtpValue: verifyOtpValue ?? this.verifyOtpValue,
    );
  }

  /// Hashcode
  @override
  int get hashCode {
    return stage.hashCode ^
        value.hashCode ^
        otpVerified.hashCode ^
        agreedToTerms.hashCode ^
        submitValue.hashCode ^
    resendOtpValue.hashCode ^
        verifyOtpValue.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SignUpScreenState &&
        other.stage == stage &&
        other.verifyOtpValue == verifyOtpValue &&
        other.submitValue == submitValue &&
        other.resendOtpValue == resendOtpValue &&
        other.otpVerified == agreedToTerms &&
        other.otpVerified == otpVerified;
  }

  /// To String
  @override
  String toString() {
    return 'SignUpScreenState(stage: $stage,verifyOtpValue:$verifyOtpValue, submitValue:$submitValue,submitValue:$submitValue, otpVerified: $otpVerified, agreedToTerms: $agreedToTerms)';
  }
}

/// Stages in NewCustomer Registration
enum NewCustomerStage {
  /// userProfile page
  profile,

  /// pin page
  setPin,

  /// verify otp page
  verifyOtp
}
