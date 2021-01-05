import 'package:mobility_sqr/Constants/AppConstants.dart';
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
}
