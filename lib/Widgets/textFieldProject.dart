import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:sizer/sizer.dart';

DashboardEditFieldHeader(@required String header,Color color) {
  return
    Text(
      "$header",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: 16),
    );


}

