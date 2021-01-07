
import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:sizer/sizer.dart';
TileDashboard(String images,String textLine1,String textLine2){

  return  Expanded(
    child: Stack(
      children: [
            Container(
            height: 45.0.w,
            child: Image.asset(
              images,
              fit: BoxFit.contain,
            ),
            ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(textLine1,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppConstants.TEXT_BACKGROUND_COLOR),),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(textLine2,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppConstants.TEXT_BACKGROUND_COLOR),),
          ),
        )
          ],
    ),
  );
}