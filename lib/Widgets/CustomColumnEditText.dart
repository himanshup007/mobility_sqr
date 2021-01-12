import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:sizer/sizer.dart';

class CustomColumnEditText extends StatefulWidget {
  VoidCallback onTap;
  String placename, countryname, hint, header;
  int Type;

  CustomColumnEditText(@required this.hint, @required this.placename,
      @required this.countryname, @required this.header,@required this.Type,
      {this.onTap});

  @override
  _CustomColumnEditTextState createState() => _CustomColumnEditTextState();
}





class _CustomColumnEditTextState extends State<CustomColumnEditText> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Column(
        children: [
          Container(
            width: 100.0.w,
            child: Text(
              widget.header,
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
              height: 5.0.h,
              child: widget.placename == ''
                  ? TextFormField(
                      initialValue: widget.placename,
                      enabled: false,
                      textAlignVertical: TextAlignVertical.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      autofocus: false,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 12),
                        hintText: widget.hint,
                        suffixIcon: widget.Type==1?Icon(
                          Icons.search,
                          color: AppConstants.APP_THEME_COLOR,
                        ):Icon(Icons.calendar_today,color: AppConstants.APP_THEME_COLOR,),
                        border: widget.placename == ''
                            ? OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppConstants.TEXT_BACKGROUND_COLOR))
                            : InputBorder.none,
                      ),
                      onTap: () {
                        widget.onTap();
                      },
                    )
                  : Container(
                      width: 100.0.w,
                      height: 5.0.h,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.placename,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold ),

                            ),
                            widget.Type==1?Icon(Icons.search,color: AppConstants.APP_THEME_COLOR,):Icon(Icons.calendar_today,color: AppConstants.APP_THEME_COLOR,),
                          ],
                        ),
                      ),
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
      ),
    );
  }
}