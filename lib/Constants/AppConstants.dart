import 'package:flutter/material.dart';

class AppConstants {
//==============================================================================URL
  // static final String BASE_URL = "http://52.165.220.40:8888";           //PreProd for client
 // static final String BASE_URL = "http://52.165.220.40:8080"; //Testing Url
 // static final String BASE_URL = "http://172.104.183.68:8080"; //Testing Url
  //static final String BASE_URL = "http://52.165.220.40:8000";       //Prod Url
  static final String BASE_URL = "http://mobilitysqr.net:8080";       //Prod Url


  static final String CHECK_USER = "/checkemployeeuser/";
  static final String ACCESS_TOKEN_FETCHER = "/api/custom/login/";
  static final String GET_USER_INFO = "/emoloyeeinfo/";
  static final String FORGET_PASS = "/forget_password/";
  static final String GET_TRAVEL_REQ = "/get_add/travel_request/";
  static final String GET_LOCATION_DATA = "/get_city/";
  static final String Token_GETTER = "/api/token/refresh/";
  static final String GET_PURPOSE = "/get_add/visa_purpose_list/";
  static final String DIAL_CODE = "/get_dial_code/";
  static final String GET_PROJECT = "/get_project/";       //250317
  static final String GET_POST_LOCATION = "/get_post_location/";
  static final String Get_DEPENDENTS = "/emoloyeedependent/";
  static final String GET_PER_DIEM = "/get_perdiem/";
  static final String GET_EMPLYOEE_VISA = "/get_employee_visa/";
  static final String POST_TRAVEL_REQ = "/get_add/travel_request/";
  static final String GET_APPROVAL_LIST = "/get_travel_request_approver/";
  static final String POST_REQUEST_FOR_APPROVAL =
      "/get_post_approve_travelvisa_request/";
  static final String ACTION_HISTORY_SUMMARY = "/get_travel_status_summary/";
  static final String GET_TRAVEL_REQ_VIEW = "/get_view_travel_request/";
  static final String GET_CURRENCY_ACTIVE = "/get_active_currency/";
  static final String GET_CURRENCY_CONVERSION = "/get_currency_conversion/";
  static final String GET_COUNTRY_LIST = "/get_country_master/";
  static final String GET_CITY_LIST = "/get_state_master/";
  static final String GET_ACTIVITIES = "/get_calender_activity/";
  static final String POST_CALENDER_EVENT = "/post_get_calender_event/";
  static final String UPDATE_CALENDER_EVENT = "/delete_update_calender_event/";
  static final String GET_EMPLOYEE_PASSPORT = "/getemployee_passport_info/";
  static final String GET_EMPLOYEE_VISA = "/getemployee_visa_info/";
  static final String GET_EMPLOYEE_NOTIFICATIONS = "/get_post_notification/";
  static final String GET_EMPLOYEE_PROFILE = "/getemployee_personal_info/";
  static final String UPDATE_EMPLOYEE_PROFILE = "/get_add/employee/";
  static final String POST_VAULT_DOCUMENT = "/get_post_vault_document/";
  static final String GET_EMERGENCY_CONTACT = "/getemployee_emergency_contact/";
  static final String CHANGE_PASS = "/reset_password/";
  static final String RELATION_LIST = "/get_post_relation/";




  //=======================================================================================/Colors
  static const Color DIVIDER_COLOR = Color(0xFFE9E9E9);
  static const Color PRIMARY_COLOR_LIGHT = Color(0xFFA5CFF1);
  static const Color PRIMARY_COLOR_DARK = Color(0xFF0D3656);
  static const Color APP_THEME_COLOR = Color(0xFF94488F);
  static const Color LABEL_COLOR = Color(0xFF353535);
  static const Color TEXT_BACKGROUND_COLOR = Color(0xFF50584F);
  static const Color BACKGROUND_COLOR_BOTTOM = Color(0xFFe4e4e4);

//=========================================================================================Strings

  static const String ACCESS_TOKEN = "access_token";
  static const String REFRESH_TOKEN = "refresh_token";
  static const String USER_INFO = "User_Info";
  static const String USER_DIAL_CODE = "Dial_code";
  static const String CREDENTIAL = "credentials";
  static const String ACTIVITIES = "activities";
  static const String RELATION = "relation";
}
