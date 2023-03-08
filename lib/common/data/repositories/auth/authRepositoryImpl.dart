import 'dart:convert';

import 'package:cyberpay_mobile_2/common/data/models/api/login_request.dart';
import 'package:cyberpay_mobile_2/common/data/models/api/new_customer_wallet_request.dart';
import 'package:cyberpay_mobile_2/common/data/models/api/resend_otp_request.dart';
import 'package:cyberpay_mobile_2/common/data/models/api/verify_otp_request.dart';
import 'package:cyberpay_mobile_2/common/data/remote/network/network_provider.dart';
import 'package:cyberpay_mobile_2/common/data/repositories/auth/AuthRepository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../env/app_env.dart';
import '../../models/api/login_response.dart';


/// Implementation of Auth Endpoints
class AuthRepositoryImpl extends AuthRepository {

  /// Constructor for  AuthRepositoryImpl
  AuthRepositoryImpl(this.networkProvider);
  /// Network class for all method calls
  NetworkProvider networkProvider;


  @override
  Future<dynamic> createNewCustomer(NewCustomerWalletRequest request)  async {
    /// Call to network
    final response =await NetworkProvider.fromBaseUrl(CybAppEnvironment.cyberpayWebApiUrl).post(
      'CustomerWallet/newCustomer',body: request.toJson(),
    );

    return response;
  }

  @override
  Future<dynamic> verifyUserOtp(VerifyOtpRequest verifyOtpRequest)async {
    /// Call to network
    final response =await NetworkProvider.fromBaseUrl(CybAppEnvironment.cyberpayWebApiUrl).post(
      'CustomerWallet/otp',body: verifyOtpRequest.toJson(),
    );

    return response;
  }

  @override
  Future<dynamic> resendUserOtp(ResendOtpRequest resendOtpRequest)async {
    /// Call to network
    final response =await NetworkProvider.fromBaseUrl(CybAppEnvironment.cyberpayWebApiUrl).post(
      'CustomerWallet/resendOtp',body: resendOtpRequest.toJson(),
    );

    return response;
  }

  @override
  Future  login(LoginRequest loginRequest) async {
    /// Call to network
    final responseBody = await NetworkProvider.fromBaseUrl(CybAppEnvironment.cyberpayWebApiUrl).post(
      'ext/login',body: loginRequest.toMap(),
    );

    return responseBody;
  }



}



/// Provider for[AuthRepositoryImpl]
final authRepositoryImplProvider =Provider<AuthRepositoryImpl>((ref) {
  final api = NetworkProvider();

  return AuthRepositoryImpl(api);
});
