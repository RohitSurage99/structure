
// class VerifyForgotPasswordCubit extends Cubit<VerifyForgotPasswordState> {
//   VerifyForgotPasswordCubit() : super(VerifyForgotPasswordInitial());
//
//
//   verifyOtp (BuildContext context, String email, int otp) async {
//     final stringHelper = StringHelper.of(context)!;
//
//     if(!await isNetworkAvailable()){
//       toastMessage(stringHelper.connectYourInternet);
//     }else{
//       emit(VerifyForgotPasswordLoading());
//
//       var params = json.encode(
//           {
//             "email":email,
//             "otp":otp
//           }
//       );
//
//       RestClient.verifyForgotPasswordOTP(params).then((value){
//
//         emit(VerifyForgotPasswordLoaded());
//
//         Navigator.popAndPushNamed(context, RouteName.resetPassword,
//         arguments: {
//           'userEmail' : email
//         });
//
//       }).onError((error, stackTrace){
//         emit(VerifyForgotPasswordError());
//       });
//     }
//   }
//
// }
