import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

class CustomEventWidget extends StatefulWidget {
  String myvalue;
  String Hint;
  IconData icon;
  BuildContext context;
  VoidCallback onTap;

  CustomEventWidget(
      this.myvalue, this.Hint, this.icon, this.context, {this.onTap});

  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomEventWidget> {
  TextEditingController controller= TextEditingController();



  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    controller.text=widget.myvalue;
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 14,

        child: TextField(
         controller:controller,
          autofocus: false,
          style: TextStyle(fontSize: 18),
          enabled: false,
          decoration: InputDecoration(
              hintText: widget.Hint,
              contentPadding: EdgeInsets.only(top: 10,left: 0),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppConstants.APP_THEME_COLOR),
              ),
              suffixIcon: Icon(
                widget.icon,
                color: AppConstants.APP_THEME_COLOR,
              )),
        ),
      ),
    );
  }
}
