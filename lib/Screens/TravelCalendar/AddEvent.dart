import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Event",
          style: TextStyle(color: AppConstants.TEXT_BACKGROUND_COLOR),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _buildWidget("From", Icons.calendar_today, context, onTap: () {}),
              _buildWidget('To', Icons.calendar_today, context, onTap: () {}),
              _buildWidget(
                  "Select Country", Icons.arrow_drop_down_sharp, context,
                  onTap: () {}),
              _buildWidget('Select State', Icons.arrow_drop_down_sharp, context,
                  onTap: () {}),
              _buildWidget("Select City", Icons.arrow_drop_down_sharp, context,
                  onTap: () {}),
              _buildWidget(
                  'Select Activities', Icons.arrow_drop_down_sharp, context,
                  onTap: () {}),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: AppConstants.APP_THEME_COLOR,

                    child: Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildWidget(String Hint, IconData icon, context, {VoidCallback onTap}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      height: MediaQuery.of(context).size.height / 12,
      child: TextField(
        autofocus: false,
        enabled: false,
        decoration: InputDecoration(
            hintText: Hint,
            contentPadding: EdgeInsets.only(top: 20),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppConstants.APP_THEME_COLOR),
            ),
            suffixIcon: Icon(
              icon,
              color: AppConstants.APP_THEME_COLOR,
            )),
      ),
    ),
  );
}
