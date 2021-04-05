import 'dart:convert';

import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/Activities.dart';
import 'package:mobility_sqr/ModelClasses/Credential.dart';
import 'package:mobility_sqr/ModelClasses/RelationList.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenGetter {
  saveValue(String accesstoken, String refreshtoken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.ACCESS_TOKEN, accesstoken);
    prefs.setString(AppConstants.REFRESH_TOKEN, refreshtoken);
  }

  getAcessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String acessToken = prefs.getString(AppConstants.ACCESS_TOKEN);
    return acessToken;
  }

  getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String refreshToken = prefs.getString(AppConstants.REFRESH_TOKEN);
    return refreshToken;
  }




  readUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    UserInfo user = UserInfo.fromJson( json.decode(prefs.getString(AppConstants.USER_INFO)));
    return user;
  }

  saveUserInfo(value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.USER_INFO, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(AppConstants.USER_INFO);
  }


  readDialCode() async {
    final prefs = await SharedPreferences.getInstance();
    List<String > DialCode =  (jsonDecode(prefs.getString(AppConstants.USER_DIAL_CODE)) as List<dynamic>).cast<String>();
    return DialCode;
  }

  saveDialCode(value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.USER_DIAL_CODE, json.encode(value));
  }

  readCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    Credential credential=null;
    try{
       credential = Credential.fromJson( json.decode(prefs.getString(AppConstants.CREDENTIAL)));
    }catch(e){
      print(e);
    }

    return credential;
  }

  saveCredentials(value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.CREDENTIAL, json.encode(value));
  }

  readActivites() async {
    final prefs = await SharedPreferences.getInstance();
    Activities activities = Activities.fromJson( json.decode(prefs.getString(AppConstants.ACTIVITIES)));
    return activities;
  }

  saveActivites(value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.ACTIVITIES, json.encode(value));
  }

  readRelationList() async {
    final prefs = await SharedPreferences.getInstance();
    RelationList _RelationList = RelationList.fromJson( json.decode(prefs.getString(AppConstants.RELATION)));
    return _RelationList;
  }

  saveRelationList(value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.RELATION, json.encode(value));
  }

}
