import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
void showAlert(BuildContext context, String msg) {


  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 200),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: Container(
            height: 300,
            width: 90.0.w,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: Constants.padding,
                      top: Constants.avatarRadius + Constants.padding,
                      right: Constants.padding,
                      bottom: Constants.padding),
                  margin: EdgeInsets.only(top: Constants.avatarRadius),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Constants.padding),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 10),
                            blurRadius: 10),
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              msg,
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: Constants.padding,
                  right: Constants.padding,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: Constants.avatarRadius,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Constants.avatarRadius)),
                        child: Image.asset("assets/images/warning.png")),
                  ),
                ),
              ],
            )),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position:Tween<Offset>(
          begin: const Offset(0.1, 0.0),
          end: const Offset(0.0, 0.0),
        ).animate(anim),

        child: child,
      );
    },
  );
}


class Constants{
  Constants._();
  static const double padding =20;
  static const double avatarRadius =45;
}

