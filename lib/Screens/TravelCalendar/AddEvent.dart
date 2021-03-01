import 'package:flutter/material.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';
import 'package:mobility_sqr/ModelClasses/eventPost.dart';
import 'package:mobility_sqr/Screens/Dashboard/AddAgenda.dart';
import 'package:mobility_sqr/Screens/TravelCalendar/customEventWidget.dart';
import 'package:mobility_sqr/Util/UtilClass.dart';
import 'package:mobility_sqr/Widgets/AlertForClassDialog_withAnimation.dart';
import 'package:mobility_sqr/Widgets/CityList.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';

import 'package:sizer/sizer.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  eventPost _postjson = eventPost();
  ScrollController _controller = ScrollController();
  ApiProvider _apiProvider = ApiProvider();
  List<String> _Countrylist;
  List<CountryModel> _CountrylistModel;
  List<CountryModel> _citylistModel=List<CountryModel>();

  CountryModel _selectedValue;

  bool showloader = true;

  @override
  void initState() {
    super.initState();

    _apiProvider
        .getCountrylist(countryId:"")
        .then((value) => CountrySetter(value))
        .catchError((onError) => errorHandler(onError));
  }

  CountrySetter(value) {
    this.setState(() {
      _Countrylist = getShortName(value);
      _CountrylistModel=value.data;
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
                        DateTime.now(),
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
                  CustomEventWidget(_postjson.countryName, "Select Country",
                      Icons.arrow_drop_down_sharp, context, onTap: () {
                    openCustomCountryPickerDialog(context, callback: (value) {
                      _selectedValue=fetchCountryData(value.isoCode,_CountrylistModel);
                      this.setState(() {
                        _postjson.countryName = value.name;
                        showloader=true;
                      });
                      _apiProvider
                          .getCitylist(countryId:_selectedValue.countryId)
                          .then((value) => this.setState(() {
                        _citylistModel=value.data;
                        showloader=false;
                          }))
                          .catchError((onError) => this.setState(() {
                            showloader=false;
                          }));

                    }, list: _Countrylist != null ? _Countrylist : "");
                  }),
                  CustomEventWidget(
                      _postjson.cityName,
                      'State/Country/Province',
                      Icons.arrow_drop_down_sharp,
                      context,
                      onTap: () {

                        showCustomDialogClass(
                            context,
                            CityList(
                             _citylistModel,
                              onchange: (text) {
                                Navigator.of(context,
                                    rootNavigator: true)
                                    .pop();
                              },
                              onclose: () {
                                Navigator.of(context,
                                    rootNavigator: true)
                                    .pop();
                              },
                            ));
                      }),
                  CustomEventWidget(_postjson.activity, 'Select Activities',
                      Icons.arrow_drop_down_sharp, context,
                      onTap: () {}),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: AppConstants.APP_THEME_COLOR,
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {}),
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
}

fetchCountryData(String Isocode, List<CountryModel> countrylist) {

  for(int i=0;i<countrylist.length;i++){
    if(Isocode.trim()==countrylist[i].sortname.trim()){

      return countrylist[i];
    }
  }

}
