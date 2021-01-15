import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
void showCustomDialogClass(BuildContext context, Widget mywidget) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 300),
    context: context,
    pageBuilder: (_, __, ___) {
      return  Align(
        alignment: Alignment.center,
        child: Container(
            width: 100.0.w,
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 70.0.h,
            child: mywidget),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}