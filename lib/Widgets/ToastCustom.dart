
import 'package:flutter/material.dart';

void showDefaultSnackbar(BuildContext context,String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$msg'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    ),
  );
}
