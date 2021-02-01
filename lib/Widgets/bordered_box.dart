import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

customBorderBox(String text, bool ShowIcon, IconData icon,
    {VoidCallback ontouch}) {
  return GestureDetector(
    onTap: (){
      ontouch();
    },
    child: Container(
        height: 30,
         width: 50,
        margin: EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
            color:AppConstants.APP_THEME_COLOR,
            boxShadow: [
          BoxShadow(
            color: Colors
                .grey,
            blurRadius:
            10.0,
          ),
        ],border: Border.all(color: AppConstants.APP_THEME_COLOR),borderRadius: BorderRadius.all(Radius.circular(5))),
        child: FittedBox(
          fit: BoxFit.none,
          child: Row(
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 15),
              ),
              ShowIcon?Icon(icon,color: AppConstants.APP_THEME_COLOR,size: 20,):SizedBox()
            ],
          ),
        )),
  );
}
