import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/data/models/api/login_request.dart';
import '../../common/data/models/api/login_response.dart';
import '../../common/data/repositories/auth/authRepositoryImpl.dart';
import '../../common/utils/app_exception.dart';
import '../../common/utils/error_handlers.dart';
import 'domain/login_screen_state.dart';

/// LoginController
class LoginController extends StateNotifier<LoginState> {
  /// Constructor LoginController
  LoginController(this.ref) : super(LoginState());

  /// An object used by providers to interact with other providers
  /// and the life-cycles of the application.
  Ref ref;

  /// Login user
  Future<LoginResponse?> login(LoginRequest loginRequest) async {
    final repo = ref.read(authRepositoryImplProvider);
    try {
      state = state.copyWith(submitValue: const AsyncLoading());
      final res = await repo.login(loginRequest);
      if (mounted) {
        state = state.copyWith(
          submitValue: const AsyncData(null),
        );
      }

      return res;
    } on DioError catch (err, stackTraceMsg) {
      state = state.copyWith(
        submitValue:
            AsyncError(AppException(handleApiError(err)), stackTraceMsg),
      );
    }

    /// used cos it returns same type of response
    return null;
  }


}
/// provides LoginController
final loginControllerProvider =
StateNotifierProvider<LoginController, LoginState>(
      (ref) => LoginController(ref),);
