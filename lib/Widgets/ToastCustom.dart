
import 'package:flutter/material.dart';

void showDefaultSnackbar(BuildContext context,String msg) {
  Scaffold.of(context).showSnackBar(
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
void eventSnackbar( _keyScaffold,String msg){
  _keyScaffold.showSnackBar(
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