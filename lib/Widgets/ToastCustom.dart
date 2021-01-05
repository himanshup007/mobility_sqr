
import 'package:flutter/material.dart';

void showDefaultSnackbar(BuildContext context,String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 1),
      content: Text('$msg'),
      action: SnackBarAction(

        label: 'OK',
        onPressed: () {},
      ),
    ),
  );
}
