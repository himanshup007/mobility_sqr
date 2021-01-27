
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
showLoader(BuildContext context){
  WidgetsBinding.instance.addPostFrameCallback((_) {
  showDialog(
    context: context,
    barrierDismissible: false,

    builder: (BuildContext context) {
      return Container(
        height: 50,
        width: 50,
        color: Colors.transparent,
        child: Center(
          child: LoadingBouncingGrid.circle(
            size: 50,
            backgroundColor: Colors.white,
          ),
        ),
      );
    },
  );});
}

dismissLoader(BuildContext context){
  Navigator.of(context, rootNavigator: true).pop();

}