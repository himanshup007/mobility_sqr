import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

class DashboardCustomEditField extends StatelessWidget {
   VoidCallback onTap;
   String hint = '';
  bool showIcon=false;
  IconData icon;

  DashboardCustomEditField(
      @required String hint, @required bool showIcon, IconData icon,
      {this.onTap}){

    this.hint=hint;
    this.showIcon=showIcon;
    this.icon=icon;

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppConstants.APP_THEME_COLOR),
            ),
            border: new UnderlineInputBorder(
                borderSide: new BorderSide(color: Colors.black12)),
            hintText: hint,
            hintStyle: TextStyle(
              fontWeight: FontWeight.normal,
              color: AppConstants.TEXT_BACKGROUND_COLOR,
            ),
            focusColor: AppConstants.APP_THEME_COLOR,
            suffixIcon: showIcon
                ? Icon(
                    icon,
                    color: AppConstants.APP_THEME_COLOR,
                  )
                : null),
      ),
    );
  }
}
