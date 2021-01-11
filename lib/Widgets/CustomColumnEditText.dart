import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:sizer/sizer.dart';

class CustomColumnEditText extends StatefulWidget {
  VoidCallback onTap;
  String placename, countryname, hint;

  CustomColumnEditText(
      @required this.hint, @required this.placename, @required this.countryname,
      {this.onTap});

  @override
  _CustomColumnEditTextState createState() => _CustomColumnEditTextState();
}

class _CustomColumnEditTextState extends State<CustomColumnEditText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.0.w,
          child: Text(
            "From",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppConstants.TEXT_BACKGROUND_COLOR,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
            width: 100.0.w,
            child: TextFormField(
              initialValue: widget.placename,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(fontSize: 18),
              autofocus: false,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 16),
                hintText: 'Start location',
                suffixIcon: Icon(
                  Icons.search,
                  color: AppConstants.APP_THEME_COLOR,
                ),
                border: InputBorder.none,
              ),
              onTap: () {
                widget.onTap();
              },
            )),
        Container(
            width: 100.0.w,
            child: Text(
              widget.countryname,
              style: TextStyle(
                fontSize: 15,
                color: AppConstants.TEXT_BACKGROUND_COLOR,
              ),
              textAlign: TextAlign.start,
            )),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
