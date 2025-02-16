// import 'dart:convert';
// import 'api_constant.dart';
// import 'http_helper.dart';
//
// class RestClient {
//   static final RestClient getInstance = RestClient._internal();
//   RestClient._internal();
//
//   factory RestClient() {
//     return getInstance;
//   }
//
//   static final HttpHelper _httpHelper = HttpHelper();
//
//
//
//   static Future<Map<String, dynamic>> userSignUp(String reqBody) async {
//     var result = await _httpHelper.post(url: ApiConstant.signUp, body: reqBody);
//     // return UserSignUpModel.fromJson(result);
//     return result;
//   }
//   //
//   // static Future<VerifyOTPModelModel> verifyOtp(String reqBody) async {
//   //   var result = await _httpHelper.post(url: ApiConstant.verifyOTP, body: reqBody);
//   //   return VerifyOTPModelModel.fromJson(result);
//   // }
//   //
//   // static Future<ResendOtpModel> resendOtp(String reqBody) async {
//   //   var result = await _httpHelper.post(url: ApiConstant.resendOTP, body: reqBody);
//   //   return ResendOtpModel.fromJson(result);
//   // }
//   //
//   // static Future<UserLogInModel> userLogIn(String reqBody) async {
//   //   var result =await _httpHelper.post(url: ApiConstant.logIn, body: reqBody);
//   //   return UserLogInModel.fromJson(result);
//   // }
//   //
//   // static Future<ForgotPasswordModel> forgotPassword(String reqBody) async {
//   //   var result = await _httpHelper.post(url: ApiConstant.forgotPassword, body: reqBody);
//   //   return ForgotPasswordModel.fromJson(result);
//   // }
//   //
//   // static Future<ForgotPasswordResendOTPModel> forgotPasswordResendOTP(String reqBody) async {
//   //   var result = await _httpHelper.post(url: ApiConstant.resendForgotPasswordOTP, body: reqBody);
//   //   return ForgotPasswordResendOTPModel.fromJson(result);
//   // }
//   //
//   // static Future<VerifyForgotPasswordOTPModel> verifyForgotPasswordOTP(String reqBody) async {
//   //   var result = await _httpHelper.post(url: ApiConstant.verifyForgotPassword, body: reqBody);
//   //   return VerifyForgotPasswordOTPModel.fromJson(result);
//   // }
//   //
//   // static Future<GetUserDetailsModel> getUserDetails() async {
//   //   var result = await _httpHelper.get(url: ApiConstant.userDetails, isRequireAuthorization: true);
//   //   return GetUserDetailsModel.fromJson(result);
//   // }
//   //
//   //
//   // static Future<MyOrdersModel> activeOrders(int page) async {
//   //   var result = await _httpHelper.get(url:"${ApiConstant.myOrders}${"status=active&page=$page&limit=10"}", isRequireAuthorization: true);
//   //   return MyOrdersModel.fromJson(result);
//   // }
//
//
//
// }
//
// class UserSignUpModel {}