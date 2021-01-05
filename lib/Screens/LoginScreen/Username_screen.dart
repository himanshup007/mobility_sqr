import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/TokenGetter.dart';
import 'package:mobility_sqr/ModelClasses/UserToken.dart';
import 'package:mobility_sqr/Screens/LoginScreen/UsernameConstants.dart';
import 'package:mobility_sqr/Screens/LoginScreen/bloc/UsernameBloc.dart';
import 'package:mobility_sqr/Widgets/AlertDialog.dart';
import 'package:mobility_sqr/Widgets/EditFieldUsername.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';
import 'package:sizer/sizer_util.dart';
import 'package:sizer/sizer.dart';

class Username_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _Username_Screen();
}

class _Username_Screen extends State<Username_Screen> {
  bool manageloginUI = false;
  final tokengetter = TokenGetter();
  String Email = "";
  BuildContext dialogContext;

  @override
  void dispose() {
    bloc.dispose(); // call the dispose method to close our StreamController
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    bloc.flush();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(//return LayoutBuilder
        builder: (context, constraints) {
      return OrientationBuilder(//return OrientationBuilder
          builder: (context, orientation) {
        //initialize SizerUtil()
        SizerUtil()
            .init(constraints, Orientation.portrait); //initialize SizerUtil
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: 100.0.w,
              color: Colors.white,
              child: Column(
                verticalDirection: VerticalDirection.down,
                children: [
                  Container(
                    child: Image.asset('assets/images/login_header.png'),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 20, 20, 0),
                    alignment: Alignment.centerLeft,
                    child:
                        Text("Sign In", style: Loign_UI_Constants.styleForText),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 10, 20, 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please Sign in to access your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  !manageloginUI
                      ? Container(
                          child: EditFieldCustom(Icons.perm_identity,
                              "Username", UsernameConst.EMAIL_HINT, 1),
                        )
                      : Container(
                          child: Column(
                            children: [
                              StreamBuilder<String>(
                                  stream: bloc.EmailData,
                                  builder: (context, snapshot) {
                                    return Container(
                                      margin:
                                          EdgeInsets.fromLTRB(10, 20, 20, 0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 10.0.w,
                                            child: RaisedButton(
                                              onPressed: () {
                                                this.setState(() {
                                                  manageloginUI = false;
                                                });
                                                bloc.flush();
                                                bloc.fetchUserCheck(1);
                                              },
                                              child: Icon(Icons.arrow_back),
                                              color: Colors.white,
                                              elevation: 0,
                                            ),
                                          ),
                                          Text("${snapshot.data}")
                                        ],
                                      ),
                                    );
                                  }),
                              EditFieldCustom(Icons.lock_outlined, "Password",
                                  UsernameConst.PASS_HINT, 2),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/ForgetPass');
                                },
                                child: Container(
                                  width: 100.0.w,
                                  margin: EdgeInsets.fromLTRB(0, 30, 20, 30),
                                  child: Text(
                                    "Forget Password?",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: AppConstants.APP_THEME_COLOR,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  Container(
                    width: 100.0.w,
                    margin: EdgeInsets.fromLTRB(30, 20, 20, 0),
                    decoration: BoxDecoration(
                        color: AppConstants.APP_THEME_COLOR,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: !manageloginUI
                        ? StreamBuilder<bool>(
                            stream: bloc.isUser,
                            initialData: false,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return RaisedButton(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    color: AppConstants.APP_THEME_COLOR,
                                    child: Text(
                                      "NEXT",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      //   Navigator.pushNamed(context, '/DashBoard');
                                      FocusScope.of(context).unfocus();
                                      _onLoading();
                                      if (snapshot.hasData) {
                                        // Navigator.pushNamed(context, '/Term&Condition');
                                        bool data;
                                        try {
                                          data = await bloc.fetchUserCheck(0);
                                        } catch (e) {}

                                        if (data != null && data != false) {
                                          this.setState(() {
                                            manageloginUI = true;
                                          });
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop(dialogContext);
                                        } else if (data == null) {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop(dialogContext);
                                          showDefaultSnackbar(
                                              context, "No Internet found");
                                        } else {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop(dialogContext);
                                          showDefaultSnackbar(context,
                                              UsernameConst.USER_INVALID);
                                        }
                                      }
                                    });
                              }
                            })
                        : StreamBuilder<UserToken>(
                            stream: bloc.getIsValidPass,
                            initialData: null,
                            builder:
                                (context, AsyncSnapshot<UserToken> snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.data.access != null) {
                                if (snapshot.data.access != null) {
                                  tokengetter.saveValue(snapshot.data.access,
                                      snapshot.data.refresh);
                                  getTimeforPush();
                                }
                              } else if (snapshot.hasData &&
                                  snapshot.data.detail != null) {
                                Future.delayed(Duration(seconds: 3), () {
                                  try {




                                      showDefaultSnackbar(
                                          context, snapshot.data.detail);


                                  } catch (e) {

                                  }

                                });
                              }

                              return RaisedButton(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: AppConstants.APP_THEME_COLOR,
                                  child: Text(
                                    "NEXT",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    _onLoading();

                                    FocusScope.of(context).unfocus();
                                    bloc.passwordValidate();
                                    Future.delayed(Duration(seconds: 3), () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(dialogContext);
                                    });

                                  });
                            }),
                  ),
                ],
              ),
            ));
      });
    });
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        dialogContext = context;
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            height: 50,
            width: 50,
            color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  void getTimeforPush() async {
    Future.delayed(Duration.zero, () {
      Navigator.of(context, rootNavigator: true).pop(dialogContext);
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/Term&Condition', (Route<dynamic> route) => false);
    });
  }
}

class Loign_UI_Constants {
  static const TextStyle styleForText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    color: Colors.black,
  );
}