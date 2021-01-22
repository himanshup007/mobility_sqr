import 'package:flutter/material.dart';

class AppConstants {
//==============================================================================URL
  static final String BASE_URL = "http://52.165.220.40:8888";
  static final String CHECK_USER = "/checkemployeeuser/";
  static final String ACCESS_TOKEN_FETCHER = "/api/login/";
  static final String GET_USER_INFO = "/emoloyeeinfo/";
  static final String FORGET_PASS="/forget_password/";
  static final String GET_TRAVEL_REQ="/get_add/travel_request/";
  static final String GET_LOCATION_DATA="/get_city/";
  static final String Token_GETTER="/api/token/refresh/";
  static final String GET_PURPOSE="/get_add/visa_purpose_list/";
  static final String DIAL_CODE="/get_dial_code/";
  static final String GET_PROJECT="/get_project/";
  static final String GET_POST_LOCATION="/get_post_location/";
  static final String Get_DEPENDENTS="/emoloyeedependent/";
  static final String GET_PER_DIEM="/get_perdiem/";
  static final String GET_EMPLYOEE_VISA="/get_employee_visa/";
  static final String POST_TRAVEL_REQ="/get_add/travel_request/";





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






}
