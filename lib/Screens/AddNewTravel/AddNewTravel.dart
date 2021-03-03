import 'dart:async';

import 'package:circular_check_box/circular_check_box.dart';
import 'package:country_pickers/country.dart';

import 'package:country_pickers/utils/utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/AddReqPayLoad.dart';
import 'package:mobility_sqr/ModelClasses/DependentModel.dart';
import 'package:mobility_sqr/ModelClasses/GetVisaModelClass.dart';
import 'package:mobility_sqr/ModelClasses/Get_Post_Location.dart';
import 'package:mobility_sqr/ModelClasses/PerDiemModelClass.dart';
import 'package:mobility_sqr/ModelClasses/PurposeModelClass.dart';

import 'package:mobility_sqr/ModelClasses/SearchModelClass.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/ModelClasses/showHide.dart';
import 'package:mobility_sqr/Screens/Dashboard/AddAgenda.dart';
import 'package:mobility_sqr/Screens/PurposeScreen/purpose_bloc.dart';
import 'package:mobility_sqr/Util/UtilClass.dart';
import 'package:mobility_sqr/Widgets/AlertForClassDialog_withAnimation.dart';
import 'package:mobility_sqr/Widgets/CountryCodePicker.dart';
import 'package:mobility_sqr/Widgets/CustomColumnEditText.dart';
import 'package:mobility_sqr/Widgets/CustomSwitch.dart';
import 'package:mobility_sqr/Widgets/DashboardEditField.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:mobility_sqr/Widgets/RadioWidget.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';
import 'package:mobility_sqr/Widgets/bordered_box.dart';
import 'package:mobility_sqr/Widgets/textFieldProject.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';

class AddCity extends StatefulWidget {
  @override
  _AddCity createState() => _AddCity();
}

class _AddCity extends State<AddCity> {
  ItemScrollController itemScrollController = ItemScrollController();
  final Repository repository = Repository();
  PerDiemModel perDiemModel;
  List<dynamic> userdetails = [];
  List<TravelCity> traveldata = new List<TravelCity>();
  int index = 0;
  int id = 1;
  String radioButtonItem = 'ONE';

  SearchList toData = SearchList(countryName: "", airportName: "", city: "");
  bool accomodationBool = false;
  List<String> dialCode = new List<String>();
  var hostPhoneCountry = Country();
  var clientPhoneCountry = Country();
  TextEditingController ProjectTextController;
  TravelReqPayLoad req_data = TravelReqPayLoad();
  BuildContext purposecontext;
  UserInfo info;
  ApiProvider _appApiProvider = ApiProvider();
  final _listview_controller = ScrollController();
  var HomeCountryName;
  final todays_date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .toIso8601String();

  bool dependentEyeBtn = false;

  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final _userInfo = TokenGetter();

  @override
  void initState() {
    super.initState();

    ProjectTextController = new TextEditingController();
    getDialCode();
    initalizeValues();
    scrolltotop();
    getvalues();
  }

  getDialCode() async {
    var _TokenGetter = TokenGetter();
    dialCode = await _TokenGetter.readDialCode() ?? "";
  }

  getvalues() async {
    info = await _userInfo.readUserInfo() ?? null;
    HomeCountryName = info.data.home;
  }

  initalizeValues() {
    showHide data;
    req_data.isBillable = true;
    data = new showHide();
    data.name = "data${1}";
    data.hide = false;
    userdetails.add(data);

    TravelCity modelClass;
    modelClass = new TravelCity();
    modelClass.hide = index;
    modelClass.travellingCountryTo = "";
    modelClass.travellingCountry = "";
    modelClass.destinationCity = "";
    modelClass.sourceCity = "";
    modelClass.departureDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .toIso8601String();
    modelClass.returnDate = "";
    modelClass.isClientLocation = false.toString();
    modelClass.accmodationStartDate = modelClass.departureDate;
    modelClass.clientNumberExt = 'Code';
    modelClass.hostPhoneExt = 'Code';
    modelClass.accmodationEndDate = "";
    modelClass.isClientLocation = false.toString();
    modelClass.isAccmodationRequired = false;
    modelClass.purposeList = null;

    modelClass.isDependent = false;
    traveldata.add(modelClass);
    req_data.homePhoneExt = 'Code';
    req_data.isLaptopRequired = false;
    req_data.haveLaptop = false;
    req_data.travelReqId = "";
    traveldata[index].dependentData = [];
  }

  manageColor(bool show) {
    if (show == false) {
      return AppConstants.APP_THEME_COLOR;
    } else {
      return Colors.grey;
    }
  }

  removeCityReq() {
    traveldata.removeAt(index);
    userdetails.removeAt(index);
    index = index - 1;

    itemScrollController.scrollTo(
        index: userdetails.length - 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic);
    for (int i = 0; i < userdetails.length; i++) {
      if (i == userdetails.length - 1) {
        userdetails[i].hide = false;
      } else {
        userdetails[i].hide = true;
      }
    }

    this.setState(() {
      userdetails = userdetails;
      traveldata = traveldata;
    });
    positionsView();
  }

  AddNewReq() {
    showHide data;
    data = new showHide();
    data.name = "data${2}";
    data.hide = false;
    userdetails.add(data);
    TravelCity modelClass;

    modelClass = new TravelCity();
    modelClass.travellingCountryTo = "";
    modelClass.travellingCountry = "";
    modelClass.destinationCity = "";
    modelClass.sourceCity = "";
    modelClass.hide = index;
    modelClass.departureDate = traveldata[index - 1].returnDate == ""
        ? traveldata[index-1].departureDate
        : traveldata[index - 1].returnDate;

    if (traveldata.length >= 2) {
      modelClass.departureDate = traveldata[index - 1].departureDate == null
          ? DateTime(
                  DateTime.now().year, DateTime.now().month, DateTime.now().day)
              .toIso8601String()
          : traveldata[index - 1].departureDate;
    }

    modelClass.returnDate = "";
    modelClass.accmodationStartDate = modelClass.departureDate;
    modelClass.accmodationEndDate = "";
    modelClass.isClientLocation = false.toString();
    modelClass.clientNumberExt = 'Code';
    modelClass.hostPhoneExt = 'Code';
    modelClass.isAccmodationRequired = false;
    modelClass.sourceCity = traveldata[index - 1].destinationCity;
    modelClass.travellingCountry = traveldata[index - 1].travellingCountryTo;
    modelClass.isDependent = false;
    modelClass.dependentData = [];
    req_data.homePhoneExt = 'Code';
    req_data.isLaptopRequired = false;
    req_data.haveLaptop = false;
    for (int i = 0; i < userdetails.length; i++) {
      if (i == index) {
        userdetails[i].hide = false;
      } else {
        userdetails[i].hide = true;
      }
    }

    setState(() {
      userdetails = userdetails;
      traveldata.add(modelClass);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      itemScrollController.scrollTo(
          index: index,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic);
    });
  }

