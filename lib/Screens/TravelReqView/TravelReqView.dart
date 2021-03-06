import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/ActionHistoryModel.dart';

import 'package:mobility_sqr/ModelClasses/CurrencyConversionModel.dart';
import 'package:mobility_sqr/ModelClasses/GetTravelRequest.dart';
import 'package:mobility_sqr/ModelClasses/SubmitRequestFResponse.dart';
import 'package:mobility_sqr/ModelClasses/SubmitRequestForApprovalModel.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/ModelClasses/showHide.dart';
import 'package:mobility_sqr/Screens/ActionHistory.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';
import 'package:mobility_sqr/Widgets/ViewAgenda.dart';
import 'package:queue/queue.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Widgets/CustomColumnEditText.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:mobility_sqr/Widgets/AlertForClassDialog_withAnimation.dart';

class TravelReqView extends StatefulWidget {
  @override
  _TravelReqViewState createState() => _TravelReqViewState();
}

class _TravelReqViewState extends State<TravelReqView> {
  final FormatCurrency = new NumberFormat("#,##0", "en_US");
  ApiProvider _apiProvider = ApiProvider();
  SubmitRequestForApprovalModel body = SubmitRequestForApprovalModel();
  ItemScrollController itemScrollController = ItemScrollController();
  BuildContext dialogContext;
  bool showcost = false;
  final _listview_controller = ScrollController();
  List<dynamic> userdetails = [];
  MyModelData list = MyModelData();
  int where = 0;
  var args;
  ActionHistoryModel history_data;
  bool showloader = true;
  int index = 0;
  List<Currency_Data> _currencyConversiondata;
  final queue = Queue();
  var totalCurrencyCode="Currency";
  var HomeCountryName;
  final _userInfo = TokenGetter();
  UserInfo info;
  var userEmail;
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
  getvalues() async {
    info = await _userInfo.readUserInfo() ?? null;
    HomeCountryName = info.data.home;
    userEmail=info.data.empCode;
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
  void initState() {
    super.initState();
    getvalues();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context).settings.arguments;
      });
      list = args['EmployeeData'];
      where = args['where'];
      initalizingData(list);
      ApiCallForActionHistory(list.travelReqId);
      getValuesforCurrencyConversion();
    });
  }

  getValuesforCurrencyConversion() async {
    await _apiProvider
        .get_currency_active()
        .then((value) => setCurrencyValue(value))
        .catchError((onError) => this.setState(() {
              showloader = false;
            }));
  }

  setCurrencyValue(CurrencyConversionModel value) {
    if (value.message == "Success") {
      this.setState(() {
        showloader = false;
        _currencyConversiondata = value.data;
      });
    } else {
      this.setState(() {
        showloader = false;
      });
    }
  }

  initalizingData(list) {
    for (int i = 0; i < list.details.length; i++) {
      showHide data = new showHide();
      if (i == 0) {
        data.name = "data${1}";
        data.name = "data${1}";
        data.hide = false;
      } else {
        data.name = "data${1}";
        data.hide = true;
      }
      userdetails.add(data);
    }
  }

  setThevalueforToCurrency(Currency_Data value, MyModelData list) {
    for (int i = 0; i < list.details.length; i++) {
      queue.add(() async {
        await ApiCall(i, value, list);
      }).then((result) => print("found"));
    }
  }

  ApiCall(
    int i,
    Currency_Data value,
    MyModelData list,
  ) async {
    await _apiProvider
        .get_currency_conversion(list.details[i].currency, value.currencyCode)
        .then((value) => this.setState(() {
              if (value.data.length > 0) {
                list.details[i].currencyTotal = list.details[i].totalCost *
                    double.parse(value.data[0].conversionRate);
              } else {
                list.details[i].currencyTotal = 0.0;
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    list = args['EmployeeData'];

    return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                if (history_data != null) {
                  showCustomDialogClass(
                      context,
                      ActionHistory(
                        history_data,
                        onclose: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ));
                } else {}
              },
              child: Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.only(right: 15),
                child: Image.asset(
                  'assets/images/approved_icon_history.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,

          title: AutoSizeText(
            "${list.firstName + " " + list.lastName}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
            minFontSize: 16,
          ),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context)=>Stack(
            children: [
              SingleChildScrollView(
                controller: _listview_controller,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0.w,vertical: 1.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: travelTextView(
                                  "Project",
                                  IsNullCheck(list.projectName)
                                      ? list.projectName +
                                          "(" +
                                          list.project +
                                          ")"
                                      : " ",
                                  AppConstants.TEXT_BACKGROUND_COLOR),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                child: travelTextView(
                                    "Travel Type",
                                    checkBillable(list.isBillable),
                                    AppConstants.TEXT_BACKGROUND_COLOR)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: travelTextView(
                                  "Visa Request ID",
                                  list.visaRequests != " " &&
                                          IsNullCheck(list.visaRequests)
                                      ? SetVisaReqId(list)
                                      : " ",
                                  AppConstants.TEXT_BACKGROUND_COLOR),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                child: travelTextView(
                                    "Travel Request ID",
                                    IsNullCheck(list.travelReqId)
                                        ? list.travelReqId
                                        : " ",
                                    AppConstants.APP_THEME_COLOR)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                                    this.setState(() {
                                      this.index = index;

                                      for (int i = 0;
                                          i < list.details.length;
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
                                      borderRadius:  BorderRadius.all(Radius.circular(5)),
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
                        ]),
                    Container(
                      width: 100.0.w,
                      height: 2,
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      color: AppConstants.APP_THEME_COLOR,
                    ),
                    list.details.length > 0
                        ? ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                          child: CustomColumnEditText(
                                              "",
                                              list.details[index].sourceCity,
                                              list.details[index]
                                                  .travellingCountry,
                                              "From",
                                              1,
                                              true)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Transform.rotate(
                                        angle: 80,
                                        child: Center(
                                          child: Image.asset(
                                            "assets/images/plane_icon.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                          child: CustomColumnEditText(
                                              "",
                                              list.details[index].destinationCity,
                                              list.details[index]
                                                  .travellingCountryTo,
                                              "To",
                                              1,
                                              true)),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          child: CustomColumnEditText(
                                              "",
                                              getDepartureTime(list
                                                  .details[index].departureDate),
                                              list.details[index]
                                                  .travellingCountry,
                                              "Departure",
                                              2,
                                              false)),
                                    ),
                                    if (!list.isTravelMultiCountry)
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            child: CustomColumnEditText(
                                                "",
                                                getDepartureTime(list
                                                    .details[index].returnDate),
                                                list.details[index]
                                                    .travellingCountryTo,
                                                "Return",
                                                2,
                                                false)),
                                      ),
                                  ],
                                ),
                              ),
                              HomeCountryName!=null&&HomeCountryName.trim().toLowerCase() !=
                                  list.details[index].travellingCountryTo.trim().toLowerCase()? Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                "Purpose  of travel :",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                              AutoSizeText(
                                                " ${list.details[index].travelPurpose}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: AppConstants
                                                        .TEXT_BACKGROUND_COLOR),
                                                minFontSize: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Do you need accomodation? ",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              "${checkAccomodation(list.details[index].isAccmodationRequired)}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: AppConstants
                                                      .TEXT_BACKGROUND_COLOR),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  list.details[index].isAccmodationRequired
                                      ? Container(
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 5.0.w),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: CustomColumnEditText(
                                                  "",
                                                  getDepartureTime(list
                                                      .details[index]
                                                      .accmodationStartDate),
                                                  " ",
                                                  "Start Date",
                                                  2,
                                                  false)),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: CustomColumnEditText(
                                                  "",
                                                  getDepartureTime(list
                                                      .details[index]
                                                      .accmodationEndDate),
                                                  "",
                                                  "End Date",
                                                  2,
                                                  false)),
                                        ),
                                      ],
                                    ),
                                  )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(
                                    height: 2,
                                    thickness: 2,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 5.0.w, right: 5.0.w, top: 22),
                                        child: Row(children: <Widget>[
                                          Text(
                                            "Host Contact",
                                            style: TextStyle(
                                                color: AppConstants.APP_THEME_COLOR,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Expanded(
                                              child: Divider(
                                                  color: AppConstants.APP_THEME_COLOR,
                                                  indent: 5,
                                                  thickness: 1)),
                                        ]),
                                      ),
                                      list.details[index].agenda != null ||
                                          list.details[index].agenda
                                              .toString()
                                              .trim()
                                              .isNotEmpty
                                          ? Align(
                                          alignment: Alignment.bottomRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              showCustomDialogClass(
                                                  context,
                                                  AddAgendaView(
                                                    list.details[index].agenda,
                                                    onclose: () {
                                                      Navigator.of(context,
                                                          rootNavigator: true)
                                                          .pop();
                                                    },
                                                  ));
                                            },
                                            child: Container(
                                                height: 30,
                                                width: 90,
                                                margin:
                                                EdgeInsets.only(right: 20),
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 5.0,
                                                      ),
                                                    ],
                                                    border: Border.all(
                                                        color: AppConstants
                                                            .APP_THEME_COLOR),
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(5)),
                                                    color: AppConstants
                                                        .APP_THEME_COLOR),
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                        child: Text(
                                                          "View Agenda",
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight.w700,
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ))
                                          : SizedBox(),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: travelTextView(
                                                "Name",
                                                IsNullCheck(list
                                                    .details[index].hostHrName)
                                                    ? list.details[index].hostHrName
                                                    : " ",
                                                AppConstants.TEXT_BACKGROUND_COLOR),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: travelTextView(
                                                  "Phone",
                                                  IsNullCheck(list
                                                      .details[index].hostPhoneNo)
                                                      ? list.details[index]
                                                      .hostPhoneExt +
                                                      "-" +
                                                      list.details[index]
                                                          .hostPhoneNo
                                                      : " ",
                                                  AppConstants
                                                      .TEXT_BACKGROUND_COLOR)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: travelTextView(
                                                "Travelling to",
                                                IsNullCheck(list.details[index]
                                                    .isClientLocation)
                                                    ? isClientLocation(list
                                                    .details[index]
                                                    .isClientLocation)
                                                    : " ",
                                                AppConstants.TEXT_BACKGROUND_COLOR),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: travelTextView(
                                                  "Address",
                                                  addressCheck(
                                                      list.details[index]
                                                          .clientAddress,
                                                      list.details[index]
                                                          .officeLocation,
                                                      list.details[index]
                                                          .isClientLocation),
                                                  AppConstants
                                                      .TEXT_BACKGROUND_COLOR)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  list.details[index].isClientLocation
                                      ? Container(
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 5.0.w),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: travelTextView(
                                                "Client Name",
                                                list.details[index].clientName,
                                                AppConstants
                                                    .TEXT_BACKGROUND_COLOR),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              child: travelTextView(
                                                  "Client Number",
                                                  list.details[index]
                                                      .clientNumberExt +"-"+
                                                      list.details[index]
                                                          .clientNumber,
                                                  AppConstants
                                                      .TEXT_BACKGROUND_COLOR)),
                                        ),
                                      ],
                                    ),
                                  )
                                      : SizedBox(),
                                  SizedBox(height: 10,),
                                  Divider(
                                    height: 2,
                                    thickness: 2,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5.0.w, vertical: 1.0.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Travelling with dependent(s)?",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "${checkdependent(list.details[index].isDependent)}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  list.details[index].isDependent &&
                                      list.dependent != null
                                      ? Column(
                                    children:
                                      setDependentsList(list.dependent,index)

                                    ,
                                  )
                                      : SizedBox(),

                                ],
                              ):SizedBox(),

                              Divider(
                                height: 2,
                                thickness: 5,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 5.0.w, right: 5.0.w, top: 20),
                                child: Row(children: <Widget>[
                                  Text(
                                    "Home Contact",
                                    style: TextStyle(
                                        color: AppConstants.APP_THEME_COLOR,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Expanded(
                                      child: Divider(
                                          color: AppConstants.APP_THEME_COLOR,
                                          indent: 5,
                                          thickness: 1)),
                                ]),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5.0.w, vertical: 1.0.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: travelTextView(
                                            "Name",
                                            IsNullCheck(list.homeContactName)
                                                ? list.homeContactName
                                                : " ",
                                            AppConstants.TEXT_BACKGROUND_COLOR),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          child: travelTextView(
                                              "Phone",
                                              IsNullCheck(list.homePhoneExt)
                                                  ? list.homePhoneExt +
                                                      "-" +
                                                      list.homePhoneNumber
                                                  : " ",
                                              AppConstants
                                                  .TEXT_BACKGROUND_COLOR)),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                  color: AppConstants.TEXT_BACKGROUND_COLOR,
                                  thickness: .3),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              "Do you need a laptop? ",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              " ${IsNullCheck(list.isLaptopRequired) ? checkAccomodation(list.isLaptopRequired) : " "}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: AppConstants
                                                      .TEXT_BACKGROUND_COLOR),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Do you have a laptop? ",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            "${checkAccomodation(list.haveLaptop)}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: AppConstants
                                                    .TEXT_BACKGROUND_COLOR),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5.0.w, vertical: 1.0.h),
                                  child: Text(
                                    "Additional Note",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color:
                                            AppConstants.TEXT_BACKGROUND_COLOR),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                                  child: Text(
                                    "${IsNullCheck(list.remark) ? list.remark : " "}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            AppConstants.TEXT_BACKGROUND_COLOR),
                                  ),
                                ),
                              ),
                              Container(
                                width: 100.0.w,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5.0.w, vertical: 1.0.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Approximate Travel Cost",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: AppConstants
                                                .TEXT_BACKGROUND_COLOR),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            border: Border.all(
                                                color: AppConstants
                                                    .APP_THEME_COLOR)),
                                        child: FormField<Currency_Data>(
                                          builder: (FormFieldState<Currency_Data>
                                              state) {
                                            return InputDecorator(
                                              decoration: InputDecoration(
                                                  fillColor: AppConstants
                                                      .APP_THEME_COLOR,
                                                  hoverColor: AppConstants
                                                      .APP_THEME_COLOR,
                                                  contentPadding: EdgeInsets.zero,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0))),
                                              child: DropdownButtonHideUnderline(
                                                child: FittedBox(
                                                  child: DropdownButton<
                                                      Currency_Data>(
                                                    iconSize: 20,
                                                    iconEnabledColor: AppConstants
                                                        .APP_THEME_COLOR,
                                                    hint: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Text("Currency",textAlign: TextAlign.center,),
                                                    ),

                                                    value: list.details[index]
                                                        .currency_data,
                                                    isDense: true,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        list.details[index]
                                                                .currency_data =
                                                            newValue;
                                                        totalCurrencyCode=newValue.currencyCode;
                                                      });

                                                      setThevalueforToCurrency(
                                                          newValue, list);
                                                    },
                                                    items: _currencyConversiondata
                                                        .map((Currency_Data
                                                            value) {
                                                      return DropdownMenuItem<
                                                          Currency_Data>(
                                                        value: value,
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 5),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  value.currencyCode +
                                                                      " (${value.currencyName})",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: AppConstants
                                                                          .APP_THEME_COLOR),
                                                                ),
                                                                Container(
                                                                  height: 1,
                                                                  color: Colors
                                                                      .black12,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5.0.w,
                                ),
                                child: Column(children: [
                                  for (var item in list.details)
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: travelTextView(
                                                "City Name",
                                                "${IsNullCheck(item.destinationCity) ? item.destinationCity + "(${IsNullCheck(item.currency) ? item.currency : " "})" : " "}",
                                                AppConstants
                                                    .TEXT_BACKGROUND_COLOR),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            travelTextViewHori(
                                                "Per-diems",
                                                "${IsNullCheck(list.details[list.details.lastIndexOf(item)].perDiemCost) ? FormatCurrency.format(item.perDiemCost.round()) : "-"}",
                                                Colors.black54),
                                            travelTextViewHori(
                                                "Airfare",
                                                "${IsNullCheck(list.details[list.details.lastIndexOf(item)].airfareCost) ? FormatCurrency.format(item.airfareCost.round()) : "-"}",
                                                Colors.black54),
                                            travelTextViewHori(
                                                "Hotel",
                                                "${IsNullCheck(list.details[list.details.lastIndexOf(item)].hotelCost) ? FormatCurrency.format(item.hotelCost.round()) : "-"}",
                                                Colors.black54),
                                            travelTextViewHori(
                                                "Transportation",
                                                "${IsNullCheck(list.details[list.details.lastIndexOf(item)].transportationCost) ? FormatCurrency.format(item.transportationCost.round()) : "-"}",
                                                Colors.black54),
                                            travelTextViewHori(
                                                "Total Cost",
                                                "${IsNullCheck(list.details[list.details.lastIndexOf(item)].totalCost) ? FormatCurrency.format(item.totalCost.round()) : "-"}",
                                                Colors.black54),
                                          ],
                                        ),
                                        Divider(
                                          height: 1,
                                          thickness: 1,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 100.0.w,
                                          child: RaisedButton(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: AppConstants
                                                        .APP_THEME_COLOR)),
                                            onPressed: () async {},
                                            color: AppConstants.APP_THEME_COLOR,
                                            textColor: Colors.white,
                                            child: Text(
                                                "Total Cost(${ totalCurrencyCode}) : ${IsNullCheck(item.currencyTotal) ? item.currencyTotal==0.0?"  -":FormatCurrency.format(item.currencyTotal.round()) : " "} ",
                                                style: TextStyle(fontSize: 14)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  Divider(
                                    height: 1,
                                    color: AppConstants.TEXT_BACKGROUND_COLOR,
                                  ),
                                ]),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5.0.w,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: travelTextView(
                                        "Approver Remarks",
                                        "${IsNullCheck(list.requestNotes) ? list.requestNotes : " "}",
                                        AppConstants.TEXT_BACKGROUND_COLOR),
                                  ),
                                ),
                              ),
                              where == 5
                                  ? Container(
                                      child: Column(
                                        children: [
                                          Divider(
                                            height: 1,
                                            color: AppConstants
                                                .TEXT_BACKGROUND_COLOR,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Remarks",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppConstants
                                                            .TEXT_BACKGROUND_COLOR),
                                                  ),
                                                  Icon(
                                                    Icons.note_add,
                                                    color: AppConstants
                                                        .APP_THEME_COLOR,
                                                  )
                                                ]),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.multiline,
                                              textInputAction:
                                                  TextInputAction.done,
                                              maxLines: 7,
                                              maxLength: 1000,
                                              onChanged: (text) {
                                                body.requestNotes = text;
                                              },
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                height: 1.0,
                                                color: Colors.black,
                                              ),
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: AppConstants
                                                              .APP_THEME_COLOR))),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom,
                                          ),
                                          Container(
                                            width: 100.0.w,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: FlatButton(
                                                    child: Text(
                                                      'Reject',
                                                      style: TextStyle(
                                                          fontSize: 18.0),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    height: 40,
                                                    textColor: Colors.amber[600],
                                                    shape: RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color:
                                                              Colors.amber[600],
                                                          width: 1,
                                                          style:
                                                              BorderStyle.solid),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    onPressed: () async {
                                                      body.modifiedBy =
                                                          userEmail;
                                                      body.orgId =
                                                          list.organization;
                                                      body.module = "Travel";
                                                      body.approveAction = "R";
                                                      body.approvalLevel =
                                                          list.approvalLevel;
                                                      body.currentTicketOwner =
                                                          userEmail;
                                                      body.takeOwnership = "";
                                                      body.transferTo = "";
                                                      body.travelReqId =
                                                          list.travelReqId;

                                                      if (body.requestNotes !=
                                                              null &&
                                                          body.requestNotes
                                                              .isNotEmpty) {
                                                        _onLoading();
                                                        await _apiProvider
                                                                .Post_Travel_Req_For_Approval(
                                                                    body)
                                                            .then((value) =>
                                                                handleNavigation(
                                                                    value))
                                                            .catchError((error) {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .pop(dialogContext);
                                                        });
                                                      } else {
                                                        showDefaultSnackbar(
                                                            context,
                                                            "Please provide the remark");
                                                      }
                                                    },
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Expanded(
                                                  flex: 1,
                                                  child: FlatButton(
                                                    child: Text(
                                                      'Approve',
                                                      style: TextStyle(
                                                          fontSize: 18.0),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    height: 40,
                                                    textColor: Colors.white,
                                                    color: AppConstants
                                                        .APP_THEME_COLOR,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    onPressed: () async {
                                                      body.modifiedBy =
                                                          userEmail;
                                                      body.orgId =
                                                          list.organization;
                                                      body.module = "Travel";
                                                      body.approveAction = "A";
                                                      body.approvalLevel =
                                                          list.approvalLevel;
                                                      body.currentTicketOwner =
                                                          userEmail;
                                                      body.takeOwnership = "";
                                                      body.transferTo = "";
                                                      body.travelReqId =
                                                          list.travelReqId;

                                                      if(body.requestNotes==null){
                                                        body.requestNotes="";
                                                      }
                                                      _onLoading();
                                                      await _apiProvider
                                                              .Post_Travel_Req_For_Approval(
                                                                  body)
                                                          .then((value) =>
                                                              handleNavigation(
                                                                  value))
                                                          .catchError((error) {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop(dialogContext);
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              showMobilityLoader(showloader, Colors.black26)
            ],
          ),
        ));
  }

  setDependentsList(List<Dependent> dependent, int index){
    var dependentlist = List<Widget>();

      for(int i=0;i<dependent.length;i++){

        if(int.parse(dependent[i].reqId)==index){

          dependentlist.add(   Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(5)),
                border: Border.all(
                    color: AppConstants
                        .TEXT_BACKGROUND_COLOR,
                    width: 0.3)),
            margin: EdgeInsets.symmetric(
                horizontal: 5.0.w,
                vertical: 0.5.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: [
                            AutoSizeText("Name :",
                                minFontSize: 5,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppConstants
                                        .TEXT_BACKGROUND_COLOR)),
                            AutoSizeText(
                                "${dependent[i].dependentName}",
                                minFontSize: 5,
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                    fontSize: 14,
                                    color: AppConstants
                                        .TEXT_BACKGROUND_COLOR))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: [
                            AutoSizeText(
                                "Relation: ",
                                minFontSize: 5,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: AppConstants
                                        .TEXT_BACKGROUND_COLOR)),
                            AutoSizeText(
                                "${dependent[i].dependentRelation}",
                                minFontSize: 5,
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                    fontSize: 10,
                                    color: AppConstants
                                        .TEXT_BACKGROUND_COLOR))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: [
                            AutoSizeText(
                                "Visa Number :",
                                minFontSize: 5,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: AppConstants
                                        .TEXT_BACKGROUND_COLOR)),
                            AutoSizeText(
                                "${!IsNullCheck(dependent[i].dependentVisa)?"N/A":dependent[i].dependentVisa}",
                                minFontSize: 5,
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                    fontSize: 10,
                                    color: AppConstants
                                        .TEXT_BACKGROUND_COLOR))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          children: [
                            AutoSizeText(
                                "Passport Status: ",
                                minFontSize: 5,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: AppConstants
                                        .TEXT_BACKGROUND_COLOR)),
                            AutoSizeText(
                                "${!IsNullCheck(dependent[i].dependentPassport)?"N/A":dependent[i].dependentPassport}",
                                minFontSize: 5,
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                    fontSize: 10,
                                    color: AppConstants
                                        .TEXT_BACKGROUND_COLOR))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ));


  }
      }


