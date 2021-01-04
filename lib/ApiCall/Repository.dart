import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/ModelClasses/CheckUser.dart';



class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<bool> fetch_user_status(String username) => appApiProvider.CheckUserdata(username);
}