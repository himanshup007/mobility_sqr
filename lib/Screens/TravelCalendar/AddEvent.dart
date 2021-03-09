import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/Activities.dart';
import 'package:mobility_sqr/ModelClasses/CalenderResponseModel.dart';

import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/ModelClasses/eventPost.dart';
import 'package:mobility_sqr/Screens/Dashboard/AddAgenda.dart';
import 'package:mobility_sqr/Screens/TravelCalendar/customEventWidget.dart';
import 'package:mobility_sqr/Util/UtilClass.dart';
import 'package:mobility_sqr/Widgets/ActivitiesList.dart';
import 'package:mobility_sqr/Widgets/AlertForClassDialog_withAnimation.dart';
import 'package:mobility_sqr/Widgets/CityList.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';

import 'package:sizer/sizer.dart';

class AddEvent extends StatefulWidget {

  CalendarEvent event= CalendarEvent();
  AddEvent({event}){
    this.event=event;
  }
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  eventPost _postjson = eventPost();
  ScrollController _controller = ScrollController();
  ApiProvider _apiProvider = ApiProvider();
  List<String> _Countrylist;
  List<CountryModel> _CountrylistModel;
  List<CountryModel> _citylistModel = List<CountryModel>();
  Country selCountry;
  CountryModel _selectedValue;
  CountryModel _selectedCity;
  Activity _selectedActivity;
  TokenGetter mprefs = TokenGetter();
  bool showloader = true;
  Activities activitylist;

  String empCode = "";

