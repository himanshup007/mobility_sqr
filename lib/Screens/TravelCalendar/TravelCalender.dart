import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/CustomLibrary/Calender/lib/table_calendar.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

import 'package:sizer/sizer.dart';

class TravelCalender extends StatefulWidget {
  TravelCalender({Key key}) : super(key: key);


  @override
  _TravelCalenderState createState() => _TravelCalenderState();
}

class _TravelCalenderState extends State<TravelCalender> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

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

    for(int i=0;i<10;i++){


    }


    _events = {
     DateTime.now().subtract(Duration(days: 1)):['ewds'],
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
        title: Text("Travel Calender",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[

           _buildTableCalendarWithBuilders(),

          const SizedBox(height: 8.0),
     //     Expanded(child: _buildEventList()),
        Container(
          height: 200,
          child: DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.3,
              maxChildSize: 0.8,
              builder: (BuildContext context, myscrollController) {
                return Container(

                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red[500],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                    child:

                        ListView.builder(
                          controller: myscrollController,
                          itemCount: _selectedEvents.length,
                          itemBuilder: (BuildContext context, int index) {
                            return
                                index==0?Column(
                                  children: [
                                    Container(
                                       width:100.0.w,
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.red[500],
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: Colors.red[500]
                                        ),
                                        child: Text("Events")),
                                    ListTile(
                                        title: Text(
                                          '${_selectedEvents[index]}',
                                          style: TextStyle(color: Colors.black54),
                                        )
                                    ),
                                  ],
                                ):
                                ListTile(
                                    title: Text(
                                      '${_selectedEvents[index]}',
                                      style: TextStyle(color: Colors.black54),
                                    )
                                )
                            ;

                          },


                    ),
                );
              }
                ),
        ),
        ],
      ),
      floatingActionButton:  FloatingActionButton(
        hoverColor: Colors.black,
        elevation: 10,
        onPressed: () {
          Navigator.pushNamed(context, '/AddEvent');
        },
        backgroundColor: AppConstants.APP_THEME_COLOR,
        child: Icon(Icons.add,),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(

      calendarController: _calendarController,
      events: _events,

      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,

      calendarStyle: CalendarStyle(
        selectedColor: AppConstants.APP_THEME_COLOR,
        todayColor: Colors.purpleAccent,
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,


      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
      
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      rowHeight: MediaQuery.of(context).size.height/8,

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
        titleTextStyle: TextStyle(color: AppConstants.APP_THEME_COLOR,fontSize: 20,fontWeight: FontWeight.w700),
        decoration: BoxDecoration(

        ),


        leftChevronMargin: EdgeInsets.only(left: 60),
       rightChevronMargin: EdgeInsets.only(right: 60),
        leftChevronIcon: Icon(
          Icons.arrow_back_ios,color: AppConstants.APP_THEME_COLOR,
        ),rightChevronIcon:Icon(
        Icons.arrow_forward_ios,color: AppConstants.APP_THEME_COLOR,
      ) ,
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),

      builders: CalendarBuilders(


        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              decoration:  BoxDecoration(
                  border: Border.all(color: Colors.black26,width: .5)
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle().copyWith(fontSize: 16.0),
                ),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(

            decoration:  BoxDecoration(
                border: Border.all(color: Colors.black26,width: .5)
            ),
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
                  child: _buildHolidaysMarker(date,events),
                ),);
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
      child:  Random().nextInt(100)%2==0?Container(
        foregroundDecoration:
        const RotatedCornerDecoration(
          color: Colors.green,
          geometry: const BadgeGeometry(width: 30, height: 30 , alignment: BadgeAlignment.bottomRight),
          textSpan: TextSpan(text: 'p', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          labelInsets: LabelInsets(baselineShift: 3, start: 1),
        ),
      ):Random().nextInt(100)%2==0?Container(
    foregroundDecoration:
    const RotatedCornerDecoration(
    color: Colors.lightBlueAccent,
    geometry: const BadgeGeometry(width: 30, height: 30 , alignment: BadgeAlignment.bottomRight),
    textSpan: TextSpan(text: 'W', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
    labelInsets: LabelInsets(baselineShift: 3, start: 1),
    ),
      ):Container(
        foregroundDecoration:
        const RotatedCornerDecoration(
          color: Colors.red,
          geometry: const BadgeGeometry(width: 30, height: 30 , alignment: BadgeAlignment.bottomRight),
          textSpan: TextSpan(text: 'H', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          labelInsets: LabelInsets(baselineShift: 3, start: 1),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker(DateTime date, List<dynamic> events) {
    return  AnimatedContainer(
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

            color: AppConstants.APP_THEME_COLOR,
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



  Widget _buildEventList() {
    return ListView(
      shrinkWrap: true,
      children: _selectedEvents
          .map((event) => Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin:
        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          title: Text(event.toString()),
          onTap: () => print('$event tapped!'),
        ),
      ))
          .toList(),
    );
  }
}