
//
// class GetUserDetailsCubit extends Cubit<GetUserDetailsState> {
//   GetUserDetailsCubit() : super(GetUserDetailsInitial());
//
//   getUserDetails (BuildContext context) async {
//     final stringHelper = StringHelper.of(context)!;
//
//     if(!await isNetworkAvailable()){
//       toastMessage(stringHelper.connectYourInternet);
//       emit(GetUserDetailsNetworkError());
//     }else{
//       emit(GetUserDetailsLoading());
//       RestClient.getUserDetails().then((value){
//         StorageHelper().setUserId(value.data?.sId??"");
//
//
//         if(value.data?.isLocationHave == true){
//           // StorageHelper().setIsFirstLaunch();
//
//           // StorageHelper().setUserLogInType(value.data?.socialType??"");
//           // StorageHelper().setUserEmail(value.data?.email??"");
//           // StorageHelper().setUserMobileNumber(value.data?.mobileNumber??"");
//           // StorageHelper().setUserName(value.data?.fullName??"");
//           // StorageHelper().setDefaultLocation(value.data?.location?.streetAddress??"");
//           // StorageHelper().setDefaultLocationZipCode(value.data?.location?.zipcode.toString()??"");
//           // StorageHelper().setDefaultLocationId(value.data?.location?.sId??"");
//           // StorageHelper().setCharityId(value.data?.charity?.sId??"");
//           // StorageHelper().setCharityName(value.data?.charity?.name??"");
//
//           if(value.data?.countryCode != null && value.data?.countryCode != ""){
//             // StorageHelper().setUserCountryCode(value.data?.countryCode??"");
//           }
//           emit(GetUserDetailsLoaded(value));
//
//         }else{
//           Navigator.pushNamedAndRemoveUntil(context, RouteName.conformationLocation, (route) => false);
//           emit(GetUserDetailsError());
//         }
//
//
//       }).onError((error, stackTrace){
//         emit(GetUserDetailsError());
//       });
//     }
//   }
//
//
// }
