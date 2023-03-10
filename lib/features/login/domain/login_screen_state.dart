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

  ///
  LoginState({
    this.value = const AsyncValue.data(null),
    this.submitValue = const AsyncValue.data(null),
  });

  ///  LoginState copyWith
  LoginState copyWith({
    final AsyncValue<LoginResponse?>? value,
    AsyncValue<void>? submitValue,
  }) {
    return LoginState(
      value: value ?? this.value,
      submitValue: submitValue ?? this.submitValue,
    );
  }

  /// Hashcode
  @override
  int get hashCode {
    return submitValue.hashCode ^ value.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is LoginState &&
        other.value == value &&
        other.submitValue == submitValue;
  }

  /// To String
  @override
  String toString() {
    return 'LoginState(value: $value,submitValue:$submitValue)';
  }
}
