import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// void showCustomDialogClass(BuildContext context, Widget mywidget) {
//   showGeneralDialog(
//     barrierLabel: "Barrier",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: Duration(milliseconds: 300),
//     context: context,
//     pageBuilder: (_, __, ___) {
//       return  Align(
//         alignment: Alignment.center,
//         child: Container(
//           decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(20)),),
//
//             width: 100.0.w,
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             height: 40.0.h,
//             child: mywidget),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       return SlideTransition(
//         position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
//         child: child,
//       );
//     },
//   );
// }

 showCustomDialogClass(BuildContext context, Widget mywidget) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {

        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: FittedBox(
            fit: BoxFit.fill,

            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 100.0.w,height: 55.0.h,
              child: mywidget
            ),
          ),
        );
      });
}
