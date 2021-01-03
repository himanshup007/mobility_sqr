import 'package:flutter/material.dart';
import 'package:mobility_sqr/Dashboard/Dashboard.dart';
import 'package:mobility_sqr/ForgetPassScreen/ForgetPass.dart';
import 'package:mobility_sqr/LoginScreen/Username_screen.dart';
import 'package:mobility_sqr/Terms/Terms_Conditions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobility SQR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
        ),
      ),
      routes: {
        '/': (context) => Username_Screen(),
        '/DashBoard': (context) => DashBoard(),
        '/Term&Condition': (context) => Terms(),
        '/ForgetPass': (context) => ForgetPass()
      },
    );
  }
}
