import '../Helper/env_helper.dart';

class ApiConstant {
  ApiConstant._();
  static final ApiConstant apiConstant = ApiConstant._();

  factory ApiConstant (){
    return apiConstant;
  }


  // static String apiBaseUrl = '${EnvHelper.baseUrl}/api';
  static String apiBaseUrl = 'api';


  /// API Urls
  static String signUp = '$apiBaseUrl/users/signup';
  static String logIn = '$apiBaseUrl/users/login';
  static String verifyOTP = '$apiBaseUrl/verification/verify-otp';
  static String resendOTP = '$apiBaseUrl/verification/resend-otp';
  static String forgotPassword = '$apiBaseUrl/users/forget-password';
  static String verifyForgotPassword = '$apiBaseUrl/users/verify-forget-pass';
  static String resendForgotPasswordOTP = '$apiBaseUrl/users/forgot-resend-otp';

}