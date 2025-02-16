//
// class UserLogInCubit extends Cubit<UserLogInState> {
//   UserLogInCubit() : super(UserLogInInitial());
//
//
//   userLogIn (BuildContext context, String email, String password, bool rememberMe) async {
//     final stringHelper = StringHelper.of(context)!;
//
//     if(!await isNetworkAvailable()){
//       toastMessage(stringHelper.connectYourInternet);
//     }else{
//       emit(UserLogInLoading());
//
//       String fcmToken = await PushNotification().getDeviceToken();
//
//       var params = json.encode(
//           {
//             "email" : email,
//             "password" : password,
//             "rememberMe" : rememberMe,
//             "role": "user",
//             "fcm_token": fcmToken
//           }
//       );
//
//
//       RestClient.userLogIn(params).then((value){
//
//
//         if(value.success == true){
//           StorageHelper().setUserBearerToken(value.data?.token??"");
//           StorageHelper().setUserId(value.data?.sId??"");
//
//           if(value.data?.isLocationHave == true){
//             Navigator.pushNamedAndRemoveUntil(context, RouteName.bottomBarTabs, (route) => false);
//           }else{
//             Navigator.pushNamedAndRemoveUntil(context, RouteName.conformationLocation, (route) => false);
//           }
//
//           emit(UserLogInLoaded());
//
//         }else{
//           toastMessage(stringHelper.somethingWentWrong);
//           emit(UserLogInError());
//         }
//
//
//       }).onError((error, stackTrace){
//         emit(UserLogInError());
//       });
//     }
//   }
// }
