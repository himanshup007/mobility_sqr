import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

CustomMenuTitle(String image,String text,String where,BuildContext context) {
  return
    ListTile(
      contentPadding:
      new EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
      leading: ImageIcon(
        AssetImage(image),
        color: AppConstants.APP_THEME_COLOR,
      ),
      title: Text(text),
      onTap: () => {

      },
    );
}