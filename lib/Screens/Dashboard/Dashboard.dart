import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/Dashboard/bloc/travel_req_bloc.dart';
import 'package:mobility_sqr/Widgets/Divider.dart';
import 'package:mobility_sqr/Widgets/MenuTile.dart';
import 'package:sizer/sizer.dart';

import 'DashboardConstants.dart';

class Dashboard extends StatefulWidget {
  final Repository repository= Repository();



  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        titleSpacing: 0.0,
        title: Text(
          "Voyager",
          style: TextStyle(
              color: AppConstants.APP_THEME_COLOR,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  // color: Colors.green,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        child: ImageIcon(
                          AssetImage(
                              'assets/images/myprofile_sidemenu_icon.png'),
                          size: 80,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.black12,
                      ),
                      Material(
                        child: Text(
                          'User Name',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              height: 1.7),
                        ),
                      ),
                    ],
                  ),
                )),
            CustomMenuTitle("assets/images/myprofile_sidemenu_icon.png",
                'My Profile', "profile", context),
            CustomDivider(),
            CustomMenuTitle("assets/images/biometric-thumb.png",
                'Fingerprint Authentication', "fingerprint", context),
            CustomDivider(),
            CustomMenuTitle("assets/images/change_password_sidemenu_icon.png",
                'Change Password', "password", context),
            CustomDivider(),
            CustomMenuTitle("assets/images/logout_sidemenu_icon.png", 'Logout',
                "logout", context),
          ],
        ),
      ),
      body: Container(
        height: 100.0.w,
        width: 100.0.w,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "My Travel Request",
                        style: TextStyle(
                            fontWeight: customWeight,
                            color: AppConstants.TEXT_BACKGROUND_COLOR),
                      ),
                      flex: 4,
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppConstants.TEXT_BACKGROUND_COLOR,
                      ),
                      flex: 6,
                    ),


                  ],
                )),
            BlocProvider(
                create: (context) => TravelReqBloc( widget.repository),
                child: BlocBuilder<TravelReqBloc, TravelReqState>(
                  builder: (context, state) {
                    if (state is TravelReqInitial) {
                      BlocProvider.of<TravelReqBloc>(context).add(FetchTravelReq());
                    }
                    if (state is TravelReqError) {
                      return Center(
                        child: Text('failed to fetch quote'),
                      );
                    }
                    if (state is TravelReqLoaded) {
                      return Container(
                        child: Text(state.travelRequest.massage),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )

            )
          ],
        ),
      ),
    );
  }
}
