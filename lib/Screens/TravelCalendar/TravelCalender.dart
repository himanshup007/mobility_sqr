import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/CustomLibrary/Calender/lib/table_calendar.dart';
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
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  DateTime selectedDatebyUser= DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final Map<DateTime, List> _holidays = {
    DateTime(2020, 1, 1): ['New Year\'s Day'],
    DateTime(2020, 1, 6): ['Epiphany'],
    DateTime(2020, 2, 14): ['Valentine\'s Day'],
    DateTime(2020, 4, 21): ['Easter Sunday'],
    DateTime(2020, 4, 22): ['Easter Monday'],
  };

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      DateTime.now().subtract(Duration(days: 1)): ['ewds'],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };

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
      selectedDatebyUser=day;
      _selectedEvents = events;
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

        children: <Widget>[
          _buildTableCalendarWithBuilders(),

          _selectedEvents.length!=0?Align(
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
                        color: Colors.white,
                          border: Border.all(
                            color: Colors.red[500],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                            color: Colors.red[500]),
                                        child: Center(child: Text("Events",style: TextStyle(color: Colors.white,fontSize: 20),))),
                                    ListTile(
                                        title: Text(
                                      '${_selectedEvents[index]}',
                                      style: TextStyle(color: Colors.black54),
                                    )),
                                  ],
                                )
                              : ListTile(
                                  title: Text(
                                  '${_selectedEvents[index]}',
                                  style: TextStyle(color: Colors.black54),
                                ));
                        },
                      ),
                    );
                  }),
            ),
          ):SizedBox(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.black,
        elevation: 10,
        onPressed: () {
          Navigator.pushNamed(context, '/AddEvent');
        },
        backgroundColor: AppConstants.APP_THEME_COLOR,
        child: Icon(
          Icons.add,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
      ),
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
                    end: Alignment(1.0, 0.0,
                    ),
                  colors: [
                    Color(0xFF9f559a),
                    Color(0xFFb24698),
                    Color(0xFF641d75),

                  ],
                  transform: GradientRotation(math.pi / 4),

                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppConstants.APP_THEME_COLOR, width: .5)),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle().copyWith(fontSize: 16.0,color: Colors.white),
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

          // if (holidays.isNotEmpty) {
          //   children.add(
          //     Positioned(
          //       right: -2,
          //       top: -2,
          //       child: _buildHolidaysMarker(date,events),
          //     ),
          //   );
          // }

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
      child: Random().nextInt(100) % 2 == 0
          ? Container(
        margin: EdgeInsets.all(2),

              foregroundDecoration: const RotatedCornerDecoration(

                color: Colors.green,
                geometry: const BadgeGeometry(
                    width: 30,
                    height: 30,
                    alignment: BadgeAlignment.bottomRight),
                textSpan: TextSpan(
                    text: 'p',
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                labelInsets: LabelInsets(baselineShift: 3, start: 1),
              ),
            )
          : Random().nextInt(100) % 2 == 0
              ? Container(
        margin: EdgeInsets.all(2),
                  foregroundDecoration: const RotatedCornerDecoration(
                    color: Colors.lightBlueAccent,
                    geometry: const BadgeGeometry(
                        width: 30,
                        height: 30,
                        alignment: BadgeAlignment.bottomRight),
                    textSpan: TextSpan(
                        text: 'W',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold)),
                    labelInsets: LabelInsets(baselineShift: 3, start: 1),
                  ),
                )
              : Container(
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
        Text(
          '${"Noida,IN"}',
          maxLines: 3,
          style: TextStyle(
            color:   formatter.format(selectedDatebyUser)== formatter.format(date)?Colors.white:AppConstants.APP_THEME_COLOR,
            fontWeight: FontWeight.bold,
            fontSize: 10.0,
          ),
          //     ):Text(
          // '${"H"}',
          // style: TextStyle().copyWith(
          // color: AppConstants.APP_THEME_COLOR,
          // fontWeight: FontWeight.bold,
          // fontSize: 12.0,
          // ),
        ),
      ),
    );
  }


}
