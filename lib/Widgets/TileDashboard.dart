

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
TileDashboard(String images){

  return  Expanded(
    child: Container(
        height: 45.0.w,
        child: Image.asset(
          images,
          fit: BoxFit.contain,
        )),
  );
}