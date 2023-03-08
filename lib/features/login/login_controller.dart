import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/data/local/shared_preference_service.dart';
import '../../common/data/local/storage_service_provider.dart';
import '../../common/data/models/api/login_request.dart';
import '../../common/data/models/api/login_response.dart';
import '../../common/data/models/local/local_user.dart';
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
  Future<bool> login(LoginRequest loginRequest) async {
    final repo = ref.read(authRepositoryImplProvider);
    final sharedPref = ref.read(sharedPreferencesServiceProvider);
    final localHive = ref.read(storageServiceProvider);
    try {
      state = state.copyWith(
        submitValue: const AsyncLoading(),
      );
      final response = await repo.login(loginRequest);
      final res = LoginResponse.fromMap(response.data);

      if (res.status== 1) {
        if(mounted){
          state = state.copyWith(status: true,
            submitValue:const  AsyncData(null),);
        }
        /// Convert to local user model
        final  userModel = LocalUser(
            cyberpayUserId: res.result?.userId??-1,
            firstName: res.result?.firstName??'',
            lastName: res.result?.lastName??'',
            authToken: res.result?.authToken??'',
            email: res.result?.email??'',
            userRole: res.result?.userType.toString()??'0',
            phoneNumber:res.result?.mobileNo??'',
            walletAmount: res.result?.walletAmount??0,
            phoneDialCode: res.result?.countryCode??'+234',
            walletId: res.result?.walletCode??'',
            isPhoneNumberVerified: res.result?.isRegister??false,
            businessCode: res.result?.businessCode??'',
             id: res.result?.userId.toString()??'-1',);

        /// save user
        localHive.saveLocalUser(userModel);
        sharedPref.saveUserIsLoggedIn(loggedInValue: true);

        return true;
      } else {
        if(mounted) {
          state = state.copyWith(
            status: false,
            submitValue: AsyncError(
              AppException(response.data ['message']), response.data ['message'],),
          );
        }

        return false;
      }
    } on DioError catch (err, stackTraceMsg) {
      if(mounted){
        state = state.copyWith(
          submitValue:
          AsyncError(AppException(handleApiError(err)), stackTraceMsg),
        );
      }

      return false;
    }
  }
}

/// provides LoginController
final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(ref),
);
