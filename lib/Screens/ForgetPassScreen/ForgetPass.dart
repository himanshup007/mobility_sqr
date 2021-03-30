import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/ChangePassPayload.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';

import 'package:sizer/sizer.dart';

class ForgetPass extends StatefulWidget {
  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final formKey = GlobalKey<FormState>();
  ChangePassPayload reqPayload = ChangePassPayload();
  TokenGetter _tokenGetter = TokenGetter();
  String newpass;
  String newpassConfirm=' ';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showloader=false;

  ApiProvider _apiProvider=ApiProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readInfo();
  }

  readInfo() async {
    UserInfo info = await _tokenGetter.readUserInfo();

    reqPayload.email = info.data.email;
    reqPayload.istemporary = '0';
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Stack(
        children: [
          Container(
            height: 100.0.h,
            width: 100.0.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Form(
                key: formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      children: [
                        HeadTitles(
                          title: "Old Password",
                        ),
                        Star()
                      ],
                    ),
                    PassBoxes(
                      hint: "Enter Old Password",
                      hideText: false,
                      ontextChanged: (text) {
                        reqPayload.oldPassword = text;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Row(
                      children: [
                        HeadTitles(
                          title: "New Password",
                        ),
                        Star(),
                      ],
                    ),
                    PassBoxes(
                      hint: "Enter New Password",
                      hideText: true,
                      ontextChanged: (text) {
                        reqPayload.password = text;
                        newpass = text;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Row(
                      children: [
                        HeadTitles(
                          title: "Confirm Password",
                        ),
                        Star(),
                      ],
                    ),
                    PassBoxes(
                      hint: "Enter Confirm Password",
                      hideText: false,
                      where: 1,
                      ontextChanged: (text) {
                        reqPayload.password = text;
                        newpassConfirm = text;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                onPressed: () {
                  if (newpassConfirm == newpass) {
                    this.setState(() {
                      showloader=true;
                    });
                    _apiProvider.ChangePass(reqPayload).then((value) => this.setState(() {
                      showloader=false;
                    }));


                  } else {
                    eventSnackbar( _scaffoldKey.currentState,
                        'Confirmed Password should same as new Password');
                  }
                },
                textColor: Colors.white,
                child: Text("Update"),
                color: Color(0xff9641A9),
              ),
            ),
          ),
          Container(
            child: showMobilityLoader(showloader, Colors.black12),
          )
        ],
      ),
    );
  }
}

class Star extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "*",
      style: stiling.copyWith(color: Colors.red),
    );
  }
}

class PassBoxes extends StatefulWidget {
  PassBoxes(
      {this.hint,
      this.hideText,
      this.validator,
      this.where,
      this.ontextChanged});

  final String hint;
  final bool hideText;
  var validator;
  int where;
  Function(String) ontextChanged;

  @override
  _PassBoxesState createState() => _PassBoxesState();
}

class _PassBoxesState extends State<PassBoxes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: (value) {
          if (widget.hideText) {
            if (value == null || value.isEmpty) {
              return '';
            } else if (!validateStructure(value)) {
              return 'Password should contain at least 6 characters, and at least 1 uppercase, 1 lowercase, and 1 number,and 1 special character ';
            }

            return null;
          }

          return null;
        },
        onChanged: (text) {
          widget.ontextChanged(text);
        },
        maxLines: 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLength: 16,
        obscureText: widget.hideText,
        decoration: InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.only(left: 10),
            focusedBorder: OutlineInputBorder(
              //focus boarder
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: AppConstants.APP_THEME_COLOR),
            ),
            errorBorder: OutlineInputBorder(
                //error boarder
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.red)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: AppConstants.APP_THEME_COLOR),
            ),
            errorMaxLines: 2,
            hintText: widget.hint,
            hintStyle: TextStyle(fontSize: 18)),
      ),
    );
  }
}

class HeadTitles extends StatelessWidget {
  HeadTitles({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: stiling);
  }
}

TextStyle stiling = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
showAlertDialog(BuildContext context, String text) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(color: AppConstants.APP_THEME_COLOR),
    ),
    onPressed: () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/', (Route<dynamic> route) => false);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("$text"),
    content: Text("Password Updated Successfully"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}