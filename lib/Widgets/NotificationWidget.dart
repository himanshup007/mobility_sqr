import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

GetNotificationIcon() {
  return
    Container(
      margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Align(
        alignment: Alignment.centerLeft,

        child: Stack(
          children: <Widget>[
            new Icon(
              Icons.notifications, color: AppConstants.TEXT_BACKGROUND_COLOR,),
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
    );
}