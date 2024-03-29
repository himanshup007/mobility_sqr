import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/NotificationManager/Notification.dart';
import 'package:mobility_sqr/Screens/AddNewTravel/AddNewTravel.dart';
import 'package:mobility_sqr/Screens/AddNewTravel/SuccesfullyAdded.dart';
import 'package:mobility_sqr/Screens/Approvals/ApprovalsScreen.dart';
import 'package:mobility_sqr/Screens/ComplianceScreen/ComplianceScreen.dart';

import 'package:mobility_sqr/Screens/ForgetPassScreen/ForgetPass.dart';
import 'package:mobility_sqr/Screens/LoginScreen/Username_screen.dart';
import 'package:mobility_sqr/Screens/Notification/NotificationScreen.dart';
import 'package:mobility_sqr/Screens/Profile/Personal_info/Personal_Info_Screen.dart';
import 'package:mobility_sqr/Screens/Profile/Profile_Screen.dart';
import 'package:mobility_sqr/Screens/PurposeScreen/PurposeScreen.dart';
import 'package:mobility_sqr/Screens/SplashScreen/SplashScreen.dart';
import 'package:mobility_sqr/Screens/Terms/Terms_Conditions.dart';
import 'package:mobility_sqr/Screens/TravelCalendar/AddEvent.dart';
import 'package:mobility_sqr/Screens/TravelReqView/TravelReqView.dart';

import 'package:mobility_sqr/Screens/VaultScreen/VaultScreen.dart';
import 'package:mobility_sqr/Util/SearchClass.dart';

import 'Screens/AddNewTravel/AddNewTravel2.dart';
import 'Screens/Dashboard/Dashboard.dart';
import 'Screens/DependentsScreen/Dependents.dart';
import 'Screens/ProjectName/ProjectIdScreen.dart';
import 'Screens/TravelCalendar/TravelCalender.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationManager.instance;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return GetMaterialApp(
      title: 'Mobility SQR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // highlightColor: Color(0xffffc600),
        unselectedWidgetColor: AppConstants.APP_THEME_COLOR,

        appBarTheme: AppBarTheme(
          elevation: 10,
          color: Colors.white,
        ),
      ),
      routes: {
         '/Username_Screen': (context) => Username_Screen(),
        '/': (context) => SplashScreen(),
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
        '/SuccessfullyAdded': (context) => SuccessfullyAdded(),
        '/ApprovalsScreen': (context) => ApprovalsScreen(),
        '/TravelReqView': (context) => TravelReqView(),
        '/TravelCalender': (context) => TravelCalender(),
        '/AddEvent': (context) => AddEvent(),
        '/Username_Screen': (context) => Username_Screen(),
        '/VaultScreen': (context) => VaultScreen(),
        '/NotificationScreen': (context) => NotificationScreen(),
        '/ComplianceScreen': (context) => ComplianceScreen(),
      },
    );
  }
}
