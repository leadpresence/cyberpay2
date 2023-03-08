import 'package:cyberpay_mobile_2/common/data/models/api/login_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class LoginState {
  /// AsyncValue of login response
  final AsyncValue<LoginResponse?> value;

  /// return if is loading
  bool get isLoading => value.isLoading;

  /// The submit value.
  final AsyncValue<void> submitValue;

  /// Status of response
  final bool status;

  ///
  LoginState({
    this.value = const AsyncValue.data(null),
    this.status = false,
    this.submitValue = const AsyncValue.data(null),
  });

  ///  LoginState copyWith
  LoginState copyWith({
    final AsyncValue<LoginResponse?>? value,
    AsyncValue<void>? submitValue,
    bool? status,
  }) {
    return LoginState(
      value: value ?? this.value,
      submitValue: submitValue ?? this.submitValue,
      status: status ?? this.status,
    );
  }

  /// Hashcode
  @override
  int get hashCode {
    return submitValue.hashCode ^ status.hashCode ^ value.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is LoginState &&
        other.value == value &&
        other.status == status &&
        other.submitValue == submitValue;
  }

  /// To String
  @override
  String toString() {
    return 'LoginState(value: $value,submitValue:$submitValue, status: $status)';
  }
}