  int eventID=null;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  readActivities() async {
    activitylist = await mprefs.readActivites();
    UserInfo info = await mprefs.readUserInfo() ?? null;
    try {
      if (info != null) {
        this.setState(() {
          empCode = info.data.empCode;
          activitylist = activitylist;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  EditReq(CalendarEvent event){
    if(event!=null){


     eventPost tempEvent=eventPost(empCode: event.empCode,fromDate: event.fromDate,toDate: event.toDate,countryCode:event.countryCode
     ,countryName: event.countryName,cityCode: event.cityCode,cityName: event.cityName,activity: event.activity);

      this.setState(() {
        _postjson=tempEvent;
        eventID=event.id;
      });

    }

  }

  @override
  void initState() {
    super.initState();
    EditReq(widget.event);
    readActivities();
    _apiProvider
        .getCountrylist(countryId: "")
        .then((value) => CountrySetter(value))
        .catchError((onError) => errorHandler(onError));
  }

  CountrySetter(value) {
    this.setState(() {
      _Countrylist = getShortName(value);
      _CountrylistModel = value.data;
      showloader = false;
    });
  }

  errorHandler(onError) {
    // showDefaultSnackbar(context, onError.toString());
    this.setState(() {
      showloader = false;
    });
  }

  getShortName(CountryListModel value) {
    List<String> myCountryCodes = List<String>();

    for (int i = 0; i < value.data.length; i++) {
      myCountryCodes.add(value.data[i].sortname);
    }

    return myCountryCodes;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Add Event",
          style: TextStyle(color: AppConstants.TEXT_BACKGROUND_COLOR),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _controller,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  CustomEventWidget(getDepartureEventFormat(_postjson.fromDate),
                      "From", Icons.calendar_today, context, onTap: () {
                    selectDate(
                        context,
                        DateTime(2010),
                        DateTime(2100),
                        _postjson.fromDate == null
                            ? DateTime.now()
                            : DateTime.parse(_postjson.fromDate),
                        datevalue: (selDate) {
                      this.setState(() {
                        _postjson.fromDate = selDate;
                      });

                      if (_postjson.toDate != null &&
                          DateTime.parse(_postjson.toDate)
                                  .difference(DateTime.parse(selDate))
                                  .inDays <
                              0) {
                        this.setState(() {
                          _postjson.toDate = selDate;
                        });
                      }
                    });
                  }),
                  CustomEventWidget(getDepartureEventFormat(_postjson.toDate),
                      "To", Icons.calendar_today, context, onTap: () {
                    selectDate(
                        context,
                        _postjson.fromDate == null
                            ? DateTime.now()
                            : DateTime.parse(_postjson.fromDate),
                        DateTime(2100),
                        _postjson.toDate == null
                            ? DateTime.parse(_postjson.fromDate)
                            : DateTime.parse(_postjson.toDate),
                        datevalue: (selDate) {
                      this.setState(() {
                        _postjson.toDate = selDate;
                      });
                    });
                  }),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: selCountry != null
                            ? Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                margin: EdgeInsets.only(bottom: 20),
                                child: CountryPickerUtils.getDefaultFlagImage(
                                    selCountry))
                            : Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                margin: EdgeInsets.only(bottom: 20),
                                child: Icon(Icons.flag),
                              ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 10,
                        child: CustomEventWidget(
                            _postjson.countryName,
                            "Select Country",
                            Icons.arrow_drop_down_sharp,
                            context, onTap: () {
                          openCustomCountryPickerDialog(context,
                              callback: (value) {
                            _selectedValue = fetchCountryData(
                                value.isoCode, _CountrylistModel);
                            this.setState(() {
                              selCountry = value;
                              _postjson.countryName = value.name;
                              _postjson.countryCode=_selectedValue.id.toString();
                              showloader = true;
                            });
                            _apiProvider
                                .getCitylist(
                                    countryId: _selectedValue.countryId)
                                .then((value) => this.setState(() {
                                      _citylistModel = value.data;
                                      showloader = false;
                                    }))
                                .catchError((onError) => this.setState(() {
                                      showloader = false;
                                    }));
                          }, list: _Countrylist != null ? _Countrylist : "");
                        }),
                      ),
                    ],
                  ),
                  CustomEventWidget(
                      _postjson.cityName,
                      'State/Country/Province',
                      Icons.arrow_drop_down_sharp,
                      context, onTap: () {
                    showCustomDialogCityClass(
                        context,
                        CityList(
                          _citylistModel,
                          onchange: (cityModel) {
                            this.setState(() {
                              _selectedCity = cityModel;
                              _postjson.cityName = cityModel.name;
                              _postjson.cityCode=cityModel.id.toString();
                            });
                          },
                          onclose: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        ));
                  }),
                  CustomEventWidget(_postjson.activity, 'Select Activities',
                      Icons.arrow_drop_down_sharp, context, onTap: () {
                    showCustomDialogCityClass(
                        context,
                        ActivitiesList(
                          activitylist.data,
                          onchange: (Activity) {
                            this.setState(() {
                              _selectedActivity = Activity;
                              _postjson.activity = Activity.activityName;
                            });
                          },
                          onclose: () {

                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        ));
                  }),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: AppConstants.APP_THEME_COLOR,
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () async {

                          reqJsonBuild();
                        }),
                  )
                ],
              ),
            ),
          ),
          showMobilityLoader(showloader, Colors.black26)
        ],
      ),
    );
  }

  reqJsonBuild() {

    _postjson.empCode = empCode;

    if(_postjson.empCode!=null&&_postjson.cityCode!=null&&_postjson.fromDate!=null&&_postjson.toDate!=null&&_postjson.activity!=null){

      if(eventID!=null){
        _apiProvider.post_Calender_Event(_postjson).then((value) =>  Navigator.pop(context, value));
      }else{
        _apiProvider.update_Calendar_Event(_postjson,eventID).then((value) => Navigator.pop(context, value));
      }




    }
    else{
      eventSnackbar( _scaffoldKey.currentState, "Please fill the Mandatory Fields");
    }

  }
}

fetchCountryData(String Isocode, List<CountryModel> countrylist) {
  for (int i = 0; i < countrylist.length; i++) {
    if (Isocode.trim() == countrylist[i].sortname.trim()) {
      return countrylist[i];
    }
  }
}
