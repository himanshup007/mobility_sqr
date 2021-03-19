import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/CustomLibrary/Calender/lib/table_calendar.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/Activities.dart';
import 'package:mobility_sqr/ModelClasses/CalenderResponseModel.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/Screens/TravelCalendar/AddEvent.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'dart:math' as math;
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class TravelCalender extends StatefulWidget {
  TravelCalender({Key key}) : super(key: key);

  @override
  _TravelCalenderState createState() => _TravelCalenderState();
}

class _TravelCalenderState extends State<TravelCalender>
    with TickerProviderStateMixin {
  Map<DateTime, List> _events = Map<DateTime, List>();
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  ApiProvider _apiProvider = ApiProvider();

  DateTime selectedDatebyUser = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final Map<DateTime, List> _holidays = {
    DateTime(2020, 1, 1): ['New Year\'s Day'],
    DateTime(2020, 1, 6): ['Epiphany'],
    DateTime(2020, 2, 14): ['Valentine\'s Day'],
    DateTime(2020, 4, 21): ['Easter Sunday'],
    DateTime(2020, 4, 22): ['Easter Monday'],
  };

  String empCode = "";

  TokenGetter mprefs = TokenGetter();

  readUserInfo() async {
    UserInfo info = await mprefs.readUserInfo() ?? null;
    try {
      if (info != null) {
        this.setState(() {
          empCode = info.data.empCode;
        });

        await _apiProvider
            .get_Calender_Event(empCode: empCode)
            .then((value) => setCalendarValue(value));
      }
    } catch (e) {
      print(e);
    }
  }

  setCalendarValue(CalenderEventResponseModel events) async {
    var extracted_events = await getTask1(events.data.reversed.toList());

    this.setState(() {
      _events.addAll(extracted_events);

      DateTime mydate = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);
      _selectedEvents = _events[mydate] ?? [];
    });
  }

  Future<Map<DateTime, List>> getTask1(List<CalendarEvent> event) async {
    Map<DateTime, List> mapFetch = {};

    for (int i = 0; i < event.length; i++) {
      var createTime = DateTime.parse(event[i].fromDate);
      var endTime = DateTime.parse(event[i].toDate);

      var difference = endTime.difference(createTime).inDays;

      var original = mapFetch[createTime];
      if (original == null) {
        mapFetch[createTime] = [event[i]];
      } else {
        mapFetch[createTime] = List.from(original)..addAll([event[i]]);
      }

      List<DateTime> extractedDays = extract_days(difference, createTime);

      for (int j = 0; j < extractedDays.length; j++) {
        var mydate = mapFetch[extractedDays[j]];

        if (mydate == null) {
          mapFetch[extractedDays[j]] = [event[i]];
        } else {
          mapFetch[extractedDays[j]] = List.from(mydate)..addAll([event[i]]);
        }
      }
    }
    return mapFetch;
  }

  extract_days(int difference, DateTime from_date) {
    List<DateTime> dates = List<DateTime>();

    for (int i = 1; i <= difference; i++) {
      DateTime mydates = from_date.add(Duration(days: i));

      dates.add(mydates);
    }

    return dates;
  }

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    readUserInfo();

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      selectedDatebyUser = day;
      _selectedEvents = events.toSet().toList();
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Travel Calender",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              _buildTableCalendarWithBuilders(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          color: Color(0xFFF2F2F2),
                          height: 30,
                          width: 30,
                          child: ClayContainer(
                            color: Color(0xFFF2F2F2),
                            height: 20,
                            width: 20,
                            borderRadius: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Work")
                      ],
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Color(0xFFF2F2F2),
                          height: 30,
                          width: 30,
                          child: ClayContainer(
                            color: Color(0xFFF2F2F2),
                            height: 20,
                            width: 20,
                            borderRadius: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Holiday")
                      ],
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Color(0xFFF2F2F2),
                          height: 30,
                          width: 30,
                          child: ClayContainer(
                            color: Color(0xFFF2F2F2),
                            height: 20,
                            width: 20,
                            borderRadius: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Business")
                      ],
                    ),
                    SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          color: Color(0xFFF2F2F2),
                          height: 30,
                          width: 30,
                          child: ClayContainer(
                            color: Color(0xFFF2F2F2),
                            height: 20,
                            width: 20,
                            borderRadius: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Transit")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          _selectedEvents.length != 0
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: double.maxFinite,
                    child: DraggableScrollableSheet(
                        initialChildSize: 0.1,
                        minChildSize: 0.1,
                        maxChildSize: 0.8,
                        builder: (BuildContext context, myscrollController) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: ListView.builder(
                              controller: myscrollController,
                              itemCount: _selectedEvents.length,
                              itemBuilder: (BuildContext context, int index) {
                                return index == 0
                                    ? Column(
                                        children: [
                                          Container(
                                            width: 100.0.w,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                                color: Colors.purple[600]),
                                            child: Center(
                                              child: Text(
                                                "Events",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0.w,
                                                vertical: 10),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 20.0.w,
                                                    child: Text(
                                                      'Activity',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20.0.w,
                                                    child: Text(
                                                      "Location",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20.0.w,
                                                    child: Text(
                                                      "Edit",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0.w,
                                                vertical: 10),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 20.0.w,
                                                    child: AutoSizeText(
                                                      '${_selectedEvents[index].activity.toString().contains("Holiday") ? "Holiday" : _selectedEvents[index].activity}',
                                                      maxLines: 1,
                                                      minFontSize: 14,
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 35.0.w,
                                                    child: Text(
                                                      "${_selectedEvents[index].cityName} / ${_selectedEvents[index].countryName}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      final result =
                                                          await Navigator.push(
                                                        context,
                                                        // Create the SelectionScreen in the next step.
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    AddEvent(
                                                                      event: _selectedEvents[
                                                                          index],
                                                                    )),
                                                      );

                                                      setCalendarValue(result);
                                                    },
                                                    child: SizedBox(
                                                        width: 20.0.w,
                                                        child: Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Icon(
                                                                Icons.edit))),
                                                  ),
                                                ]),
                                          ),
                                        ],
                                      )
                                    :
                                // Container(
                                //         margin: EdgeInsets.symmetric(
                                //             horizontal: 5.0.w, vertical: 10),
                                //         child: Row(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               SizedBox(
                                //                 width: 20.0.w,
                                //                 child: AutoSizeText(
                                //                   '${_selectedEvents[index].activity.toString().contains("Holiday") ? "Holiday" : _selectedEvents[index].activity}',
                                //                   maxLines: 1,
                                //                   maxFontSize: 14,
                                //                   textAlign: TextAlign.center,
                                //                   style: TextStyle(
                                //                       color: Colors.black,
                                //                       fontSize: 16,
                                //                       fontWeight:
                                //                           FontWeight.w400),
                                //                 ),
                                //               ),
                                //               SizedBox(
                                //                 width: 35.0.w,
                                //                 child: Text(
                                //                   "${_selectedEvents[index].cityName} / ${_selectedEvents[index].countryName}",
                                //                   textAlign: TextAlign.center,
                                //                   style: TextStyle(
                                //                       color: Colors.black,
                                //                       fontSize: 14,
                                //                       fontWeight:
                                //                           FontWeight.w400),
                                //                 ),
                                //               ),
                                //               GestureDetector(
                                //                 onTap: () async {
                                //                   final result =
                                //                       await Navigator.push(
                                //                     context,
                                //                     // Create the SelectionScreen in the next step.
                                //                     MaterialPageRoute(
                                //                         builder: (context) =>
                                //                             AddEvent(
                                //                               event:
                                //                                   _selectedEvents[
                                //                                       index],
                                //                             )),
                                //                   );
                                //
                                //                   setCalendarValue(result);
                                //                 },
                                //                 child: SizedBox(
                                //                     width: 20.0.w,
                                //                     child: Align(
                                //                         alignment: Alignment
                                //                             .centerRight,
                                //                         child:
                                //                             Icon(Icons.edit))),
                                //               ),
                                //             ]),
                                //       );
                                SizedBox(height: 0,width: 0,);
                              },
                            ),
                          );
                        }),
                  ),
                )
              : SizedBox(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.black,
        elevation: 10,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            // Create the SelectionScreen in the next step.
            MaterialPageRoute(builder: (context) => AddEvent()),
          );

          setCalendarValue(result);
          // Navigator.pushNamed(context, '/AddEvent');
        },
        backgroundColor: AppConstants.APP_THEME_COLOR,
        child: Icon(
          Icons.add,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      rowHeight: MediaQuery.of(context).size.height / 8,
      locale: 'en_us',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialSelectedDay: null,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.none,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        titleTextStyle: TextStyle(
            color: AppConstants.APP_THEME_COLOR,
            fontSize: 20,
            fontWeight: FontWeight.w700),
        decoration: BoxDecoration(),
        leftChevronMargin: EdgeInsets.only(left: 60),
        rightChevronMargin: EdgeInsets.only(right: 60),
        leftChevronIcon: Icon(
          Icons.arrow_back_ios,
          color: AppConstants.APP_THEME_COLOR,
        ),
        rightChevronIcon: Icon(
          Icons.arrow_forward_ios,
          color: AppConstants.APP_THEME_COLOR,
        ),
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1.0, 0.0),
                    end: Alignment(
                      1.0,
                      0.0,
                    ),
                    colors: [
                      Color(0xFF9f559a),
                      Color(0xFFb24698),
                      Color(0xFF641d75),
                    ],
                    transform: GradientRotation(math.pi / 4),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: AppConstants.APP_THEME_COLOR, width: .5)),
              child: Center(
                child: Text(
                  '${date.day}',
                  style:
                      TextStyle().copyWith(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.black26, width: .5)),
            child: Center(
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                top: 10,
                child: _buildHolidaysMarker(date, events),
              ),
            );
            children.add(
              _buildEventsMarker(date, events),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 40.0,
      child: events[0].activity == 'Work'
          ? Container(
              margin: EdgeInsets.all(2),
              foregroundDecoration: const RotatedCornerDecoration(
                color: Colors.green,
                geometry: const BadgeGeometry(
                    width: 30,
                    height: 30,
                    alignment: BadgeAlignment.bottomRight),
                textSpan: TextSpan(
                    text: 'W',
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                labelInsets: LabelInsets(baselineShift: 3, start: 1),
              ),
            )
          : events[0].activity == 'Business'
              ? Container(
                  margin: EdgeInsets.all(2),
                  foregroundDecoration: const RotatedCornerDecoration(
                    color: Colors.lightBlueAccent,
                    geometry: const BadgeGeometry(
                        width: 30,
                        height: 30,
                        alignment: BadgeAlignment.bottomRight),
                    textSpan: TextSpan(
                        text: 'B',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold)),
                    labelInsets: LabelInsets(baselineShift: 3, start: 1),
                  ),
                )
              : events[0].activity == 'Holiday/Vacation'
                  ? Container(
                      margin: EdgeInsets.all(2),
                      foregroundDecoration: const RotatedCornerDecoration(
                        color: Colors.red,
                        geometry: const BadgeGeometry(
                            width: 30,
                            height: 30,
                            alignment: BadgeAlignment.bottomRight),
                        textSpan: TextSpan(
                            text: 'H',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                        labelInsets: LabelInsets(baselineShift: 3, start: 1),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.all(2),
                      foregroundDecoration: const RotatedCornerDecoration(
                        color: Colors.yellow,
                        geometry: const BadgeGeometry(
                            width: 30,
                            height: 30,
                            alignment: BadgeAlignment.bottomRight),
                        textSpan: TextSpan(
                            text: 'T',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87)),
                        labelInsets: LabelInsets(baselineShift: 3, start: 1),
                      ),
                    ),
    );
  }

  Widget _buildHolidaysMarker(DateTime date, List<dynamic> events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 50.0,
      height: 30.0,
      child: Center(
        child:
            //    !_calendarController.isToday(date)?
            AutoSizeText(
          '${events[0].cityName}',
          maxLines: 1,
          minFontSize: 8,
          style: TextStyle(
            color:
                formatter.format(selectedDatebyUser) == formatter.format(date)
                    ? Colors.white
                    : AppConstants.APP_THEME_COLOR,
            fontWeight: FontWeight.bold,
            fontSize: 10.0,
          ),
        ),
      ),
    );
  }
}
