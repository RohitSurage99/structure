// import 'dart:convert';
// import 'package:bloc/bloc.dart';
// import 'package:dealshaq/network_manager/rest_client.dart';
// import 'package:dealshaq/utils/toast_message.dart';
// import 'package:meta/meta.dart';
// import '../../app_language/string_helper.dart';
// import '../../helpers/storage_helper.dart';
// import '../../utils/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../routes/routes_name.dart';
// part 'user_signup_state.dart';
//
// class UserSignupCubit extends Cubit<UserSignupState> {
//   UserSignupCubit() : super(UserSignupInitial());
//
//
//   userSignUp (BuildContext context,
//       String fullName ,
//       String email,
//       String password,
//       String mobileNumber) async {
//     final stringHelper = StringHelper.of(context)!;
//
//     if(!await isNetworkAvailable()){
//       toastMessage(stringHelper.connectYourInternet);
//     }else{
//
//       emit(UserSignupLoading());
//
//       String phone = mobileNumber.replaceAll('-', '');
//
//       var params = json.encode(
//           {
//             "fullName" : fullName,
//             "email": email,
//             "role": "user",
//             "password": password,
//             "mobileNumber": phone,
//             "country_code": "+1"
//           }
//       );
//
//       RestClient.userSignUp(params).then((value){
//
//         emit(UserSignupLoaded());
//
//         if(value.success == true){
//
//
//           Map userSignupData = {
//             "fullName" : fullName,
//             "email": email,
//             "role": "user",
//             "password": password,
//             "mobileNumber": phone,
//             "country_code": "+1"
//           };
//
//           StorageHelper().setUserEmail(value.data?.email??"");
//           StorageHelper().setUserMobileNumber(value.data?.mobileNumber??"");
//           Navigator.pushNamed(context, RouteName.verificationCode,
//               arguments: {
//                 'userSignupData': userSignupData,
//               });
//         }else{
//           toastMessage(stringHelper.somethingWentWrong);
//         }
//
//       }).onError((error, stackTrace){
//         emit(UserSignupError());
//       });
//     }
//   }
// }
