import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/LoginScreen/UsernameConstants.dart';
import 'package:mobility_sqr/Screens/LoginScreen/bloc/UsernameBloc.dart';
import 'package:mobility_sqr/Widgets/AlertDialog.dart';
import 'package:mobility_sqr/Widgets/EditFieldUsername.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';
import 'package:sizer/sizer_util.dart';
import 'package:sizer/sizer.dart';

class ForgetPass extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => new _ForgetPass();
}

class _ForgetPass extends State<ForgetPass> {
  BuildContext dialogContext;

  @override
  void dispose() {
    super.dispose();

  }


  @override
  void initState() {
    super.initState();
    bloc.flushConfirmController();
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
                  child: Text("Forget Password",
                      style: Loign_UI_Constants.styleForText),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 10, 20, 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please Sign in to access your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                Container(
                  child: EditFieldCustom(Icons.perm_identity, "Username",
                      UsernameConst.EMAIL_HINT, 3),
                ),
                Container(
                  width: 100.0.w,
                  margin: EdgeInsets.fromLTRB(30, 20, 20, 0),
                  decoration: BoxDecoration(
                      color: AppConstants.APP_THEME_COLOR,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: AppConstants.APP_THEME_COLOR,
                      child: Text(
                        "Send",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {

                        FocusScope.of(context).unfocus();
                        _onLoading();
                      String msg=  await bloc.sendResetEmail();
                        showDefaultSnackbar(context,
                            "$msg");
                        Navigator.of(context, rootNavigator: true).pop(dialogContext);
                      }),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 100.0.w,
                    margin: EdgeInsets.fromLTRB(0, 30, 20, 30),
                    child: Text(
                      "Back to Sign in",
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
        );
      });
    });
  }
  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: true,
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
}

class Loign_UI_Constants {
  static const TextStyle styleForText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    color: Colors.black,
  );
}
