import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/TokenGetter.dart';
import 'package:mobility_sqr/ModelClasses/GetTravelRequest.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/Screens/Dashboard/bloc/travel_req_bloc.dart';
import 'dart:math' as math;
import 'package:mobility_sqr/Widgets/Divider.dart';
import 'package:mobility_sqr/Widgets/MenuTile.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:mobility_sqr/Widgets/TileDashboard.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'DashboardConstants.dart';

class Dashboard extends StatefulWidget {
  final Repository repository = Repository();
  final _userInfo = TokenGetter();

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _ScrollController = ScrollController();
  UserInfo info = UserInfo();
  String UserName = '';
  String ProfileImage = null;
  ApiProvider _appApiProvider = ApiProvider();

  bool showloader=false;
  getprofile() async {
    try {
      info = await widget._userInfo.readUserInfo() ?? null;
      if (info != null) {
        this.setState(() {
          UserName = info.data.userName;
          ProfileImage = AppConstants.BASE_URL + info.data.photo;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  initState() {
    super.initState();

    getprofile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
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
          actions: [
            Container(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/images/sos.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            GetNotificationIcon(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: ProfileImage == null
                          ? ImageIcon(
                              AssetImage(
                                'assets/images/myprofile_sidemenu_icon.png',
                              ),
                              size: 80,
                            )
                          : CircleAvatar(
                              radius: 40.0,
                              backgroundImage: NetworkImage("${ProfileImage}"),
                              backgroundColor: Colors.transparent,
                            ),
                    ),
                    Material(
                      child: Text(
                        '${UserName}',
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
                  'My Profile', context, OnTouch: () {
                Navigator.pushNamed(context, '/Profile_Screen');
              }),
              CustomDivider(),

              CustomMenuTitle("assets/images/biometric-thumb.png",
                  'Fingerprint Authentication', context,
                  OnTouch: () {}),
              CustomDivider(),
              CustomMenuTitle("assets/images/change_password_sidemenu_icon.png",
                  'Change Password', context,
                  OnTouch: () {}),
              CustomDivider(),
              CustomMenuTitle(
                  "assets/images/logout_sidemenu_icon.png", 'Logout', context,
                  OnTouch: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);

                  }),
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: 100.0.w,
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "My Travel Requests",
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
                        create: (context) => TravelReqBloc(widget.repository),
                        child: BlocBuilder<TravelReqBloc, TravelReqState>(
                          builder: (context, state) {
                            if (state is TravelReqInitial) {
                              BlocProvider.of<TravelReqBloc>(context)
                                  .add(FetchTravelReq());
                            }
                            if (state is TravelReqError) {
                              return Center(
                                child: Text(
                                    'Failed to fetch Upcoming Travel Requests!'),
                              );
                            }
                            if (state is TravelReqLoaded) {
                              if (state.travelRequest.data == null) {
                                return Container(
                                  height: 10.0.h,
                                  child: Center(
                                      child: Text("Oops Something went wrong!")),
                                );
                              } else if (state.travelRequest.data.length == 0) {
                                return Container(
                                  height: 10.0.h,
                                  child: Center(child: Text("No Travel Request")),
                                );
                              } else {
                                return Container(
                                  height: 65.0.w,
                                  width: 100.0.w,
                                  // decoration: BoxDecoration(
                                  //   image:  DecorationImage(
                                  //     image: AssetImage(
                                  //         'assets/images/dashboard_bg.jpg'),
                                  //     fit: BoxFit.fill,
                                  //   ),   //Image.asset(
                                  //
                                  // ),
                                  margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                                  child: Scrollbar(
                                    isAlwaysShown: true,
                                    controller: _ScrollController,
                                    radius: Radius.circular(5),
                                    thickness: 3,
                                    child: AnimationLimiter(
                                      child: new ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              state.travelRequest.data.length,
                                          itemBuilder:
                                              (BuildContext ctxt, int Index) {
                                            return AnimationConfiguration
                                                .staggeredList(
                                              position: Index,
                                              duration:
                                                  const Duration(milliseconds: 600),
                                              child: SlideAnimation(
                                                horizontalOffset: 50,
                                                child: FadeInAnimation(
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          this.setState(() {
                                                            showloader=true;

                                                          })  ;

                                                          _appApiProvider
                                                              .fetchViewTravelReq(
                                                              state.travelRequest
                                                                  .data[Index].travelReqId)
                                                              .then((value) =>
                                                          this.setState(() {
                                                            showloader=false;
                                                            NavigationHandler(value,context,2);
                                                          })
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 60.0.w,
                                                          width: 40.0.w,

                                                          decoration: BoxDecoration(
                                                             color: Colors.white,
                                                            border: Border.all(
                                                                color: AppConstants
                                                                    .TEXT_BACKGROUND_COLOR,
                                                                width: .2),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        5)),
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Expanded(
                                                                flex: 5,
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      margin:
                                                                          EdgeInsets
                                                                              .all(
                                                                                  5),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                              "To"),
                                                                          Container(
                                                                            width:
                                                                                15.0.w,
                                                                            height:
                                                                                3.5.w,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color:
                                                                                  AppConstants.APP_THEME_COLOR,
                                                                              borderRadius:
                                                                                  BorderRadius.all(Radius.circular(8)),
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              height:
                                                                                  3.5.w,
                                                                              margin: EdgeInsets.fromLTRB(
                                                                                  0,
                                                                                  1,
                                                                                  0,
                                                                                  0),
                                                                              child:
                                                                                  Text(
                                                                                state.travelRequest.data[Index].travelReqId,
                                                                                style:
                                                                                    TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontSize: 10,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                                textAlign:
                                                                                    TextAlign.center,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                      100.0.w,
                                                                      margin: EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                          5),
                                                                      child: state
                                                                          .travelRequest
                                                                          .data[Index]
                                                                          .details
                                                                          .length >
                                                                          0
                                                                          ? Text(
                                                                        state
                                                                            .travelRequest
                                                                            .data[Index]
                                                                            .details[0]
                                                                            .destinationCity,
                                                                        textAlign:
                                                                        TextAlign.start,
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight.w900,
                                                                            color: AppConstants.TEXT_BACKGROUND_COLOR,
                                                                            fontSize: 15),
                                                                      )
                                                                          : SizedBox(),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                      100.0.w,
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                          5,
                                                                          5,
                                                                          5,
                                                                          0),
                                                                      child: state
                                                                          .travelRequest
                                                                          .data[Index]
                                                                          .details
                                                                          .length >
                                                                          0
                                                                          ? Text(
                                                                        state
                                                                            .travelRequest
                                                                            .data[Index]
                                                                            .details[0]
                                                                            .travellingCountryTo,
                                                                        textAlign:
                                                                        TextAlign.start,
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight.w300,
                                                                            color: AppConstants.TEXT_BACKGROUND_COLOR,
                                                                            fontSize: 13),
                                                                      )
                                                                          : SizedBox(),
                                                                    ),
                                                                    Stack(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          child:
                                                                              Divider(
                                                                            color: AppConstants
                                                                                .TEXT_BACKGROUND_COLOR,
                                                                            height:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                        Transform.rotate(
                                                                          angle: 180 * math.pi / 180,
                                                                          child: Container(
                                                                            height:
                                                                                15,
                                                                            child:
                                                                                Align(
                                                                              alignment:
                                                                                  Alignment.center,
                                                                              child: Image.asset(
                                                                                  'assets/images/plane_icon.png'),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),


                                                                    Container(
                                                                      width:
                                                                          100.0.w,
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              5,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                      child: Text(
                                                                        "From",
                                                                        textAlign:
                                                                            TextAlign
                                                                                .start,
                                                                      ),
                                                                    ),

                                                                    Container(
                                                                      width:
                                                                      100.0.w,
                                                                      margin: EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                          5),
                                                                      child: state
                                                                          .travelRequest
                                                                          .data[Index]
                                                                          .details
                                                                          .length >
                                                                          0
                                                                          ? Text(
                                                                        state
                                                                            .travelRequest
                                                                            .data[Index]
                                                                            .details[0]
                                                                            .sourceCity,
                                                                        textAlign:
                                                                        TextAlign.start,
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight.w900,
                                                                            color: AppConstants.TEXT_BACKGROUND_COLOR,
                                                                            fontSize: 15),
                                                                      )
                                                                          : SizedBox(),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                      100.0.w,
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                          5,
                                                                          5,
                                                                          5,
                                                                          0),
                                                                      child: state
                                                                          .travelRequest
                                                                          .data[Index]
                                                                          .details
                                                                          .length >
                                                                          0
                                                                          ? Text(
                                                                        state
                                                                            .travelRequest
                                                                            .data[Index]
                                                                            .details[0]
                                                                            .travellingCountry,
                                                                        textAlign:
                                                                        TextAlign.start,
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight.w300,
                                                                            color: AppConstants.TEXT_BACKGROUND_COLOR,
                                                                            fontSize: 13),
                                                                      )
                                                                          : SizedBox(),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Container(
                                                                  color: AppConstants
                                                                      .BACKGROUND_COLOR_BOTTOM,
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Container(
                                                                              width:
                                                                                  100.0.w,
                                                                              margin:
                                                                                  EdgeInsets.all(5),
                                                                              child:
                                                                                  Text(
                                                                                "Departure",
                                                                                textAlign:
                                                                                    TextAlign.start,
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width:
                                                                                  100.0.w,
                                                                              margin:
                                                                                  EdgeInsets.symmetric(horizontal: 5),
                                                                              child: state.travelRequest.data[Index].details.length > 0
                                                                                  ? Text(
                                                                                      getDepartureTime(state.travelRequest.data[Index].details[0].departureDate),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontSize: 18),
                                                                                    )
                                                                                  : SizedBox(),
                                                                            ),
                                                                            Container(
                                                                              width:
                                                                                  100.0.w,
                                                                              margin: EdgeInsets.fromLTRB(
                                                                                  5,
                                                                                  5,
                                                                                  5,
                                                                                  0),
                                                                              child: state.travelRequest.data[Index].details.length > 0
                                                                                  ? Text(
                                                                                      getDepatureDate(state.travelRequest.data[Index].details[0].departureDate),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: TextStyle(fontWeight: FontWeight.w500, color: AppConstants.TEXT_BACKGROUND_COLOR, fontSize: 13),
                                                                                    )
                                                                                  : SizedBox(),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      state.travelRequest.data[Index]
                                                                                  .travelReqStatus ==
                                                                              '2'
                                                                          ? Expanded(
                                                                              flex:
                                                                                  1,
                                                                              child:
                                                                                  Container(
                                                                                foregroundDecoration:
                                                                                    const RotatedCornerDecoration(
                                                                                  color: Colors.orangeAccent,
                                                                                  geometry: const BadgeGeometry(width: 55, height: 55, alignment: BadgeAlignment.bottomRight),
                                                                                  textSpan: TextSpan(text: 'In Progress', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                                                                                  labelInsets: LabelInsets(baselineShift: 3, start: 1),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          :state.travelRequest.data[Index].travelReqStatus=='2' ?Expanded(
                                                                              flex:
                                                                                  1,
                                                                              child:
                                                                                  Container(
                                                                                foregroundDecoration:
                                                                                    const RotatedCornerDecoration(
                                                                                  color: Colors.lightGreen,
                                                                                  geometry: const BadgeGeometry(width: 55, height: 55, alignment: BadgeAlignment.bottomRight),
                                                                                  textSpan: TextSpan(text: 'Approved', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                                                                                  labelInsets: LabelInsets(baselineShift: 3, start: 1),
                                                                                ),
                                                                              ),
                                                                            ):state.travelRequest.data[Index].travelReqStatus=='1' ?Expanded(
                                                                        flex:
                                                                        1,
                                                                        child:
                                                                        Container(
                                                                          foregroundDecoration:
                                                                          const RotatedCornerDecoration(
                                                                            color: Colors.yellow,
                                                                            geometry: const BadgeGeometry(width: 55, height: 55, alignment: BadgeAlignment.bottomRight),
                                                                            textSpan: TextSpan(text: 'Saved', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                                                                            labelInsets: LabelInsets(baselineShift: 3, start: 1),
                                                                          ),
                                                                        ),
                                                                      ):state.travelRequest.data[Index].travelReqStatus=='5' ?Expanded(
                                                                        flex:
                                                                        1,
                                                                        child:
                                                                        Container(
                                                                          foregroundDecoration:
                                                                          const RotatedCornerDecoration(
                                                                            color: Colors.red,
                                                                            geometry: const BadgeGeometry(width: 55, height: 55, alignment: BadgeAlignment.bottomRight),
                                                                            textSpan: TextSpan(text: 'Rejected', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                                                                            labelInsets: LabelInsets(baselineShift: 3, start: 1),
                                                                          ),
                                                                        ),
                                                                      ):
                                                                      Expanded(
                                                                        flex:
                                                                        1,
                                                                        child:
                                                                        Container(
                                                                          foregroundDecoration:
                                                                          const RotatedCornerDecoration(
                                                                            color: Colors.green,
                                                                            geometry: const BadgeGeometry(width: 55, height: 55, alignment: BadgeAlignment.bottomRight),
                                                                            textSpan: TextSpan(text: 'Closed', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                                                                            labelInsets: LabelInsets(baselineShift: 3, start: 1),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                        width: 10,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                );
                              }
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        )),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 10, 0),
                      height: 50.0.w,
                      width: 100.0.w,
                      child: Row(
                        children: [
                          TileDashboard(
                            'assets/images/new-travel-box.png',
                            'New',
                            'Travel',
                            onTap: () {
                              getNavigator(context, 1);
                            },
                          ),
                          SizedBox(
                            width: 6.0.w,
                          ),
                          TileDashboard(
                            'assets/images/previous-travel-box.png',
                            'Previous',
                            'Travels',
                            onTap: () {
                              getNavigator(context, 2);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      height: 50.0.w,
                      width: 100.0.w,
                      child: Row(
                        children: [
                          TileDashboard(
                            'assets/images/travel-calendar-box.png',
                            'Travel',
                            'Calendar',
                            onTap: () {
                              getNavigator(context, 3);
                            },
                          ),
                          SizedBox(
                            width: 6.0.w,
                          ),
                          TileDashboard(
                            'assets/images/expense-master-box.png',
                            'Expenses',
                            '',
                            onTap: () {
                              getNavigator(context, 4);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      height: 50.0.w,
                      width: 100.0.w,
                      child: Row(
                        children: [
                          TileDashboard(
                            'assets/images/approver-box.png',
                            'Approvals',
                            '',
                            onTap: () {
                              getNavigator(context, 5);
                            },
                          ),
                          SizedBox(
                            width: 6.0.w,
                          ),
                          TileDashboard(
                            'assets/images/vault-box.png',
                            'Vault',
                            '',
                            onTap: () {
                              getNavigator(context, 6);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            showMobilityLoader(showloader,Colors.black26)
          ],
        ),
      ),
    );
  }

  getDepartureTime(String date) {
    final depatureDate = DateTime.parse(date).toLocal();
    final String datestring = DateFormat("ddMMM yy").format(depatureDate);
    return datestring;
  }

  getDepatureDate(String date) {
    final depatureDate = DateTime.parse(date);
    final String daystring = DateFormat('EEEE').format(depatureDate);
    return daystring;
  }

  getNavigator(BuildContext context, int where) {
    if (where == 1) {
      Navigator.pushNamed(context, '/AddCity');
    } else if (where == 2) {
      Navigator.pushNamed(context, '/ApprovalsScreen',
          arguments: {"where": 2, "header": "Previous Travels"});
    } else if (where == 5) {
      Navigator.pushNamed(context, '/ApprovalsScreen',
          arguments: {"where": 5, "header": "Approvals"});
    } else {
      showAlertDialog(context, " Coming Soon");
    }
  }
}

showAlertDialog(BuildContext context, String text) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(color: AppConstants.APP_THEME_COLOR),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text("Coming Soon"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
NavigationHandler(GetTravelRequest value,BuildContext context,where) {

  Navigator.pushNamed(context, '/TravelReqView',arguments: {"EmployeeData":value.data,"where":where});

}
