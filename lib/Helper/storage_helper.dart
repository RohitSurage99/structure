import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class StorageHelper {
  StorageHelper._();
  static final StorageHelper storageHelper = StorageHelper._();

  factory StorageHelper (){
    return storageHelper;
  }

  late SharedPreferences _pref;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<void> clear({String? routeName}) async{
    _pref.clear();
    // Navigator.pushNamedAndRemoveUntil(navigatorKey.currentContext!, routeName??RouteName.logIn, (route) => false);
    debugPrint("LOGOUT ISSUE: clearing local pref");
  }


  void setIsFirstLaunch(){_pref.setBool("app_launching_first_time", false);}
  bool getIsFirstLaunch(){return _pref.getBool('app_launching_first_time')??true;}

  void setUserName(String userName) {_pref.setString('user_name', userName);}
  String getUserName() {return _pref.getString('user_name')??"";}

  void setUserBearerToken(String token) {_pref.setString('user_token', token);}
  String getUserBearerToken()  {return _pref.getString('user_token')??"";}

  void setUserId(String userId) {_pref.setString('user_id', userId);}
  String getUserId()  {return _pref.getString('user_id')??"";}

  void setUserEmail(String email) {_pref.setString('user_email', email);}
  String getUserEmail() {return _pref.getString('user_email')??"";}


}