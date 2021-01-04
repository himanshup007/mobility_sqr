
import 'package:flutter/material.dart';

void showDefaultSnackbar(BuildContext context,String msg) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text('$msg'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    ),
  );
}
