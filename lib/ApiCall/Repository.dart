import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/ModelClasses/ForgetPassModel.dart';
import 'package:mobility_sqr/ModelClasses/GetTravelRequest.dart';
import 'package:mobility_sqr/ModelClasses/PurposeModelClass.dart';
import 'package:mobility_sqr/ModelClasses/SearchModelClass.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/ModelClasses/UserToken.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<bool> fetch_user_status(String username) =>
      appApiProvider.CheckUserdata(username);

  Future<UserToken> fetch_user_token(String username, String password) => appApiProvider.postRequest(username, password);
  Future<UserInfo> fetch_user_info(String username) => appApiProvider.getUserData(username);
  Future<ForgetPassModel> send_resetEmail(String email) => appApiProvider.resetPass(email);


  Future<GetTravelRequest> fetch_travel_req() async {
    return await appApiProvider.getTravelRequest();
  }

  Future<SearchModel>  fetch_location(String locationName) async{
    return await appApiProvider.getLocation(locationName);
  }
  Future<PurposeModelClass> getPurposeList(String iatacode) async{
    return await appApiProvider.getPurposeList(iatacode);
  }
}
