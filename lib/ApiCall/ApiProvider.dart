import 'dart:convert';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/ActionHistoryModel.dart';
import 'package:mobility_sqr/ModelClasses/Activities.dart';
import 'package:mobility_sqr/ModelClasses/Approval.dart';

import 'package:mobility_sqr/ModelClasses/CalenderResponseModel.dart';
import 'package:mobility_sqr/ModelClasses/CheckUser.dart';
import 'package:http/http.dart' as http;
import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';
import 'package:mobility_sqr/ModelClasses/CurrencyConversionModel.dart';
import 'package:mobility_sqr/ModelClasses/CurrencyResultModel.dart';
import 'package:mobility_sqr/ModelClasses/DependentModel.dart';
import 'package:mobility_sqr/ModelClasses/DialCodeModel.dart';
import 'package:mobility_sqr/ModelClasses/DocumentModelClass.dart';
import 'package:mobility_sqr/ModelClasses/EmergencyContactModel.dart';
import 'package:mobility_sqr/ModelClasses/ForgetPassModel.dart';
import 'package:mobility_sqr/ModelClasses/GetTravelRequest.dart';
import 'package:mobility_sqr/ModelClasses/GetVisaModelClass.dart';
import 'package:mobility_sqr/ModelClasses/Get_Post_Location.dart';
import 'package:mobility_sqr/ModelClasses/NotificationModel.dart';
import 'package:mobility_sqr/ModelClasses/PassportModel.dart';
import 'package:mobility_sqr/ModelClasses/PerDiemModelClass.dart';
import 'package:mobility_sqr/ModelClasses/PostDocModel.dart';
import 'package:mobility_sqr/ModelClasses/ProjectIdModel.dart';
import 'package:mobility_sqr/ModelClasses/PurposeModelClass.dart';
import 'package:mobility_sqr/ModelClasses/SearchModelClass.dart';
import 'package:mobility_sqr/ModelClasses/SubmitRequestFResponse.dart';
import 'package:mobility_sqr/ModelClasses/SubmitRequestForApprovalModel.dart';
import 'package:mobility_sqr/ModelClasses/TravelReqResponse.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/ModelClasses/UserInfoPayload.dart';
import 'package:mobility_sqr/ModelClasses/UserProfileModel.dart';
import 'package:mobility_sqr/ModelClasses/UserToken.dart';
import 'package:mobility_sqr/ModelClasses/VisaModel.dart';
import 'package:mobility_sqr/ModelClasses/eventPost.dart';

import '../Constants/AppConstants.dart';

class ApiProvider {
  final _TokenGetter = TokenGetter();

  Future<bool> CheckUserdata(String username) async {
    Map<String, String> queryParams = {
      'user_name': username,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.CHECK_USER + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      CheckUser data = CheckUser.fromJson(jsonDecode(response.body));

      if (data.isUser == 0) {
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('User Not Found');
    }
  }

//==================================================================================================
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

  //================================================================================================
  Future<UserInfo> getUserData(String username, String token) async {
    Map data = {"email": username.trim()};
    //encode Map to JSON
    var body = json.encode(data);
    // String token = await _TokenGetter.getAcessToken() ?? "";
    // String token = await getToken_byReresh();
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

//=====================================================================================================
  Future<ForgetPassModel> resetPass(String email) async {
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
    ForgetPassModel passModel =
        ForgetPassModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return passModel;
  }

//=======================================================================================================
  Future<ApprovalModal> getTravelRequest() async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    getDialCode();

    String travelreq = "2";
    String OrgId = userInfo.data.orgId;
    String empMail = userInfo.data.empCode;

    Map<String, String> queryParams = {
      'travel_req_status': "",
      'org_id': OrgId,
      'emp_email': empMail
    };
    String queryString = Uri(queryParameters: queryParams).query;

    //   String token = await _TokenGetter.getAcessToken() ?? "";
    String token = await getToken_byReresh();
    var response = await http.get(
      AppConstants.BASE_URL + AppConstants.GET_TRAVEL_REQ + "?" + queryString,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    ApprovalModal listTravelReq =
        ApprovalModal.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return listTravelReq;
  }

//========================================================================================================
  Future<SearchModel> getLocation(String locationName) async {
    String token = await getToken_byReresh();

    Map<String, String> queryParams = {
      'city': locationName,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_LOCATION_DATA + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      SearchModel data = SearchModel.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('User Not Found');
    }
  }

//===========================================================================================================
  getToken_byReresh() async {
    String refresh_token = await _TokenGetter.getRefreshToken() ?? "";

    Map data = {"refresh": refresh_token};
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
        AppConstants.BASE_URL + AppConstants.Token_GETTER,
        headers: {"Content-Type": "application/json"},
        body: body);
    Map<String, dynamic> userToken = jsonDecode(response.body);
    String token = userToken["access"];
    print("${token}");
    _TokenGetter.saveValue(token, refresh_token);
    print("${response.statusCode}");
    print("${response.body}");

    return token;
  }

//======================================================================================================
  Future<PurposeModelClass> getPurposeList(String iata) async {
    String token = await getToken_byReresh();

    Map<String, String> queryParams = {
      'country_id': iata,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_PURPOSE + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      PurposeModelClass data =
          PurposeModelClass.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('User Not Found');
    }
  }

//=============================================================================================================
  Future<DialCode> getDialCode() async {
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.DIAL_CODE + "?dial_code="}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      DialCode data = DialCode.fromJson(jsonDecode(response.body));
      List<String> dialString = new List<String>();
      for (int i = 0; i < data.data.length; i++) {
        dialString.add(data.data[i].code);
      }
      _TokenGetter.saveDialCode(dialString);
    } else {
      throw Exception('User Not Found');
    }
  }

