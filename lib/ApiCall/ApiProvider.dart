
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:mobility_sqr/ModelClasses/CheckUser.dart';
import 'package:http/http.dart' as http;
import '../Constants/AppConstants.dart';
import '../Constants/AppConstants.dart';
import '../Constants/AppConstants.dart';
import '../Constants/AppConstants.dart';


class ApiProvider {



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






}