import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/Dashboard/Dashboard.dart';
import 'package:sizer/sizer.dart';

class TileDashboard extends StatelessWidget {
  final Function(int) onTap;
  final Model model;

  TileDashboard(@required this.model, {this.onTap}) : assert(model != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(model.where);
      },
      child: Container(
        height: 48.0.w,
        width: 48.0.w,
        margin: EdgeInsets.only(top: 10),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 48.0.w,
              child: Image.asset(
                model.image,
                fit: BoxFit.contain,
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  model.first_text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.TEXT_BACKGROUND_COLOR,
                  ),
                  textAlign: TextAlign.start,
                )),
            Container(
                margin: EdgeInsets.only(top: 60, left: 10),
                child: Text(
                  model.second_text,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.TEXT_BACKGROUND_COLOR),
                  textAlign: TextAlign.start,
                ))
          ],
        ),
      ),
    );
  }
}
