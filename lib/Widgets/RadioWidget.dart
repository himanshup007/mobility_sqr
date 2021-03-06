import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:sizer/sizer.dart';

class RadioBtn extends StatefulWidget {
  int id = 1;
  String radioButtonItem = 'Billable';
  String item1,item2;
   Function(bool) billable;



    RadioBtn(@required  this.item1,@required  this.item2,@required  this.id,@required  this.radioButtonItem, {this.billable});
  @override
  _RadioBtnState createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState(
    );

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 3.0.w,
          child: Transform.scale(
            scale: 1.4,
            child: Radio(
              activeColor: AppConstants.APP_THEME_COLOR,
              value: 1,
              groupValue: widget.id,
              onChanged: (val) {
                setState(() {
                  widget.radioButtonItem = widget.item1;
                  widget.id = 1;
                });
                widget.billable(true);

              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.radioButtonItem = widget.item1;
              widget.id = 1;
            });
            widget.billable(true);
          },
          child: Container(
            width: 25.0.w,
            margin: EdgeInsets.only(left: 5),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: AutoSizeText(widget.item1,
                  style: widget.id == 1
                      ? TextStyle(
                          fontSize: 16.0, color: AppConstants.APP_THEME_COLOR)
                      : TextStyle(
                          fontSize: 16.0,
                          color: AppConstants.TEXT_BACKGROUND_COLOR),
                minFontSize: 10,
                maxFontSize: 13,
              ),
            ),
          ),
        ),
        SizedBox(width: 1.0.w,),

        Container(
          width: 3.0.w,
          child: Transform.scale(
            scale: 1.4,
            child: Radio(
              activeColor: AppConstants.APP_THEME_COLOR,
              value: 2,
              groupValue: widget.id,
              onChanged: (val) {
                setState(() {
                  widget.radioButtonItem = widget.item2;
                  widget.id = 2;
                });
                widget.billable(false);
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.radioButtonItem = widget.item2;
              widget.id = 2;
            });
            widget.billable(false);
          },
          child: Container(
            width: 24.0.w,
 margin: EdgeInsets.only(left: 5),
            child: Container(
              padding: EdgeInsets.all(5),
              child: AutoSizeText(widget.item2,

                  style: widget.id == 2
                      ? TextStyle(
                           color: AppConstants.APP_THEME_COLOR)
                      : TextStyle(
                          color: AppConstants.TEXT_BACKGROUND_COLOR),
              minFontSize: 10,
                maxFontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
