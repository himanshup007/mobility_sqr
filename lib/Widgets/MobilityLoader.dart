import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:sizer/sizer.dart';
import 'package:loading_animations/loading_animations.dart';

showMobilityLoader(bool show){
  return show?Container(

    height: 100.0.h,
    width: 100.0.w,
    color: Colors.transparent,
    child: Center(
      child: LoadingBouncingGrid.circle(
        size: 50,
        backgroundColor: AppConstants.APP_THEME_COLOR,
      ),
    ),
  ):SizedBox();
}