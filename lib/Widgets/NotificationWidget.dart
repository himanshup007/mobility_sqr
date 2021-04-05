import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

GetNotificationIcon( BuildContext context) {
  return
    GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/NotificationScreen');
      },
      child: Container(
        width: 40,
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),

        child: Align(
          alignment: Alignment.centerLeft,

          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: new Icon(
                    Icons.notifications, color: AppConstants.TEXT_BACKGROUND_COLOR,size: 25,),
                ),
              ),
              new Positioned(
                right: 0,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: new Text(
                    '1',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
}