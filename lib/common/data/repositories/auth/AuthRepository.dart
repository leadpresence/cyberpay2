
import 'dart:io';

import 'package:cyberpay_mobile_2/common/data/models/api/login_request.dart';
import 'package:cyberpay_mobile_2/common/data/models/api/new_customer_wallet_request.dart';
import 'package:cyberpay_mobile_2/common/data/models/api/resend_otp_request.dart';
import '../../models/api/login_response.dart';
import '../../models/api/new_customer_wallet_response.dart';
import '../../models/api/verify_otp_request.dart';

/// Abstract class for  Auth endpoints
abstract class AuthRepository{

  /// Future method createNewCustomer()
  Future<dynamic> createNewCustomer(NewCustomerWalletRequest request);

  /// Future method verifyUserOtp()
  Future<dynamic> verifyUserOtp(VerifyOtpRequest verifyOtpRequest);

  /// Future method resendUserOtp()
  Future<dynamic> resendUserOtp(ResendOtpRequest resendOtpRequest);

  /// Future method resendUserOtp()
  Future login(LoginRequest loginRequest);




}