  scrolltotop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_listview_controller.hasClients) {
        Timer(
            Duration(milliseconds: 1),
            () => _listview_controller.animateTo(
                  _listview_controller.position.maxScrollExtent,
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                ));
      }
    });
  }

  scrolltobottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_listview_controller.hasClients) {
        Timer(
            Duration(milliseconds: 1),
            () => _listview_controller.animateTo(
                  _listview_controller.position.minScrollExtent,
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        titleSpacing: 0.0,
        title: Hero(
          tag:"travel-req",
          child: Material(
            child: Text(
              "New Request",
              style: TextStyle(
                  color: AppConstants.TEXT_BACKGROUND_COLOR,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ),
        actions: [GetNotificationIcon()],
        centerTitle: true,
        iconTheme: IconThemeData(color: AppConstants.TEXT_BACKGROUND_COLOR),
      ),
      backgroundColor: Colors.white,
      body: Builder(
        builder: (ctx) => Container(
          margin: EdgeInsets.only(top:10),
          height: 100.0.h,
          width: 100.0.w,
          child: ListView(
            children: [
              Container(
                height: 82.0.h,
                width: 100.0.w,
                child: ListView(
                  children: [
                    Container(
                      height: 10.0.w,
                      width: 100.0.w,
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: GestureDetector(
                        onTap: () async {
                          dynamic project = await Navigator.pushNamed(
                              context, '/ProjectIdScreen');
                          req_data.project = project.pid;
                          req_data.projectName = project.projectName;
                          ProjectTextController.text =
                              project.projectName + "(" + project.pid + ")";
                        },
                        child: TextFormField(
                          controller: ProjectTextController,
                          maxLines: 1,
                          style: TextStyle(
                            color: AppConstants.TEXT_BACKGROUND_COLOR,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: "Project ID",
                              enabled: false,
                              suffixIcon: Icon(
                                Icons.search,
                                color: AppConstants.APP_THEME_COLOR,
                              ),
                              hintStyle: TextStyle(
                                  color: AppConstants.TEXT_BACKGROUND_COLOR,
                                  fontSize: 16),
                              labelStyle: TextStyle(
                                  color: AppConstants.APP_THEME_COLOR,
                                  fontSize: 18),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppConstants.APP_THEME_COLOR,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              contentPadding: EdgeInsets.all(2)),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: DashboardEditFieldHeader("Travel Type",
                                AppConstants.TEXT_BACKGROUND_COLOR),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: RadioBtn(
                                "Billable",
                                "Non-Billable",
                                returnBillableValue(req_data.isBillable),
                                "Billable",
                                billable: (value) {
                                  req_data.isBillable = value;

                                  //showDefaultSnackbar(context, value.toString() + "  ");
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      color: Colors.black12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          height: 3.0.h,
                          alignment: Alignment.centerLeft,
                          child: new ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  itemScrollController.scrollTo(
                                      index: index,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.easeInOutCubic);
                                  this.setState(() {
                                    for (int i = 0;
                                        i < userdetails.length;
                                        i++) {
                                      if (i == index) {
                                        userdetails[i].hide = false;
                                      } else {
                                        userdetails[i].hide = true;
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 4.0.h,
                                  margin: EdgeInsets.only(right: 3),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                      color:
                                          manageColor(userdetails[index].hide),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${index + 1}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: manageColor(
                                            userdetails[index].hide),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: userdetails.length,
                          ),
                        ),
                        Container(
                          height: 4.0.h,
                          width: 30.0.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              PopupMenuButton<String>(
                                icon: ImageIcon(
                                  AssetImage('assets/images/menu_vertical.png'),
                                  color: AppConstants.APP_THEME_COLOR,
                                ),
                                onSelected: (string) {
                                  if (string == 'Add City') {
                                    if (req_data.projectName == null) {
                                      showDialog(
                                          context: context,
                                          builder: (context) => new AlertDialog(
                                                title: new Text("Mobility"),
                                                content: new Text(
                                                    "Please select Project Name"),
                                              ));

                                      itemScrollController.scrollTo(
                                          index: userdetails.length - 1,
                                          duration: Duration(milliseconds: 400),
                                          curve: Curves.easeInOutCubic);
                                      for (int i = 0;
                                          i < userdetails.length;
                                          i++) {
                                        if (i == userdetails.length - 1) {
                                          userdetails[i].hide = false;
                                        } else {
                                          userdetails[i].hide = true;
                                        }
                                      }
                                      this.setState(() {
                                        userdetails = userdetails;
                                      });
                                    } else {
                                      this.setState(() {
                                        index = index + 1;
                                      });
                                      AddNewReq();
                                      BlocProvider.of<PurposeBloc>(
                                              purposecontext)
                                          .add(ResetBloc());
                                    }
                                  } else if (string == 'Delete') {
                                    removeCityReq();
                                  } else {}
                                },
                                itemBuilder: (BuildContext context) {
                                  return {'Add City', 'Delete'}
                                      .map((String choice) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Column(
                                        children: [
                                          Text(
                                            choice,
                                            style: TextStyle(
                                                color: AppConstants
                                                    .TEXT_BACKGROUND_COLOR),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100.0.w,
                      height: 2,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      color: AppConstants.APP_THEME_COLOR,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 15, top: 5, bottom: 5),
                      height: 63.0.h,
                      width: 100.0.w,
                      child: ScrollablePositionedList.builder(
                        itemScrollController: itemScrollController,
                        scrollDirection: Axis.horizontal,
                        itemPositionsListener: itemPositionsListener,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 92.0.w,
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              child: SingleChildScrollView(
                                controller: _listview_controller,
                                reverse: true,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: CustomColumnEditText(
                                              "Start location",
                                              traveldata[index].sourceCity,
                                              traveldata[index]
                                                  .travellingCountry,
                                              "From",
                                              1,
                                              false,
                                              onTap: () async {
                                                dynamic fromplace =
                                                    await Navigator.pushNamed(
                                                        context,
                                                        '/SearchPlace');
                                                if (fromplace != null) {
                                                  SearchList from = fromplace;
                                                  if (traveldata[index]
                                                              .destinationCity !=
                                                          null &&
                                                      traveldata[index]
                                                              .destinationCity !=
                                                          from.city) {
                                                    this.setState(() {
                                                      traveldata[index]
                                                              .sourceCity =
                                                          fromplace.city;
                                                      traveldata[index]
                                                              .travellingCountry =
                                                          fromplace.countryName;
                                                    });
                                                  } else {
                                                    showDefaultSnackbar(context,
                                                        "From and To airports can not be the same");
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: BlocProvider(
                                            create: (context) =>
                                                PurposeBloc(repository),
                                            child: BlocBuilder<PurposeBloc,
                                                PurposeState>(
                                              builder: (context, state) {
                                                purposecontext = context;

                                                if (state is PurposeLoaded) {
                                                  traveldata[this.index]
                                                          .purposeList =
                                                      state.purposelist.data;
                                                }

                                                return Container(
                                                  child: CustomColumnEditText(
                                                    "Destination ",
                                                    traveldata[index]
                                                        .destinationCity,
                                                    traveldata[index]
                                                        .travellingCountryTo,
                                                    "To",
                                                    1,
                                                    false,
                                                    onTap: () async {
                                                      traveldata[index]
                                                              .postLocationData =
                                                          null;
                                                      var data = await Navigator
                                                          .pushNamed(context,
                                                              '/SearchPlace');

                                                      if (data != null) {
                                                        SearchList
                                                            toCountryData =
                                                            data;
                                                        ;
                                                        if (traveldata[index]
                                                                .sourceCity !=
                                                            toCountryData
                                                                .city) {
                                                          this.setState(() {
                                                            traveldata[index]
                                                                .travelPurpose = '';
                                                            traveldata[index]
                                                                    .visaNumber =
                                                                null;
                                                            traveldata[index]
                                                                    .toCountryData =
                                                                data;

                                                            traveldata[index]
                                                                    .destinationCity =
                                                                traveldata[
                                                                        index]
                                                                    .toCountryData
                                                                    .city;
                                                            traveldata[index]
                                                                    .travellingCountryTo =
                                                                traveldata[
                                                                        index]
                                                                    .toCountryData
                                                                    .countryName;
                                                            traveldata[index]
                                                                    .currentCountryCode =
                                                                traveldata[
                                                                        index]
                                                                    .toCountryData
                                                                    .country;
                                                          });

                                                          BlocProvider.of<
                                                                      PurposeBloc>(
                                                                  context)
                                                              .add(FetchPurposelist(
                                                                  toData
                                                                      .iataCode));
                                                          _appApiProvider.GetPostLocation(
                                                                  traveldata[
                                                                          index]
                                                                      .toCountryData
                                                                      .countryName)
                                                              .then((value) =>
                                                                  this.setState(
                                                                      () {
                                                                    traveldata[index]
                                                                            .postLocationList =
                                                                        value
                                                                            .data;
                                                                  }));

                                                          _appApiProvider.GetDependentList(
                                                                  traveldata[
                                                                          index]
                                                                      .toCountryData
                                                                      .countryName)
                                                              .then((value) =>
                                                                  this.setState(
                                                                      () {
                                                                    traveldata[index]
                                                                            .myDependentList =
                                                                        value;
                                                                  }));

                                                          _appApiProvider.GetPerDiem(
                                                                  traveldata[
                                                                          index]
                                                                      .toCountryData
                                                                      .countryName)
                                                              .then((value) =>
                                                                  SaveCostData(
                                                                      value));
                                                        } else {
                                                          showDefaultSnackbar(
                                                              context,
                                                              "From and To airports can not be the same");
                                                        }
                                                      }
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: CustomColumnEditText(
                                              "Select Date",
                                              "${getDepartureDate(traveldata[index].departureDate)}",
                                              "${getDepatureDay(traveldata[index].departureDate)}",
                                              "Departure",
                                              2,
                                              false, onTap: () {
                                            if (index == 0) {
                                              selectDate(
                                                  context,
                                                  DateTime.parse(todays_date),
                                                  DateTime(2100),
                                                  DateTime.parse(
                                                      traveldata[index]
                                                          .departureDate),
                                                  datevalue: (data) {
                                                this.setState(() {
                                                  traveldata[index]
                                                      .departureDate = data;
                                                });

                                                try {
                                                  final differenceInTravelDates =
                                                      DateTime.parse(traveldata[
                                                                  index + 1]
                                                              .departureDate)
                                                          .difference(DateTime
                                                              .parse(traveldata[
                                                                      index]
                                                                  .departureDate))
                                                          .inDays;

                                                  if (differenceInTravelDates <
                                                      0) {
                                                    for (int i = index;
                                                        i < traveldata.length;
                                                        i++) {
                                                      if (i + 1 !=
                                                          traveldata.length) {
                                                        this.setState(() {
                                                          traveldata[i + 1]
                                                                  .departureDate =
                                                              traveldata[i]
                                                                  .departureDate;
                                                        });
                                                      }
                                                    }
                                                  }
                                                } catch (e) {}
                                                try {
                                                  final diffrencedepature =
                                                      DateTime.parse(
                                                              traveldata[index]
                                                                  .returnDate)
                                                          .difference(DateTime
                                                              .parse(traveldata[
                                                                      index]
                                                                  .departureDate))
                                                          .inDays;

                                                  if (diffrencedepature < 0) {
                                                    this.setState(() {
                                                      traveldata[index]
                                                              .returnDate =
                                                          traveldata[index]
                                                              .departureDate;
                                                    });
                                                  }
                                                } catch (e) {}
                                                // try {
                                                //   final differenceInAccomodation =
                                                //       DateTime.parse(traveldata[
                                                //                   index]
                                                //               .accmodationStartDate)
                                                //           .difference(DateTime
                                                //               .parse(traveldata[
                                                //                       index]
                                                //                   .departureDate))
                                                //           .inDays;
                                                //
                                                //   if (differenceInAccomodation <
                                                //       0) {
                                                //     this.setState(() {
                                                //       traveldata[index]
                                                //               .accmodationStartDate =
                                                //           traveldata[index]
                                                //               .returnDate;
                                                //     });
                                                //   }
                                                // } catch (e) {}

                                                try {
                                                  final differenceInAccomodation =
                                                      DateTime.parse(traveldata[
                                                                  index]
                                                              .accmodationStartDate)
                                                          .difference(DateTime
                                                              .parse(traveldata[
                                                                      index]
                                                                  .departureDate))
                                                          .inDays;

                                                  var myvalue =
                                                      traveldata[index]
                                                          .departureDate;
                                                  if (differenceInAccomodation <
                                                      0) {
                                                    for (int i = index;
                                                        i < traveldata.length;
                                                        i++) {
                                                      this.setState(() {
                                                        traveldata[i]
                                                                .accmodationStartDate =
                                                            myvalue;
                                                        traveldata[i]
                                                                .accmodationEndDate =
                                                            myvalue;
                                                      });
                                                    }
                                                  }
                                                } catch (e) {}
                                              });
                                            } else {
                                              selectDate(
                                                  context,
                                                  DateTime.parse(
                                                      traveldata[index - 1]
                                                          .departureDate),
                                                  DateTime(2100),
                                                  DateTime.parse(
                                                      traveldata[index]
                                                          .departureDate),
                                                  datevalue: (data) {
                                                this.setState(() {
                                                  traveldata[index]
                                                      .departureDate = data;
                                                });
                                                try {
                                                  final differenceInTravelDates =
                                                      DateTime.parse(traveldata[
                                                                  index + 1]
                                                              .departureDate)
                                                          .difference(DateTime
                                                              .parse(traveldata[
                                                                      index]
                                                                  .departureDate))
                                                          .inDays;

                                                  if (differenceInTravelDates <
                                                      0) {
                                                    for (int i = index;
                                                        i < traveldata.length;
                                                        i++) {
                                                      if (i + 1 !=
                                                          traveldata.length) {
                                                        this.setState(() {
                                                          traveldata[i + 1]
                                                                  .departureDate =
                                                              traveldata[i]
                                                                  .departureDate;
                                                        });
                                                      }
                                                    }
                                                  }
                                                } catch (e) {}

                                                try {
                                                  final differenceInAccomodation =
                                                      DateTime.parse(traveldata[
                                                                  index]
                                                              .accmodationStartDate)
                                                          .difference(DateTime
                                                              .parse(traveldata[
                                                                      index]
                                                                  .departureDate))
                                                          .inDays;

                                                  var myvalue =
                                                      traveldata[index]
                                                          .departureDate;
                                                  if (differenceInAccomodation <
                                                      0) {
                                                    for (int i = index;
                                                        i < traveldata.length;
                                                        i++) {
                                                      this.setState(() {
                                                        traveldata[i]
                                                                .accmodationStartDate =
                                                            myvalue;
                                                        traveldata[i]
                                                                .accmodationEndDate =
                                                            myvalue;
                                                      });
                                                    }
                                                  }
                                                } catch (e) {}
                                              });
                                            }
                                          }),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        getdepatureview(traveldata[index].travellingCountryTo)
                                            ? Expanded(
                                                flex: 1,
                                                child: CustomColumnEditText(
                                                  "Select Date",
                                                  "${getDepartureDate(traveldata[index].returnDate.toString())}",
                                                  "${getDepatureDay(traveldata[index].returnDate.toString())}",
                                                  "Return",
                                                  2,
                                                  false,
                                                  onTap: () {
                                                    selectDate(
                                                        context,
                                                        DateTime.parse(
                                                            traveldata[index]
                                                                .departureDate),
                                                        DateTime(2100),
                                                        traveldata[index]
                                                                    .returnDate ==
                                                                ""
                                                            ? DateTime.parse(
                                                                traveldata[
                                                                        index]
                                                                    .departureDate)
                                                            : DateTime.parse(
                                                                traveldata[
                                                                        index]
                                                                    .returnDate),
                                                        datevalue: (date) {
                                                      this.setState(() {
                                                        traveldata[index]
                                                            .returnDate = date;
                                                      });
                                                    });
                                                  },
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),

                                    HomeCountryName!=traveldata[index].travellingCountryTo?Container(
                                      child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        margin:
                                                        EdgeInsets.only(bottom: 5),
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors.grey,
                                                                blurRadius: 10.0,
                                                              ),
                                                            ],
                                                            borderRadius:
                                                            BorderRadius.all(
                                                              Radius.circular(5),
                                                            ),
                                                            color: AppConstants
                                                                .APP_THEME_COLOR),
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            var travelList =
                                                                traveldata[index]
                                                                    .purposeList;
                                                            if (travelList != null) {
                                                              dynamic purposelist =
                                                              await Navigator
                                                                  .pushNamed(
                                                                  context,
                                                                  '/PurposeScreen',
                                                                  arguments: {
                                                                    "list": travelList
                                                                  });
                                                              print(purposelist);

                                                              bool iswork =
                                                              Check_visa_category(
                                                                  purposelist);

                                                              if (iswork) {
                                                                this.setState(() {
                                                                  traveldata[index]
                                                                      .travelPurpose =
                                                                  'Work';
                                                                });
                                                              } else {
                                                                this.setState(() {
                                                                  traveldata[index]
                                                                      .travelPurpose =
                                                                  'Business';
                                                                  traveldata[index]
                                                                      .visaNumber =
                                                                  null;
                                                                });
                                                              }

                                                              _appApiProvider.GetTravelVisa(
                                                                  traveldata[index]
                                                                      .travelPurpose,
                                                                  traveldata[index]
                                                                      .toCountryData
                                                                      .countryName)
                                                                  .then((value) =>
                                                                  SetValueTravelReq(
                                                                      value));
                                                            } else {
                                                              showDefaultSnackbar(
                                                                  context,
                                                                  "Please choose the Destination point");
                                                            }
                                                          },
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets.all(
                                                                6.0),
                                                            child: Text(
                                                              "Purpose of Travel",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight:
                                                                  FontWeight.w500),
                                                            ),
                                                          ),
                                                        )),
                                                    traveldata[index].travelPurpose !=
                                                        null
                                                        ? Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 8),
                                                      child: Text(
                                                        "${traveldata[index].travelPurpose}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                            FontWeight.w700,
                                                            fontSize: 18),
                                                      ),
                                                    )
                                                        : SizedBox(),
                                                  ],
                                                ),
                                                traveldata[index].visaNumber != null
                                                    ? customBorderBox("Visa", false,
                                                    Icons.remove_red_eye,
                                                    ontouch: () {
                                                      showCustomDialogClass(
                                                        context,
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                          ),
                                                          margin: EdgeInsets.only(
                                                              left: 10, bottom: 5),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 30,
                                                              ),
                                                              Align(
                                                                child: Text(
                                                                  "Visa Details",
                                                                  style: TextStyle(
                                                                      fontSize: 30,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                      color: AppConstants
                                                                          .APP_THEME_COLOR),
                                                                ),
                                                                alignment:
                                                                Alignment.center,
                                                              ),
                                                              SizedBox(
                                                                height: 30,
                                                              ),
                                                              Align(
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Applicable visa:  ",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                          fontSize:
                                                                          25,
                                                                          color: Colors
                                                                              .black54),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                    ),
                                                                    Text(
                                                                      "${traveldata[index].travelPurpose}",
                                                                      style:
                                                                      TextStyle(
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                        fontSize: 25,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                    ),
                                                                  ],
                                                                ),
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Align(
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Number:  ",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                          fontSize:
                                                                          25,
                                                                          color: Colors
                                                                              .black54),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                    ),
                                                                    Text(
                                                                      "${traveldata[index].visaNumber}",
                                                                      style:
                                                                      TextStyle(
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                        fontSize: 25,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                    ),
                                                                  ],
                                                                ),
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Align(
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Expiry Date:  ",
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                          fontSize:
                                                                          25,
                                                                          color: Colors
                                                                              .black54),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                    ),
                                                                    Text(
                                                                      "${setFormattedDate(traveldata[index].visaExpiryDate)}",
                                                                      style:
                                                                      TextStyle(
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                        fontSize: 25,
                                                                      ),
                                                                      textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                    ),
                                                                  ],
                                                                ),
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                              ),
                                                              SizedBox(
                                                                height: 40,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                    10),
                                                                child: (Text(
                                                                  "${CheckVisaNote(traveldata, traveldata[index].visaExpiryDate, index)}",
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.red,
                                                                      fontSize: 18),
                                                                )),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    })
                                                    : SizedBox(),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2,
                                              width: 100.0.w,
                                              child: Container(
                                                color: AppConstants.APP_THEME_COLOR,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    "Add Details",
                                                    style: TextStyle(
                                                        color: AppConstants
                                                            .APP_THEME_COLOR,
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                  flex: 1,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin:
                                              EdgeInsets.only(top: 5, bottom: 10),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Do you need accomodation?",
                                                      style: TextStyle(fontSize: 15),
                                                    ),
                                                    flex: 13,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      margin: EdgeInsets.only(right: 4),
                                                      child: FlutterSwitch(
                                                        height: 25.0,
                                                        width: 20.0,
                                                        padding: 2.0,
                                                        toggleSize: 20.0,
                                                        borderRadius: 12.0,
                                                        inactiveColor: Colors.grey,
                                                        activeColor: AppConstants
                                                            .APP_THEME_COLOR,
                                                        value: traveldata[index]
                                                            .isAccmodationRequired,
                                                        onToggle: (value) {
                                                          scrolltobottom();
                                                          setState(() {
                                                            this.setState(() {
                                                              traveldata[index]
                                                                  .isAccmodationRequired =
                                                              !traveldata[index]
                                                                  .isAccmodationRequired;
                                                            });
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            traveldata[index].isAccmodationRequired
                                                ? Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: CustomColumnEditText(
                                                    "Select Date",
                                                    "${getDepartureDate(traveldata[index].accmodationStartDate)}",
                                                    "${getDepatureDay(traveldata[index].accmodationStartDate)}",
                                                    "Start Date",
                                                    2,
                                                    false,
                                                    onTap: () {
                                                      selectDate(
                                                          context,
                                                          DateTime.parse(
                                                              traveldata[index]
                                                                  .departureDate),
                                                          index == 0
                                                              ? DateTime.parse(
                                                              traveldata[index]
                                                                  .returnDate)
                                                              : accodomoationlastDateLogic(
                                                              index,
                                                              traveldata),
                                                          traveldata[index]
                                                              .accmodationStartDate ==
                                                              ""
                                                              ? DateTime.parse(
                                                              traveldata[index]
                                                                  .departureDate)
                                                              : DateTime.parse(
                                                              traveldata[index]
                                                                  .accmodationStartDate),
                                                          datevalue: (date) {
                                                            this.setState(() {
                                                              traveldata[index]
                                                                  .accmodationStartDate =
                                                                  date;
                                                            });
                                                          });
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: CustomColumnEditText(
                                                    "Select Date",
                                                    "${getDepartureDate(traveldata[index].accmodationEndDate)}",
                                                    "${getDepatureDay(traveldata[index].accmodationEndDate)}",
                                                    "End Date",
                                                    2,
                                                    false,
                                                    onTap: () {
                                                      selectDate(
                                                          context,
                                                          DateTime.parse(traveldata[
                                                          index]
                                                              .accmodationStartDate),
                                                          DateTime.parse(
                                                              accomodationLogic(
                                                                  traveldata,
                                                                  traveldata[index]
                                                                      .returnDate,
                                                                  index)),
                                                          traveldata[index]
                                                              .accmodationEndDate ==
                                                              ""
                                                              ? DateTime.parse(
                                                              traveldata[index]
                                                                  .accmodationStartDate)
                                                              : DateTime.parse(
                                                              traveldata[
                                                              index]
                                                                  .accmodationEndDate),
                                                          datevalue: (text) {
                                                            this.setState(() {
                                                              traveldata[index]
                                                                  .accmodationEndDate =
                                                                  text;
                                                            });
                                                          });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )
                                                : Container(
                                              width: 0,
                                              height: 0,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      "Host Contact",
                                                      style: TextStyle(
                                                          color: AppConstants
                                                              .APP_THEME_COLOR,
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w700),
                                                    ),
                                                  ),
                                                  flex: 4,
                                                ),
                                                check_tick_mark(
                                                    traveldata[index].agenda)
                                                    ? Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    height: 10,
                                                    child: CircularCheckBox(
                                                      value: true,
                                                      checkColor: Colors.white,
                                                      activeColor: Colors.green,
                                                      onChanged: (bool value) {},
                                                    ),
                                                  ),
                                                )
                                                    : Expanded(child: SizedBox()),
                                                Expanded(
                                                  child: customBorderBox(
                                                      "Agenda", false, Icons.add,
                                                      ontouch: () {
                                                        showCustomDialogClass(
                                                            context,
                                                            AddAgenda(
                                                              traveldata[index].agenda,
                                                              onchange: (text) {
                                                                this.setState(() {
                                                                  traveldata[index].agenda =
                                                                      text;
                                                                });
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
                                                  flex: 2,
                                                ),
                                              ],
                                            ),
                                            DashboardCustomEditField(
                                              "Enter Name",
                                              false,
                                              Icons.ac_unit,
                                              2,
                                              onChange: (text) {
                                                traveldata[index].hostHrName = text;
                                              },
                                            ),
                                            Container(
                                              height: 50,
                                              width: 100.0.w,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      margin: EdgeInsets.only(top: 5),
                                                      child: Row(
                                                        children: [
                                                          traveldata[index]
                                                              .hostPhoneExt ==
                                                              'Code'
                                                              ? Container(
                                                              child: Icon(Icons
                                                                  .arrow_drop_down))
                                                              : Container(
                                                            child: CountryPickerUtils
                                                                .getDefaultFlagImage(
                                                                hostPhoneCountry),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                openCountryPickerDialog(
                                                                    context,
                                                                    callback: (value) {
                                                                      this.setState(() {
                                                                        traveldata[index]
                                                                            .hostPhoneExt =
                                                                            "+" +
                                                                                value
                                                                                    .phoneCode;
                                                                        hostPhoneCountry =
                                                                            value;
                                                                      });
                                                                    }, dialCode: dialCode);
                                                              },
                                                              child: Container(
                                                                child: Align(
                                                                    alignment: Alignment
                                                                        .centerRight,
                                                                    child: FittedBox(
                                                                      fit: BoxFit
                                                                          .scaleDown,
                                                                      child: Text(
                                                                        traveldata[
                                                                        index]
                                                                            .hostPhoneExt,
                                                                        textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            16),
                                                                      ),
                                                                    )),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: DashboardCustomEditField(
                                                      "Enter Phone No",
                                                      false,
                                                      Icons.ac_unit,
                                                      1,
                                                      onChange: (text) {
                                                        traveldata[index].hostPhoneNo =
                                                            text;
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: DashboardEditFieldHeader(
                                                      "Travelling to",
                                                      AppConstants
                                                          .TEXT_BACKGROUND_COLOR),
                                                ),
                                                SizedBox(
                                                  width: 5.0.w,
                                                ),
                                                Container(
                                                  child: RadioBtn(
                                                    "Office location",
                                                    "Client location",
                                                    getValue(traveldata[index]
                                                        .isClientLocation),
                                                    "Office location",
                                                    billable: (value) {
                                                      this.setState(() {
                                                        traveldata[index]
                                                            .isClientLocation =
                                                            (!value).toString();
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            !getbool(traveldata[index].isClientLocation)
                                                ? Container(
                                              width: 90.0.w,
                                              height: 40,
                                              child: FormField<PostLocationData>(
                                                builder: (FormFieldState<
                                                    PostLocationData>
                                                state) {
                                                  return InputDecorator(
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                        EdgeInsets.zero,
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5.0))),
                                                    child:
                                                    DropdownButtonHideUnderline(
                                                      child: DropdownButton<
                                                          PostLocationData>(
                                                        hint: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(left: 10),
                                                          child: Text("Location"),
                                                        ),
                                                        value: traveldata[index]
                                                            .postLocationData,
                                                        isDense: true,
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            traveldata[index]
                                                                .postLocationData =
                                                                newValue;
                                                            traveldata[index]
                                                                .officeLocation =
                                                            "${newValue.locationName}";
                                                          });
                                                        },
                                                        items: traveldata[index]
                                                            .postLocationList !=
                                                            null
                                                            ? traveldata[index]
                                                            .postLocationList
                                                            .map(
                                                                (PostLocationData
                                                            value) {
                                                              return DropdownMenuItem<
                                                                  PostLocationData>(
                                                                value: value,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      left: 10),
                                                                  child: Text(value
                                                                      .locationName),
                                                                ),
                                                              );
                                                            }).toList()
                                                            : null,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                                : Container(
                                              child: Column(
                                                children: [
                                                  DashboardCustomEditField(
                                                    "Client Name",
                                                    false,
                                                    Icons.arrow_drop_down_sharp,
                                                    2,
                                                    onChange: (text) {
                                                      this.setState(() {
                                                        traveldata[index]
                                                            .clientName = text;
                                                      });
                                                    },
                                                  ),
                                                  DashboardCustomEditField(
                                                    "Client Address",
                                                    false,
                                                    Icons.arrow_drop_down_sharp,
                                                    2,
                                                    onChange: (text) {
                                                      this.setState(() {
                                                        traveldata[index]
                                                            .clientAddress = text;
                                                      });
                                                    },
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    width: 100.0.w,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            margin:
                                                            EdgeInsets.only(
                                                                top: 5),
                                                            child: Row(
                                                              children: [
                                                                traveldata[index]
                                                                    .clientNumberExt ==
                                                                    'Code'
                                                                    ? Container(
                                                                    child: Icon(
                                                                        Icons
                                                                            .arrow_drop_down))
                                                                    : Container(
                                                                  child: CountryPickerUtils
                                                                      .getDefaultFlagImage(
                                                                      clientPhoneCountry),
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      openCountryPickerDialog(
                                                                          context,
                                                                          callback:
                                                                              (value) {
                                                                            this.setState(
                                                                                    () {
                                                                                  traveldata[index].clientNumberExt =
                                                                                      "+" +
                                                                                          value.phoneCode;
                                                                                  clientPhoneCountry =
                                                                                      value;
                                                                                });
                                                                          },
                                                                          dialCode:
                                                                          dialCode);
                                                                    },
                                                                    child:
                                                                    Container(
                                                                      child: Align(
                                                                          alignment: Alignment.centerRight,
                                                                          child: FittedBox(
                                                                            fit: BoxFit
                                                                                .scaleDown,
                                                                            child:
                                                                            Text(
                                                                              traveldata[index].clientNumberExt,
                                                                              textAlign:
                                                                              TextAlign.center,
                                                                              style:
                                                                              TextStyle(fontSize: 16),
                                                                            ),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          flex: 4,
                                                          child:
                                                          DashboardCustomEditField(
                                                            "Enter Phone No",
                                                            false,
                                                            Icons.ac_unit,
                                                            1,
                                                            onChange: (text) {
                                                              this.setState(() {
                                                                traveldata[index]
                                                                    .clientNumber =
                                                                    text;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin:
                                              EdgeInsets.only(top: 5, bottom: 10),
                                              padding: EdgeInsets.all(5),
                                              child: traveldata[index].travelPurpose !=
                                                  null &&
                                                  traveldata[index].travelPurpose ==
                                                      "Work"
                                                  ? Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Travelling with dependent(s)?",
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () async {
                                                            var dependantList =
                                                                traveldata[index]
                                                                    .myDependentList;
                                                            if (checkSelectedDependents(
                                                                dependantList)) {
                                                              if (dependantList !=
                                                                  null) {
                                                                dynamic
                                                                Dependents =
                                                                await Navigator.pushNamed(
                                                                    context,
                                                                    '/Dependents',
                                                                    arguments: {
                                                                      "list":
                                                                      dependantList
                                                                    });
                                                                this.setState(() {
                                                                  traveldata[index]
                                                                      .isDependent =
                                                                      checkSelectedDependents(
                                                                          Dependents);
                                                                });
                                                              }
                                                            } else {}
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .remove_red_eye_outlined,
                                                            size: 25,
                                                            color: traveldata[index]
                                                                .myDependentList !=
                                                                null &&
                                                                checkSelectedDependents(
                                                                    traveldata[
                                                                    index]
                                                                        .myDependentList)
                                                                ? AppConstants
                                                                .APP_THEME_COLOR
                                                                : Colors.black12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    flex: 12,
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 4),
                                                      child: CustomFlutterSwitch(
                                                        height: 25.0,
                                                        width: 20.0,
                                                        padding: 2.0,
                                                        toggleSize: 20.0,
                                                        borderRadius: 12.0,
                                                        inactiveColor:
                                                        Colors.grey,
                                                        disabled: traveldata[
                                                        index]
                                                            .myDependentList ==
                                                            null ||
                                                            traveldata[index]
                                                                .travelPurpose ==
                                                                null ||
                                                            traveldata[index]
                                                                .travelPurpose
                                                                .toLowerCase() ==
                                                                "business"
                                                            ? true
                                                            : false,
                                                        activeColor: AppConstants
                                                            .APP_THEME_COLOR,
                                                        value: traveldata[index]
                                                            .isDependent,
                                                        ondisabled: (va) {
                                                          if (va) {
                                                            scrolltotop();
                                                            if (traveldata[index]
                                                                .travelPurpose ==
                                                                null) {
                                                              showDefaultSnackbar(
                                                                  context,
                                                                  "Please select  Purpose of Travel");
                                                            } else {
                                                              showDefaultSnackbar(
                                                                  context,
                                                                  "Please select destination Point");
                                                            }
                                                          }
                                                        },
                                                        onToggle: (value) async {
                                                          scrolltobottom();

                                                          this.setState(() {
                                                            traveldata[index]
                                                                .isDependent =
                                                            !traveldata[index]
                                                                .isDependent;
                                                          });

                                                          var dependantList =
                                                              traveldata[index]
                                                                  .myDependentList;

                                                          if (traveldata[index]
                                                              .isDependent) {
                                                            if (dependantList !=
                                                                null) {
                                                              dynamic Dependents =
                                                              await Navigator
                                                                  .pushNamed(
                                                                  context,
                                                                  '/Dependents',
                                                                  arguments: {
                                                                    "list":
                                                                    dependantList
                                                                  });

                                                              this.setState(() {
                                                                traveldata[index]
                                                                    .isDependent =
                                                                    checkSelectedDependents(
                                                                        Dependents);
                                                              });
                                                            }
                                                          } else {
                                                            traveldata[index]
                                                                .myDependentList =
                                                                resetSelectedDependents(
                                                                    traveldata[
                                                                    index]
                                                                        .myDependentList);
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                                  : SizedBox(),
                                            ),
                                          ],
                                      ),
                                    ):SizedBox(height: 35.0.h,),

                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: traveldata.length,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),
                height: 5.0.h,
                width: 100.0.w,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: AppConstants.APP_THEME_COLOR)),
                  onPressed: () async {
                    req_data.travelCity = traveldata;
                    if (Validator(req_data)) {
                      if (req_data != null) {
                        req_data.travelVisa = [];

                        req_data.travelVisa.addAll(
                            GenerateVisa(req_data, info, HomeCountryName));
                        CostValueSetter(req_data);
                        resetValue(req_data);
                        await Navigator.pushNamed(context, '/AddNewTravel2',
                            arguments: {
                              "list": req_data,
                              "perDiem": perDiemModel
                            });
                      }
                    } else {
                      showDefaultSnackbar(
                          ctx, "Please fill the Mandatory fields");
                    }
                  },
                  color: AppConstants.APP_THEME_COLOR,
                  textColor: Colors.white,
                  child: Text("Save & Next".toUpperCase(),
                      style: TextStyle(fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  positionsView() {
    ValueListenableBuilder<Iterable<ItemPosition>>(
      valueListenable: itemPositionsListener.itemPositions,
      builder: (context, positions, child) {
        int min;
        int max;
        if (positions.isNotEmpty) {}
      },
    );
  }

  getValue(value) {
    if (value == 'true') {
      return 2;
    } else {
      return 1;
    }
  }

  CostValueSetter(TravelReqPayLoad ReqBody) {
    for (int index = 0; index < ReqBody.travelCity.length; index++) {
      if(HomeCountryName==ReqBody.travelCity[index].travellingCountryTo){

        ReqBody.travelCity[index].transportationCost="0.0";
        ReqBody.travelCity[index].perDiemCost="0.0";
        ReqBody.travelCity[index].hotelCost="0.0";
        ReqBody.travelCity[index].totalCost="0.0";
      }else{
        SetValueInital(ReqBody, index);
      }

    }
  }

  SetValueInital(TravelReqPayLoad list, int index) {
    var transportvalue = list.travelCity[index].transportCost;
    DateTime dateStart;
    DateTime dateEnd;
    if (index > 0) {
      dateStart = DateTime.parse('${list.travelCity[index - 1].departureDate}');
      dateEnd = DateTime.parse('${list.travelCity[index].departureDate}');
    } else {
      dateStart = DateTime.parse('${list.travelCity[index].departureDate}');
      if(list.travelCity[index].returnDate==""){
        dateEnd = DateTime.parse('${list.travelCity[index].departureDate}');
      }else{
        dateEnd = DateTime.parse('${list.travelCity[index].returnDate}');
      }

    }


if(transportvalue==null){
  transportvalue="0.0";
}

    final differenceInTravelDates = dateEnd.difference(dateStart).inDays;

    list.travelCity[index].transportationCost =
        (double.parse(transportvalue) * differenceInTravelDates)
            .toStringAsFixed(2);

    var perDiemValue = list.travelCity[index].perDiamValue;

    if(perDiemValue==null){
      perDiemValue="0.0";
    }

    list.travelCity[index].perDiemCost =
        (double.parse(perDiemValue) * differenceInTravelDates)
            .toStringAsFixed(2);

    if (list.travelCity[index].isAccmodationRequired) {
      DateTime accomationStart =
          DateTime.parse('${list.travelCity[index].accmodationStartDate}');
      DateTime accomationEnd =
          DateTime.parse('${list.travelCity[index].accmodationEndDate}');
      final difference = accomationEnd.difference(accomationStart).inDays;
      var value;
      if (difference == 0) {
        value = (double.parse(list.travelCity[index].accomodationLimit))
            .toStringAsFixed(2);
      } else {
        value = (double.parse(list.travelCity[index].accomodationLimit) *
                difference)
            .toStringAsFixed(2);
      }

      list.travelCity[index].hotelCost = value;
    } else {
      list.travelCity[index].hotelCost = "0";
    }

    if (list.travelCity[index].hotelCost == "0") {
      list.travelCity[index].totalCost =
          (double.parse(list.travelCity[index].perDiemCost) +
                  double.parse(list.travelCity[index].transportationCost))
              .toStringAsFixed(2);
    } else {
      list.travelCity[index].totalCost =
          (double.parse(list.travelCity[index].perDiemCost) +
                  double.parse(list.travelCity[index].hotelCost) +
                  double.parse(list.travelCity[index].transportationCost))
              .toStringAsFixed(2);
    }
  }



  getDepartureDate(String date) {
    if (date == "") {
      return "";
    } else {
      var depatureDate = DateTime.parse(date.toString());
      final String datestring = DateFormat("dd MMM yy").format(depatureDate);
      return datestring;
    }
  }

  getDepatureDay(String date) {
    if (date == "") {
      return "";
    } else {
      final depatureDate = DateTime.parse(date);
      final String daystring = DateFormat('EEEE').format(depatureDate);
      return daystring;
    }
  }

  getbool(value) {
    if (value == 'true') {
      return true;
    } else {
      return false;
    }
  }

  getdepatureview(String travellingCountryTo) {
    if (traveldata.length <= 1&&HomeCountryName!=travellingCountryTo) {
      return true;
    } else {
      return false;
    }
  }

  Check_visa_category(List<PurposeData> list) {
    for (int i = 0; i < list.length; i++) {
      if (list[i].isChecked) {
        if (list[i].applicableVisa == 'Work') {
          return true;
        }
      }
    }
    return false;
  }

  check_tick_mark(String text) {
    if (text != null) {
      if (text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  SetValueTravelReq(GetVisaModel data) {
    if (data.message == "Success") {
      this.setState(() {
        traveldata[index].visaNumber = data.data[0].documentNumber;
        traveldata[index].visaExpiryDate = data.data[0].expirationDate;
        traveldata[index].hasVisa = data.status;
      });
    } else {
      this.setState(() {
        traveldata[index].visaNumber = null;
        traveldata[index].visaExpiryDate = null;
      });
    }
  }

  checkSelectedDependents(List<SecondDependentData> dependentList) {
    for (int i = 0; i < dependentList.length; i++) {
      if (dependentList[i].isSelected) {
        return true;
      }
    }

    return false;
  }

  resetSelectedDependents(List<SecondDependentData> dependentList) {
    for (int i = 0; i < dependentList.length; i++) {
      dependentList[i].isSelected = false;
    }

    return dependentList;
  }

  Validator(TravelReqPayLoad formdata) {
    if (formdata.projectName != null && formdata.projectName.isEmpty) {
      return false;
    }

    for (int i = 0; i < formdata.travelCity.length; i++) {
      var cityTravel = formdata.travelCity[i];
      if (cityTravel.travellingCountry == null ||
          cityTravel.travellingCountry.isEmpty) {
        return false;
      }
      // else if (cityTravel.travellingCountryTo == null ||
      //     cityTravel.travellingCountryTo.isEmpty) {
      //   return false;
      // }

      if (HomeCountryName != formdata.travelCity[i].travellingCountryTo) {
        if (cityTravel.hostHrName == null || cityTravel.hostHrName.isEmpty) {
          return false;
        } else if (cityTravel.hostPhoneExt == null ||
            cityTravel.hostPhoneExt.isEmpty ||
            cityTravel.hostPhoneNo.isEmpty) {
          return false;
        } else if (cityTravel.isClientLocation != null &&
            getvaluefromstringbool(cityTravel.isClientLocation)) {
          if (cityTravel.clientName == null && cityTravel.clientName.isEmpty) {
            return false;
          }
        } else {
          if (cityTravel.officeLocation == null ||
              cityTravel.officeLocation.isEmpty) {
            return false;
          }
        }
      }


    }

    return true;
  }

  getvaluefromstringbool(value) {
    if (value == "true") {
      return true;
    } else {
      return false;
    }
  }

  accomodationLogic(List<TravelCity> travel_list, String date, int index) {
    if (travel_list.length == 1) {
      return travel_list[index].returnDate;
    }
    if (travel_list.length - 1 == index) {
      return travel_list[index].departureDate;
    } else if (travel_list.length > 1) {
      return travel_list[index + 1].departureDate;
    } else {
      return date;
    }
  }

  SaveCostData(PerDiemModel value) {
    perDiemModel = value;
    traveldata[index].perDiamValue = value.perDiem;
    traveldata[index].transportCost = value.transportation;
    traveldata[index].currency = value.currencyCode;
    // traveldata[index].hotelCost = value.accommodationLimit;
    traveldata[index].accomodationLimit = value.accommodationLimit;
  }

  CheckVisaNote(List<TravelCity> req_data, String visaExpiryDate, int index) {
    var differenceInTravelDates;
    if (req_data.length == 1) {
      if (req_data[index].returnDate == "") {
        differenceInTravelDates = 1;
      } else {
        differenceInTravelDates = DateTime.parse(visaExpiryDate)
            .difference(DateTime.parse(req_data[index].returnDate))
            .inDays;
      }
    } else if (req_data.length - 1 == index) {
      differenceInTravelDates = DateTime.parse(visaExpiryDate)
          .difference(DateTime.parse(req_data[index].departureDate))
          .inDays;
    } else {
      differenceInTravelDates = DateTime.parse(visaExpiryDate)
          .difference(DateTime.parse(req_data[index + 1].departureDate))
          .inDays;
    }

    if (differenceInTravelDates < 0) {
      return "*The selected visa is not valid for this travel. Please apply for new visa";
    } else {
      return " ";
    }
  }
}

returnBillableValue(bool isBillable) {
  if (isBillable) {
    return 1;
  } else {
    return 2;
  }
}

accodomoationlastDateLogic(index, List<TravelCity> traveldata) {
  if (index != traveldata.length - 1) {
    return DateTime.parse(traveldata[index + 1].departureDate);
  } else {
    return DateTime.parse(traveldata[index].departureDate);
  }
}

GenerateVisa(TravelReqPayLoad mydata, UserInfo info, String homeCountryName) {
  bool isHomeCountry = false;

  List<TravelVisa> visalist = new List<TravelVisa>();
  TravelVisa visa;
  for (int i = 0; i < mydata.travelCity.length; i++) {
    if (homeCountryName.trim().toLowerCase() ==
        mydata.travelCity[i].travellingCountryTo.trim().toLowerCase()) {
      isHomeCountry = true;
    }
    if (!isHomeCountry) {
      if (mydata.travelCity[i].hasVisa == null ||
          !mydata.travelCity[i].hasVisa ||
          checkVisaApplicable(
              mydata.travelCity, mydata.travelCity[i].visaExpiryDate, i)) {
        visa = new TravelVisa();
        visa.reqId = "0";
        visa.projectId = mydata.project;
        visa.projectName = mydata.projectName;
        visa.isBillable = mydata.isBillable;
        visa.fromCity = mydata.travelCity[i].travellingCountry;
        visa.toCity = mydata.travelCity[i].travellingCountryTo;
        visa.travelStartDate =
            DateTime.parse(mydata.travelCity[i].departureDate)
                .toUtc()
                .toIso8601String();
        if (mydata.travelCity.length == 1) {
          visa.travelEndDate = DateTime.parse(mydata.travelCity[i].returnDate)
              .toUtc()
              .toIso8601String();
        } else if (i == mydata.travelCity.length - 1) {
          visa.travelEndDate =
              DateTime.parse(mydata.travelCity[i].departureDate)
                  .toUtc()
                  .toIso8601String();
        } else {
          visa.travelEndDate =
              DateTime.parse(mydata.travelCity[i + 1].departureDate)
                  .toUtc()
                  .toIso8601String();
        }

        if (mydata.travelCity[i].travelPurpose == "Work") {
          visa.visaPurpose = "19";
        } else {
          visa.visaPurpose = "6";
        }

        visa.appliedVisa = mydata.travelCity[i].travelPurpose;
        visa.requestNotes = "";
        visa.visaStatus = "1";
        visa.empEmail = info.data.empCode;
        visa.organization = info.data.orgId;
        visa.visaReqId = "";
        visa.isDependent = false;
        visa.dependentRelation = "";
        visa.dependentName = "";
        visa.country = mydata.travelCity[i].currentCountryCode;
        visa.createdBy = info.data.empCode;
        visalist.add(visa);
        isHomeCountry = false;
      } else {}
    }
  }

  return visalist;
}

checkVisaApplicable(
    List<TravelCity> req_data, String visaExpiryDate, int index) {
  var differenceInTravelDates;
  if(visaExpiryDate!=null){
    if (req_data.length == 1) {
      if (req_data[index].returnDate == "") {
        differenceInTravelDates = 1;
      } else {
        differenceInTravelDates = DateTime.parse(visaExpiryDate)
            .difference(DateTime.parse(req_data[index].returnDate))
            .inDays;
      }
    } else if (req_data.length - 1 == index) {
      differenceInTravelDates = DateTime.parse(visaExpiryDate)
          .difference(DateTime.parse(req_data[index].departureDate))
          .inDays;
    } else {
      differenceInTravelDates = DateTime.parse(visaExpiryDate)
          .difference(DateTime.parse(req_data[index + 1].departureDate))
          .inDays;
    }

    if (differenceInTravelDates < 0) {
      return true;
    } else {
      return false;
    }
  }
  else{
    return true;
  }

}

setFormattedDate(String date) {
  final depatureDate = DateTime.parse(date).toLocal();
  final String datestring = DateFormat("dd-MMM-yyyy").format(depatureDate);
  return datestring;
}

resetValue(TravelReqPayLoad req_data) {
  for (int i = 0; i < req_data.travelCity.length; i++) {
    req_data.travelCity[i].myTotalCost = 0.0;
    req_data.travelCity[i].myAirFare = "0";
  }
}