return dependentlist;
  }

  handleNavigation(value) {
    if (value.status) {
      Navigator.of(context, rootNavigator: true).pop(dialogContext);
      showAlertDialog(context, value.massage);
    } else {
      Navigator.of(context, rootNavigator: true).pop(dialogContext);
      showAlertDialog(context, "Failed");
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
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/Dashboard', (Route<dynamic> route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("$text"),
      content: Text("Request Updated Successfully"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        dialogContext = context;
        return Container(
          height: 50,
          width: 50,
          color: Colors.transparent,
          child: Center(
            child: LoadingBouncingGrid.circle(
              size: 50,
              backgroundColor: Colors.white,
            ),
          ),
        );
      },
    );
  }

  manageColor(bool show) {
    if (show == false) {
      return AppConstants.APP_THEME_COLOR;
    } else {
      return Colors.grey;
    }
  }

  travelTextView(String header, String text, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${header}',
            style: TextStyle(fontSize: 16), textAlign: TextAlign.start),
        SizedBox(
          height: 1.0.w,
        ),
        AutoSizeText(
          '${text}',
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
          minFontSize: 12,
        )
      ],
    );
  }

  travelTextViewHori(String header, String text, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${header}',
          style: TextStyle(fontSize: 14, color: Colors.black),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 1.0.w,
        ),
        AutoSizeText(
          '${text}',
          style: TextStyle(
            color: textColor,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
          minFontSize: 12,
        )
      ],
    );
  }

  checkBillable(value) {
    if (value) {
      return "Billable";
    } else {
      return "Non-Billable";
    }
  }

  checkAccomodation(value) {
    if (value != null) {
      if (value) {
        return "Yes";
      } else {
        return "No";
      }
    } else {
      return " ";
    }
  }

  IsNullCheck(dynamic data) {
    if (data == null) {
      return false;
    } else {
      return true;
    }
  }

  getDepartureTime(String date) {
    final depatureDate = DateTime.parse(date).toLocal();
    final String datestring = DateFormat("dd MMM yy").format(depatureDate);
    return datestring;
  }

  isClientLocation(value) {
    if (!value) {
      return "Office location";
    } else {
      return "Client location";
    }
  }

  addressCheck(String clientlocation, String hostlocation, bool location) {
    try {
      print(clientlocation);
      print(hostlocation);
    } catch (e) {}

    if (location) {
      if (clientlocation != null) {
        return clientlocation;
      } else {
        return "";
      }
    } else {
      if (hostlocation != null) {
        return hostlocation;
      } else {
        return "";
      }
    }
  }

  checkdependent(value) {
    if (value) {
      return "Yes";
    } else {
      return "No";
    }
  }

  GetTotalCost(MyModelData list) {
    double total = 0;
    for (int i = 0; i < list.details.length; i++) {
      if (list.details[i].totalCost != null) {
        total = total + list.details[i].totalCost;
      }
    }
    return total.toString();
  }

  void ApiCallForActionHistory(String travelReqId) {
    _apiProvider
        .get_travel_status_summary(travelReqId)
        .then((value) => handleApiResult(value))
        .catchError((onError) => handleError(onError));
  }

  handleApiResult(ActionHistoryModel value) {
    this.setState(() {
      history_data = value;
      showloader = false;
    });
  }

  handleError(Function error) {
    this.setState(() {
      showloader = false;
    });
  }
}

SetVisaReqId(MyModelData list) {
  String travelVisaReq = " ";
  if (list.visaRequests != null && list.visaRequests.length != 0) {
    for (var travelreq in list.visaRequests) {
      if (travelVisaReq == " ") {
        travelVisaReq = travelreq.visaReqId;
      } else {
        travelVisaReq = travelVisaReq + ", " + travelreq.visaReqId;
      }
    }
    return travelVisaReq;
  }
  else{
    return " ";
  }
}

manageHeight() {}
