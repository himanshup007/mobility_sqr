import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/TokenGetter.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/Screens/Dashboard/bloc/travel_req_bloc.dart';
import 'package:mobility_sqr/Widgets/Divider.dart';
import 'package:mobility_sqr/Widgets/MenuTile.dart';
import 'package:mobility_sqr/Widgets/TileDashboard.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'DashboardConstants.dart';

class Dashboard extends StatefulWidget {
  final Repository repository = Repository();
  final _userInfo=TokenGetter();

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _ScrollController = ScrollController();
  UserInfo info=UserInfo();
  String UserName='';

  getprofile() async {
    try{
      info = await widget._userInfo.readUserInfo() ??null;
      if(info!=null){
        this.setState(() {
          UserName=info.data.userName;
        });

      }

    }catch(e){
      print(e);
    }
  }
  @override
  initState()  {

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
              child: Image.asset('assets/images/sos.png',fit: BoxFit.contain,),
            ),
            SizedBox(width: 40,),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Align(
                alignment: Alignment.centerLeft,

                child: Stack(
                  children: <Widget>[
                    new Icon(Icons.notifications,color: AppConstants.TEXT_BACKGROUND_COLOR,),
                    new Positioned(
                      right: 0,
                      child: new Container(
                         padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: new Text(
                          '1',
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

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
                  'My Profile', "profile", context),
              CustomDivider(),
              CustomMenuTitle("assets/images/biometric-thumb.png",
                  'Fingerprint Authentication', "fingerprint", context),
              CustomDivider(),
              CustomMenuTitle("assets/images/change_password_sidemenu_icon.png",
                  'Change Password', "password", context),
              CustomDivider(),
              CustomMenuTitle("assets/images/logout_sidemenu_icon.png",
                  'Logout', "logout", context),
            ],
          ),
        ),
        body: SingleChildScrollView(
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
                          /*if(state.travelRequest.data.isEmpty){

                            return Container(
                              child: Text("No Travel Request Found"),
                            );
                          }else{*/
                          return Container(
                            height: 60.0.w,
                            width: 100.0.w,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Scrollbar(
                              isAlwaysShown: true,
                              controller: _ScrollController,
                              radius: Radius.circular(5),
                              thickness: 3,
                              child: new ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.travelRequest.data.length,
                                  itemBuilder: (BuildContext ctxt, int Index) {
                                    return Row(
                                      children: [
                                        Container(
                                          height: 55.0.w,
                                          width: 40.0.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppConstants
                                                    .TEXT_BACKGROUND_COLOR,
                                                width: .2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text("From"),
                                                            Container(
                                                              width: 15.0.w,
                                                              height: 3.5.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: AppConstants
                                                                    .APP_THEME_COLOR,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8)),
                                                              ),
                                                              child: Container(
                                                                height: 3.5.w,
                                                                margin: EdgeInsets
                                                                    .fromLTRB(
                                                                        0,
                                                                        1,
                                                                        0,
                                                                        0),
                                                                child: Text(
                                                                  state
                                                                      .travelRequest
                                                                      .data[
                                                                          Index]
                                                                      .travelReqId,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100.0.w,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5),
                                                        child: Text(
                                                          state
                                                              .travelRequest
                                                              .data[Index]
                                                              .details[0]
                                                              .sourceCity,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color: AppConstants
                                                                  .TEXT_BACKGROUND_COLOR,
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100.0.w,
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                5, 5, 5, 0),
                                                        child: Text(
                                                          state
                                                              .travelRequest
                                                              .data[Index]
                                                              .details[0]
                                                              .travellingCountry,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color: AppConstants
                                                                  .TEXT_BACKGROUND_COLOR,
                                                              fontSize: 13),
                                                        ),
                                                      ),
                                                      Stack(
                                                        children: <Widget>[
                                                          Container(
                                                            child: Divider(
                                                              color: AppConstants
                                                                  .TEXT_BACKGROUND_COLOR,
                                                              height: 15,
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 15,
                                                            child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Image.asset(
                                                                  'assets/images/plane_icon.png'),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Container(
                                                        width: 100.0.w,
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                5, 0, 5, 0),
                                                        child: Text(
                                                          "To",
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100.0.w,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5),
                                                        child: Text(
                                                          state
                                                              .travelRequest
                                                              .data[Index]
                                                              .details[0]
                                                              .destinationCity,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color: AppConstants
                                                                  .TEXT_BACKGROUND_COLOR,
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100.0.w,
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                5, 5, 5, 0),
                                                        child: Text(
                                                          state
                                                              .travelRequest
                                                              .data[Index]
                                                              .details[0]
                                                              .travellingCountryTo,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color: AppConstants
                                                                  .TEXT_BACKGROUND_COLOR,
                                                              fontSize: 13),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width: 100.0.w,
                                                              margin: EdgeInsets
                                                                  .all(5),
                                                              child: Text(
                                                                "Departure",
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 100.0.w,
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          5),
                                                              child: Text(
                                                                getDepartureTime(state
                                                                    .travelRequest
                                                                    .data[Index]
                                                                    .details[0]
                                                                    .departureDate),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 100.0.w,
                                                              margin: EdgeInsets
                                                                  .fromLTRB(5,
                                                                      5, 5, 0),
                                                              child: Text(
                                                                getDepatureDate(state
                                                                    .travelRequest
                                                                    .data[Index]
                                                                    .details[0]
                                                                    .departureDate),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppConstants
                                                                        .TEXT_BACKGROUND_COLOR,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 1,
                                                          child: Container())
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                          width: 10,
                                        )
                                      ],
                                    );
                                  }),
                            ),
                          );

                          /*}*/

                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  height: 48.0.w,
                  width: 100.0.w,
                  child: Row(
                    children: [
                      TileDashboard(
                          'assets/images/new-travel-box.png', 'New', 'Travel'),
                      SizedBox(
                        width: 20,
                      ),
                      TileDashboard('assets/images/previous-travel-box.png',
                          'Previous', 'Travels'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 48.0.w,
                  width: 100.0.w,
                  child: Row(
                    children: [
                      TileDashboard('assets/images/travel-calendar-box.png',
                          'Travel', 'Calendar'),
                      SizedBox(
                        width: 20,
                      ),
                      TileDashboard('assets/images/expense-master-box.png',
                          'Expenses', ''),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 48.0.w,
                  width: 100.0.w,
                  child: Row(
                    children: [
                      TileDashboard(
                          'assets/images/approver-box.png', 'Approvals', ''),
                      SizedBox(
                        width: 20,
                      ),
                      TileDashboard('assets/images/vault-box.png', 'Vault', ''),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getDepartureTime(String date) {
    final depatureDate = DateTime.parse(date);
    final String datestring = DateFormat("ddMMM yy").format(depatureDate);
    return datestring;
  }

  getDepatureDate(String date) {
    final depatureDate = DateTime.parse(date);
    final String daystring = DateFormat('EEEE').format(depatureDate);
    return daystring;
  }
}
