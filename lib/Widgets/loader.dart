import 'package:flutter/material.dart';

void onLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 50,
          width: 50,
          color: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}
void dismissloader(BuildContext context){
  Navigator.of(context,
      rootNavigator: true)
      .pop(context);
}