//========================================================================================================================
  Future<ProjectIdModel> GetProjectId(String pid) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    Map<String, String> queryParams = {
      'pid': pid,
      'limit': '15',
      'org_id': userInfo.data.orgId
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_PROJECT + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      ProjectIdModel data = ProjectIdModel.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('User Not Found');
    }
  }

//========================================================================================================================
  Future<PostLocationResponse> GetPostLocation(String country) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    Map<String, String> queryParams = {
      'country': country,
      'org_id': userInfo.data.orgId
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_POST_LOCATION + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      PostLocationResponse data =
          PostLocationResponse.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<List<SecondDependentData>> GetDependentList(String country) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    Map<String, String> queryParams = {
      'country': country,
      'employee': userInfo.data.empCode
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.Get_DEPENDENTS + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      DependentModel myresponse =
          DependentModel.fromJson(jsonDecode(response.body));

      return myresponse.data;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<PerDiemModel> GetPerDiem(String country) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    Map<String, String> queryParams = {
      'country': country,
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_PER_DIEM + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      PerDiemModelClass myresponse =
          PerDiemModelClass.fromJson(jsonDecode(response.body));

      return myresponse.data[0];
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<GetVisaModel> GetTravelVisa(
      String visaType, String visaCountryId) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    Map<String, String> queryParams = {
      "emp_code_id": userInfo.data.empCode,
      "visa_country_id": visaCountryId,
      "visa_type": visaType
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_EMPLYOEE_VISA + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      GetVisaModel myresponse =
          GetVisaModel.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<TravelReqResponseModel> PostTravelRequest(var data) async {
    //encode Map to JSON

    String token = await getToken_byReresh();
    var response =
        await http.post(AppConstants.BASE_URL + AppConstants.POST_TRAVEL_REQ,
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer ${token}',
            },
            body: data);
    if (response.statusCode == 200) {
      TravelReqResponseModel travelReqResponse =
          TravelReqResponseModel.fromJson(jsonDecode(response.body));

      return travelReqResponse;
    } else {
      if (response.statusCode == 500) {
        print("errr");
      } else {}
    }
  }

//========================================================================================================================
  Future<ApprovalModal> fetch_approval_list() async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    Map<String, String> queryParams = {
      "emp_email": userInfo.data.empCode,
      "travel_req_status": "2",
      "type": "Travel",
      "org_id": userInfo.data.orgId
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_APPROVAL_LIST + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      ApprovalModal myresponse =
          ApprovalModal.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<SubmitRequestFResponse> Post_Travel_Req_For_Approval(
      SubmitRequestForApprovalModel model) async {
    //encode Map to JSON
    var body = json.encode(model.toJson());
    print(body);
    String token = await getToken_byReresh();
    var response = await http.post(
      AppConstants.BASE_URL + AppConstants.POST_REQUEST_FOR_APPROVAL,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: body,
    );
    print("${response.statusCode}");
    print("${response.body}");

    if (response.statusCode == 200) {
      SubmitRequestFResponse myresponse =
          SubmitRequestFResponse.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================

  Future<ActionHistoryModel> get_travel_status_summary(
      String travelreqId) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    Map<String, String> queryParams = {
      "travel_req_id": travelreqId,
      "org_id": userInfo.data.orgId
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.ACTION_HISTORY_SUMMARY + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      ActionHistoryModel myresponse =
          ActionHistoryModel.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<GetTravelRequest> fetchViewTravelReq(String TravelReqId) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    Map<String, String> queryParams = {
      "travel_req_id": TravelReqId,
      "org_id": userInfo.data.orgId
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_TRAVEL_REQ_VIEW + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      GetTravelRequest myresponse =
          GetTravelRequest.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

//========================================================================================================================
  Future<CurrencyConversionModel> get_currency_active() async {
    Map<String, String> queryParams = {
      "status_type": "Active",
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_CURRENCY_ACTIVE + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      CurrencyConversionModel myresponse =
          CurrencyConversionModel.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

  //========================================================================================================================
  Future<CurrencyResultModel> get_currency_conversion(
      String from_currency, String to_currency) async {
    Map<String, String> queryParams = {
      "from_currency": from_currency,
      "to_currency": to_currency
    };
    String token = await getToken_byReresh();
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_CURRENCY_CONVERSION + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      CurrencyResultModel myresponse =
          CurrencyResultModel.fromJson(jsonDecode(response.body));

      return myresponse;
    } else {
      throw Exception('error');
    }
  }

  //=============================================================================================
  Future<CountryListModel> getCountrylist({String countryId}) async {
    String token = await getToken_byReresh();

    Map<String, String> queryParams = {
      'country': countryId,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_COUNTRY_LIST + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      CountryListModel data =
          CountryListModel.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('Server Error');
    }
  }

//=======================================================================================================
  Future<CountryListModel> getCitylist({String countryId}) async {
    String token = await getToken_byReresh();

    Map<String, String> queryParams = {
      'country_id': countryId,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_CITY_LIST + "?" + queryString}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      CountryListModel data =
          CountryListModel.fromJson(jsonDecode(response.body));

      return data;
    } else {
      throw Exception('Server Error');
    }
  }

//===============================================================================================================

  Future<Activities> getActivities() async {
    String token = await getToken_byReresh();
    final http.Response response = await http.get(
      '${AppConstants.BASE_URL + AppConstants.GET_ACTIVITIES}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );

    if (response.statusCode == 200) {
      Activities data = Activities.fromJson(jsonDecode(response.body));
      return data;
    } else {
      throw Exception('Server Error');
    }
  }

  //==================================================================================================================
  Future<CalenderEventResponseModel> post_Calender_Event(
      eventPost jsonModel) async {
    //encode Map to JSON
    String token = await getToken_byReresh();
    var body = json.encode(jsonModel.toJson());
    var response = await http.post(
        AppConstants.BASE_URL + AppConstants.POST_CALENDER_EVENT,
        headers: {"Content-Type": "application/json", 'Authorization': 'Bearer ${token}',},
        body: body);
    CalenderEventResponseModel calenderEventResponseModel =
        CalenderEventResponseModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return calenderEventResponseModel;
  }

//====================================================================================================================
  Future<CalenderEventResponseModel> get_Calender_Event(
      {String empCode}) async {
    Map<String, String> queryParams = {"emp_code": empCode};
    String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      AppConstants.BASE_URL +
          AppConstants.POST_CALENDER_EVENT +
          "?" +
          queryString,
      headers: {"Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',},
    );
    CalenderEventResponseModel calenderEventResponseModel =
        CalenderEventResponseModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return calenderEventResponseModel;
  }

  //==================================================================================================================
  Future<CalenderEventResponseModel> update_Calendar_Event(
      eventPost jsonModel, int id) async {
    //encode Map to JSON
    var body = json.encode(jsonModel.toJson());
    String token = await getToken_byReresh();
    var response = await http.patch(
        AppConstants.BASE_URL +
            AppConstants.UPDATE_CALENDER_EVENT +
            id.toString() +
            "/",
        headers: {"Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',},
        body: body);
    CalenderEventResponseModel calenderEventResponseModel =
        CalenderEventResponseModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return calenderEventResponseModel;
  }

  //======================================================================================================================

  Future<PassportModel> get_employee_passport({String empCode}) async {
    Map<String, String> queryParams = {"employee": empCode};
    String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      AppConstants.BASE_URL +
          AppConstants.GET_EMPLOYEE_PASSPORT +
          "?" +
          queryString,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    PassportModel passportModel =
        PassportModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return passportModel;
  }

  //========================================================================================================================
  Future<VisaModel> get_employee_visa({String empCode}) async {
    Map<String, String> queryParams = {"employee": empCode};
    String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      AppConstants.BASE_URL +
          AppConstants.GET_EMPLOYEE_VISA +
          "?" +
          queryString,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    VisaModel visaModel = VisaModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return visaModel;
  }

  //=================================================================================================================
  Future<NotificationModel> get_notifcations() async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;

    Map<String, String> queryParams = {
      "email": userInfo.data.empCode,
      "org_id": userInfo.data.orgId
    };
    String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      AppConstants.BASE_URL +
          AppConstants.GET_EMPLOYEE_NOTIFICATIONS +
          "?" +
          queryString,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    NotificationModel notificationModel = NotificationModel();
    if (response.statusCode == 200) {
      notificationModel = NotificationModel.fromJson(jsonDecode(response.body));
    } else {
      throw Error();
    }

    return notificationModel;
  }

//=============================================================================================
  Future<bool> delete_notification({notiId}) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;

    Map data = {"email": userInfo.data.empCode, "id": notiId};
    //encode Map to JSON
    var body = json.encode(data);

    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.post(
      AppConstants.BASE_URL + AppConstants.GET_EMPLOYEE_NOTIFICATIONS,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      body: body,
    );

    if (response.body != null && response.statusCode == 201) {
      print("true");
      return true;
    } else {
      print("false");
      return false;
    }
  }

  //===========================================================================================
  Future<UserProfileModel> get_user_profile() async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;

    Map<String, String> queryParams = {"employee": userInfo.data.empCode};
    String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      AppConstants.BASE_URL +
          AppConstants.GET_EMPLOYEE_PROFILE +
          "?" +
          queryString,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    UserProfileModel userProfileModel = UserProfileModel();
    if (response.statusCode == 200) {
      userProfileModel = UserProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Error();
    }

    return userProfileModel;
  }

  //=======================================================================================

  Future<UserInfo> update_Profile(UserInfoPayload jsonModel) async {
    //encode Map to JSON
    String token = await getToken_byReresh();
    var body = json.encode(jsonModel.toJson());
    var response = await http.post(
        AppConstants.BASE_URL + AppConstants.UPDATE_EMPLOYEE_PROFILE,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
          'Accept': 'application/json',
        },
        body: body);
    UserInfo updatedModel;
    if (response.statusCode != 500) {
      updatedModel = UserInfo.fromJson(jsonDecode(response.body));
    }
    return updatedModel;
  }


  //====================================================================================



  Future<DocumentModelClass> get_doc_vault(String type) async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;

    Map<String, String> queryParams = {"emp_code": userInfo.data.empCode,'vault_type':type};
    String queryString = Uri(queryParameters: queryParams).query;
    //encode Map to JSON
    String token = await getToken_byReresh();
    var response = await http.get(
      AppConstants.BASE_URL +
          AppConstants.POST_VAULT_DOCUMENT +
          "?" +
          queryString,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    DocumentModelClass documentModelClass = DocumentModelClass();
    if (response.statusCode == 200) {
      documentModelClass = DocumentModelClass.fromJson(jsonDecode(response.body));
    } else {
      throw Error();
    }

    return documentModelClass;
  }
//==========================================================================================================

  Future<EmergencyModel> getEmergencyContact() async {
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;
    String empMail = userInfo.data.empCode;

    Map<String, String> queryParams = {
      'employee': empMail
    };
    String queryString = Uri(queryParameters: queryParams).query;

    //   String token = await _TokenGetter.getAcessToken() ?? "";
    String token = await getToken_byReresh();
    var response = await http.get(
      AppConstants.BASE_URL + AppConstants.GET_EMERGENCY_CONTACT + "?" + queryString,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    EmergencyModel emergencyModel =
    EmergencyModel.fromJson(jsonDecode(response.body));
    print("${response.statusCode}");
    print("${response.body}");
    return emergencyModel;
  }

}
