//
//
// class VerifyOtpCubit extends Cubit<VerifyOtpState> {
//   VerifyOtpCubit() : super(VerifyOtpInitial());
//
//   verifyOtp (BuildContext context, Map userSignupData, int otp) async {
//     final stringHelper = StringHelper.of(context)!;
//
//     if(!await isNetworkAvailable()){
//       toastMessage(stringHelper.connectYourInternet);
//     }else{
//       emit(VerifyOtpLoading());
//
//       String fcmToken = await PushNotification().getDeviceToken();
//
//
//       var params = json.encode(
//           {
//             "email":userSignupData['email'],
//             "password": userSignupData['password'],
//             "mobileNumber": userSignupData['mobileNumber'],
//             "fullName": userSignupData['fullName'],
//             "role": userSignupData['role'],
//             "country_code": userSignupData['country_code'],
//             "otp":otp,
//             "fcm_token": fcmToken
//           }
//       );
//
//       RestClient.verifyOtp(params).then((value){
//
//         emit(VerifyOtpLoaded());
//
//         StorageHelper().setUserBearerToken(value.data?.token??"");
//         StorageHelper().setUserId(value.data?.sId??"");
//
//
//         Navigator.pushNamedAndRemoveUntil(context, RouteName.favoriteCharitiesScreen, (route) => false);
//
//
//        // Navigator.pushNamedAndRemoveUntil(context, RouteName.conformationLocation, (route) => false);
//
//       }).onError((error, stackTrace){
//         emit(VerifyOtpError());
//       });
//     }
//   }
// }
