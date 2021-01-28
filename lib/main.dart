import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/AddNewTravel/AddNewTravel.dart';
import 'package:mobility_sqr/Screens/AddNewTravel/SuccesfullyAdded.dart';
import 'package:mobility_sqr/Screens/Approvals/ApprovalsScreen.dart';

import 'package:mobility_sqr/Screens/ForgetPassScreen/ForgetPass.dart';
import 'package:mobility_sqr/Screens/LoginScreen/Username_screen.dart';
import 'package:mobility_sqr/Screens/Profile/Personal_info/Personal_Info_Screen.dart';
import 'package:mobility_sqr/Screens/Profile/Profile_Screen.dart';
import 'package:mobility_sqr/Screens/PurposeScreen/PurposeScreen.dart';
import 'package:mobility_sqr/Screens/Terms/Terms_Conditions.dart';
import 'package:mobility_sqr/Screens/TravelReqView/TravelReqView.dart';
import 'package:mobility_sqr/Util/SearchClass.dart';
import 'package:mobility_sqr/Widgets/ApproxTravelCost.dart';

import 'Screens/AddNewTravel/AddNewTravel2.dart';
import 'Screens/Dashboard/Dashboard.dart';
import 'Screens/DependentsScreen/Dependents.dart';
import 'Screens/ProjectName/ProjectIdScreen.dart';

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
        unselectedWidgetColor: AppConstants.APP_THEME_COLOR,
        appBarTheme: AppBarTheme(
          color: Colors.white,
        ),
      ),
      routes: {
        '/': (context) => Username_Screen(),
        '/AddCity': (context) => AddCity(),
        '/Dashboard': (context) => Dashboard(),
        '/Term&Condition': (context) => Terms(),
        '/ForgetPass': (context) => ForgetPass(),
        '/SearchPlace': (context) => SearchPlace(),
        '/PurposeScreen': (context) => PurposeScreen(),
        '/AddNewTravel2': (context) => AddNewTravel2(),
        '/Dependents': (context) => Dependents(),
        '/ProjectIdScreen': (context) => ProjectIdScreen(),
        '/Profile_Screen': (context) => ProfileScreen(),
        '/PersonalInfo': (context) => PersonalInfo(),
        '/SuccessfullyAdded':(context) => SuccessfullyAdded(),
        '/ApprovalsScreen':(context) => ApprovalsScreen(),
        '/TravelReqView':(context) =>TravelReqView(),
      },
    );
  }
}
