import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/AddNewTravel/AddNewTravel.dart';
import 'package:mobility_sqr/Screens/ForgetPassScreen/ForgetPass.dart';
import 'package:mobility_sqr/Screens/LoginScreen/Username_screen.dart';
import 'package:mobility_sqr/Screens/Terms/Terms_Conditions.dart';

import 'Screens/Dashboard/Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Mobility SQR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        highlightColor: Color(0xffffc600),

        unselectedWidgetColor:AppConstants.APP_THEME_COLOR,


        appBarTheme: AppBarTheme(
          color: Colors.white,


        ),
      ),
      routes: {
        '/': (context) => Username_Screen(),
        '/AddCity': (context) => AddCity(),
        '/Dashboard':(context) => Dashboard(),
        '/Term&Condition': (context) => Terms(),
        '/ForgetPass': (context) => ForgetPass()
      },
    );
  }
}
