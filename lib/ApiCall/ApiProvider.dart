import 'dart:convert';
import 'package:mobility_sqr/LocalStorage/TokenGetter.dart';
import 'package:mobility_sqr/ModelClasses/CheckUser.dart';
import 'package:http/http.dart' as http;
import 'package:mobility_sqr/ModelClasses/ForgetPassModel.dart';
import 'package:mobility_sqr/ModelClasses/GetTravelRequest.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/ModelClasses/UserToken.dart';

import '../Constants/AppConstants.dart';

class ApiProvider {
  final _TokenGetter=TokenGetter();
  Future<bool> CheckUserdata(String username) async {
    Map<String, String> queryParams = {
      'user_name': username,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL+AppConstants.CHECK_USER+"?"+queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

    );

    if (response.statusCode == 200) {
      CheckUser data= CheckUser.fromJson(jsonDecode(response.body));

      if(data.isUser==0){
        return true;
      }
      else{
        return false;
      }

    } else {
      throw Exception('User Not Found');
    }
  }

  Future<UserToken> postRequest(String username, String password) async {
    Map data = {"username": username, "password": password};
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
        AppConstants.BASE_URL + AppConstants.ACCESS_TOKEN_FETCHER,
        headers: {"Content-Type": "application/json"},
        body: body);
    UserToken userToken = UserToken.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return userToken;
  }

  Future<UserInfo> getUserData(String username) async {
    Map data = {"email":username};
    //encode Map to JSON
    var body = json.encode(data);
    String token = await _TokenGetter.getAcessToken() ?? "";
    var response = await http.post(
        AppConstants.BASE_URL + AppConstants.GET_USER_INFO,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
        body: body,
    );
    UserInfo userToken = UserInfo.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return userToken;
  }


  Future<ForgetPassModel> resetPass(String email) async{
    Map data = {"email": email};
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
      AppConstants.BASE_URL + AppConstants.FORGET_PASS,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: body,
    );
    ForgetPassModel passModel = ForgetPassModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return passModel;
  }


  Future<GetTravelRequest> getTravelRequest() async{


    UserInfo userInfo=await _TokenGetter.readUserInfo() ?? null;


    String travelreq="2";String OrgId=userInfo.data.orgId;String empMail=userInfo.data.empCode;


    Map<String, String> queryParams = {
      'travel_req_status': "",
      'org_id':OrgId,
      'emp_email':empMail
    };
    String queryString = Uri(queryParameters: queryParams).query;


    String token = await _TokenGetter.getAcessToken() ?? "";
    var response = await http.get(
      AppConstants.BASE_URL + AppConstants.GET_TRAVEL_REQ+"?"+queryString,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },

    );
    GetTravelRequest listTravelReq = GetTravelRequest.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return listTravelReq;
  }



}
