import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool iseditable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white38,
        elevation: 0,
        title:
            Text("Personal Information", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              this.setState(() {
                iseditable = !iseditable;
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
              height: 23,
              width: 23,
              child: Image.asset(
                'assets/images/edit.png',
                fit: BoxFit.contain,
                color:
                    iseditable ? Colors.black12 : AppConstants.APP_THEME_COLOR,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  ColumnWidget('First Name', 'Enter First Name', iseditable, false),
                  ColumnWidget('Last Name', 'Enter Last Name', iseditable, false),
                  ColumnWidget('Phone Number', 'Enter Phone Number', iseditable, false),
                  ColumnWidget('Email Address', 'Enter Email Address', iseditable, false),
                  ColumnWidget('Country of Birth', 'Select Country of Birth',false, true),
                  ColumnWidget('Maratial Status', 'Select Maratial Status', false, true),
                  ColumnWidget('Nationality', 'Select Nationality', false, true),
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                   width: MediaQuery.of(context).size.width * 0.95,
                   height: 45,
                  child: FlatButton(
                    child: Text(
                      'DONE',
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    textColor: Colors.white,
                    color: AppConstants.APP_THEME_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Dashboard');
                    },
                  ),
                ),
              ),
            ),
          ],

        ),

      ),
    );

    // ColumnWidget('assets/images/emergency_contact.png',
    //   "Emergency Contacts", onTap:(){},),
    //    );
  }
}

class ColumnWidget extends StatelessWidget {
  VoidCallback onTap;

  ColumnWidget(this.label, this.hint, this.iseditable, this.showDropdown
      //{@required this.onTap}
      );

  final String label;
  final bool iseditable;
  final bool showDropdown;
  final dynamic hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppConstants.TEXT_BACKGROUND_COLOR,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
              )),
          //SizedBox(height: 5),
          TextField(
            style: TextStyle(
              fontSize: 16.0,
              height: 1.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                suffixIcon: showDropdown
                    ? Icon(
                        Icons.arrow_drop_down,
                        size: 25,
                      )
                    : null,
                // contentPadding: EdgeInsets.fromLTRB(0, 9, 0, 7),
                 enabled: iseditable,
                isDense: true,
                border: UnderlineInputBorder(),
                hintText: hint,
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppConstants.APP_THEME_COLOR))),
          ),
        ],
      ),
    );
  }
}
