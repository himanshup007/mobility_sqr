import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_pickers/country.dart';

import 'package:country_pickers/utils/utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/TokenGetter.dart';
import 'package:mobility_sqr/ModelClasses/AddReqPayLoad.dart';
import 'package:mobility_sqr/ModelClasses/Get_Post_Location.dart';
import 'package:mobility_sqr/ModelClasses/PurposeModelClass.dart';

import 'package:mobility_sqr/ModelClasses/SearchModelClass.dart';
import 'package:mobility_sqr/ModelClasses/showHide.dart';
import 'package:mobility_sqr/Screens/Dashboard/AddAgenda.dart';
import 'package:mobility_sqr/Screens/PurposeScreen/purpose_bloc.dart';
import 'package:mobility_sqr/Widgets/AlertForClassDialog_withAnimation.dart';
import 'package:mobility_sqr/Widgets/CountryCodePicker.dart';
import 'package:mobility_sqr/Widgets/CustomColumnEditText.dart';
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
  List<dynamic> userdetails = [];
  List<TravelCity> traveldata = new List<TravelCity>();
  int index = 0;
  int id = 1;
  String radioButtonItem = 'ONE';
  SearchList fromData = SearchList(countryName: "", airportName: "", city: "");
  SearchList toData = SearchList(countryName: "", airportName: "", city: "");
  bool accomodationBool = false;
  List<String> dialCode = new List<String>();
  var hostPhoneCountry = Country();
  var clientPhoneCountry = Country();
  TextEditingController ProjectTextController;
  TravelReqPayLoad req_data = TravelReqPayLoad();
  BuildContext purposecontext;
  var postLocationList = List<PostLocationData>();
  ApiProvider _appApiProvider = ApiProvider();

  var currentSelectedValue;
  @override
  void initState() {
    super.initState();
    req_data.isBillable = true;

    ProjectTextController = new TextEditingController();
    getDialCode();
    initalizeValues();
  }

  getDialCode() async {
    var _TokenGetter = TokenGetter();
    dialCode = await _TokenGetter.readDialCode() ?? "";
  }

  initalizeValues() {
    showHide data;

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
    modelClass.departureDate = DateTime.now().toString();
    modelClass.returnDate = "";
    modelClass.isClientLocation = false.toString();
    modelClass.accmodationStartDate = modelClass.departureDate;
    modelClass.clientNumberExt = 'Code';
    modelClass.hostPhoneExt = 'Code';
    modelClass.accmodationEndDate = "";
    modelClass.isClientLocation = false.toString();
    modelClass.isAccmodationRequired = false;
    modelClass.purposeList = null;

    traveldata.add(modelClass);
  }

  manageColor(bool show) {
    if (show == false) {
      return AppConstants.APP_THEME_COLOR;
    } else {
      return Colors.grey;
    }
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
    modelClass.departureDate = DateTime.now().toString();
    modelClass.returnDate = "";
    modelClass.accmodationStartDate = modelClass.departureDate;
    modelClass.accmodationEndDate = "";
    modelClass.isClientLocation = false.toString();
    modelClass.clientNumberExt = 'Code';
    modelClass.hostPhoneExt = 'Code';
    modelClass.isAccmodationRequired = false;
    modelClass.sourceCity = traveldata[index - 1].destinationCity;
    modelClass.travellingCountry = traveldata[index - 1].travellingCountryTo;

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          titleSpacing: 0.0,
          title: Text(
            "New Request",
            style: TextStyle(
                color: AppConstants.TEXT_BACKGROUND_COLOR,
                fontSize: 18,
                fontWeight: FontWeight.w800),
          ),
          actions: [GetNotificationIcon()],
          centerTitle: true,
          iconTheme: IconThemeData(color: AppConstants.TEXT_BACKGROUND_COLOR),
        ),
        backgroundColor: Colors.white,
        body: Container(
          height: 100.0.h,
          width: 100.0.w,
          child: ListView(
            children: [
              Container(
                height: 79.0.h,
                width: 100.0.w,
                child: ListView(
                  children: [
                    Container(
                      height: 10.0.w,
                      width: 100.0.w,
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
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
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: DashboardEditFieldHeader("Travel Type",
                                AppConstants.TEXT_BACKGROUND_COLOR),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: RadioBtn(
                              "Billable",
                              "Non-Billable",
                              1,
                              "Billable",
                              billable: (value) {
                                req_data.isBillable = value;

                                //showDefaultSnackbar(context, value.toString() + "  ");
                              },
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
                                  width: 20,
                                  height: 3.0.h,
                                  margin: EdgeInsets.only(right: 1),
                                  decoration: BoxDecoration(
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
                          width: 45.0.w,
                          margin: EdgeInsets.only(right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 28.0.w,
                                child: GestureDetector(
                                  onTap: () {
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
                                  },
                                  child: Container(
                                    width: 30.0.w,
                                    height: 4.0.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: AppConstants.APP_THEME_COLOR),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: AutoSizeText(
                                          "Add City",
                                          minFontSize: 1,
                                          maxFontSize: 14,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.0.w,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 12.0.w,
                                  height: 4.0.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: AppConstants.APP_THEME_COLOR),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: AutoSizeText(
                                        "Delete",
                                        minFontSize: 1,
                                        maxFontSize: 14,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ),
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
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      height: 60.0.h,
                      width: 100.0.w,
                      child: ScrollablePositionedList.builder(
                        itemScrollController: itemScrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 92.0.w,
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              child: SingleChildScrollView(
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
                                              onTap: () async {
                                                dynamic fromplace =
                                                    await Navigator.pushNamed(
                                                        context,
                                                        '/SearchPlace');
                                                if (fromplace != null) {
                                                  this.setState(() {
                                                    traveldata[index]
                                                            .sourceCity =
                                                        fromplace.city;
                                                    traveldata[index]
                                                            .travellingCountry =
                                                        fromplace.countryName;
                                                  });
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
                                                    onTap: () async {
                                                      var data = await Navigator
                                                          .pushNamed(context,
                                                              '/SearchPlace');
                                                      if (data != null) {
                                                        this.setState(() {
                                                          toData = data;
                                                          traveldata[index]
                                                                  .destinationCity =
                                                              toData.city;
                                                          traveldata[index]
                                                                  .travellingCountryTo =
                                                              toData
                                                                  .countryName;
                                                        });

                                                        BlocProvider.of<
                                                                    PurposeBloc>(
                                                                context)
                                                            .add(FetchPurposelist(
                                                                toData
                                                                    .iataCode));
                                                        _appApiProvider.GetPostLocation(toData.countryName).then((value) => this.setState(() {

                                                          postLocationList=value.data;
                                                        }));

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
                                            "hint",
                                            "${getDepartureDate(traveldata[index].departureDate)}",
                                            "${getDepatureDay(traveldata[index].departureDate)}",
                                            "Departure",
                                            2,
                                            onTap: () {
                                              selectDate(
                                                  context,
                                                  DateTime.parse(
                                                      traveldata[index]
                                                          .departureDate),
                                                  DateTime(2100),
                                                  datevalue: (data) {
                                                this.setState(() {
                                                  traveldata[index]
                                                      .departureDate = data;
                                                });
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        getdepatureview()
                                            ? Expanded(
                                                flex: 1,
                                                child: CustomColumnEditText(
                                                  "Select Date",
                                                  "${getDepartureDate(traveldata[index].returnDate.toString())}",
                                                  "${getDepatureDay(traveldata[index].returnDate.toString())}",
                                                  "Return",
                                                  2,
                                                  onTap: () {
                                                    selectDate(
                                                        context,
                                                        DateTime.parse(
                                                            traveldata[index]
                                                                .departureDate),
                                                        DateTime(2100),
                                                        datevalue: (data) {
                                                      this.setState(() {
                                                        traveldata[index]
                                                            .returnDate = data;
                                                      });
                                                    });
                                                  },
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    top: BorderSide(
                                                        color: AppConstants
                                                            .APP_THEME_COLOR),
                                                    right: BorderSide(
                                                        color: AppConstants
                                                            .APP_THEME_COLOR),
                                                    left: BorderSide(
                                                        color: AppConstants
                                                            .APP_THEME_COLOR))),
                                            child: GestureDetector(
                                              onTap: () async {
                                                var travelList =
                                                    traveldata[index]
                                                        .purposeList;
                                                if (travelList != null) {
                                                  dynamic purposelist =
                                                      await Navigator.pushNamed(
                                                          context,
                                                          '/PurposeScreen',
                                                          arguments: {
                                                        "list": travelList
                                                      });
                                                } else {
                                                  showDefaultSnackbar(context,
                                                      "Please choose the Destination point");
                                                }
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Text(
                                                  "Purpose of Travel",
                                                  style: TextStyle(
                                                      color: AppConstants
                                                          .APP_THEME_COLOR,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            )),
                                        customBorderBox(
                                            "Visa", false, Icons.remove_red_eye,
                                            ontouch: () {
                                          showCustomDialogClass(
                                            context,
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              margin: EdgeInsets.only(left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    child: Text(
                                                      "Visa Details",
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      child: Text(
                                                          "Applicable visa:Work"),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                    flex: 1,
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      child: Text(
                                                          "Number:dl001002"),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                    ),
                                                    flex: 1,
                                                  ),
                                                  Expanded(
                                                      child: Align(
                                                        child: Text(
                                                            "Expiry date:06-Aug-2020"),
                                                        alignment: Alignment
                                                            .centerLeft,
                                                      ),
                                                      flex: 1),
                                                  Expanded(
                                                    child: SizedBox(),
                                                    flex: 4,
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
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
                                        Expanded(
                                          child: customBorderBox(
                                              "Agenda", false, Icons.add,
                                              ontouch: () {
                                            showCustomDialogClass(
                                                context, AddAgenda());
                                          }),
                                          flex: 1,
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
                                                  "hint",
                                                  "${getDepartureDate(traveldata[index].accmodationStartDate)}",
                                                  "${getDepatureDay(traveldata[index].accmodationStartDate)}",
                                                  "Start Date",
                                                  2,
                                                  onTap: () {
                                                    selectDate(
                                                        context,
                                                        DateTime.parse(traveldata[
                                                                index]
                                                            .accmodationStartDate),
                                                        DateTime(2100),
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
                                                  "hint",
                                                  "${getDepartureDate(traveldata[index].accmodationEndDate)}",
                                                  "${getDepatureDay(traveldata[index].accmodationEndDate)}",
                                                  "End Date",
                                                  2,
                                                  onTap: () {
                                                    selectDate(
                                                        context,
                                                        DateTime.parse(traveldata[
                                                                index]
                                                            .accmodationStartDate),
                                                        DateTime.parse(
                                                            traveldata[index]
                                                                .returnDate),
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
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Host Contact",
                                        style: TextStyle(
                                            color: AppConstants.APP_THEME_COLOR,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
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
                                        ?
                                    // DashboardCustomEditField(
                                    //         "Location",
                                    //         true,
                                    //         Icons.arrow_drop_down_sharp,
                                    //         1,
                                    //         onChange: (text) {
                                    //           traveldata[index].officeLocation =
                                    //               text;
                                    //         },
                                    //       )
                                    Container(
                                      width:100.0.w,
                                     height: 40,
                                      child: FormField<String>(
                                        builder: (FormFieldState<String> state) {
                                          return
                                            InputDecorator(
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.zero,
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(5.0))),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  hint: Text("Location"),
                                                  value: currentSelectedValue,
                                                  isDense: true,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      currentSelectedValue = newValue;
                                                    });
                                                    print(currentSelectedValue);
                                                  },
                                                  items: postLocationList.map((PostLocationData value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value.locationName,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Text(value.locationName),
                                                      ),
                                                    );
                                                  }).toList(),
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
                                                    traveldata[index]
                                                        .clientName = text;
                                                  },
                                                ),
                                                DashboardCustomEditField(
                                                  "Client Address",
                                                  false,
                                                  Icons.arrow_drop_down_sharp,
                                                  2,
                                                  onChange: (text) {
                                                    traveldata[index]
                                                        .clientAddress = text;
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
                                                            traveldata[index]
                                                                    .clientNumber =
                                                                text;
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
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Travelling with dependent(s)?",
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
                                                value: false,
                                                onToggle: (value) {
                                                  traveldata[index]
                                                      .isDependent = value;
                                                  req_data.travelCity =
                                                      traveldata;

                                                  if (value) {
                                                    Navigator.pushNamed(
                                                        context, '/Dependents');
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                margin: EdgeInsets.only(right: 10, left: 10),
                height: 10.0.w,
                width: 100.0.w,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: AppConstants.APP_THEME_COLOR)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/AddNewTravel2');
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

  getValue(value) {
    if (value == 'true') {
      return 2;
    } else {
      return 1;
    }
  }

  Future<Null> selectDate(
      BuildContext context, DateTime inital_date, DateTime end_date,
      {Function(String) datevalue}) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: inital_date,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppConstants.APP_THEME_COLOR,
              accentColor: AppConstants.APP_THEME_COLOR,
              colorScheme: ColorScheme.light(
                primary: AppConstants.APP_THEME_COLOR,
              ),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          );
        },
        firstDate: inital_date,
        lastDate: end_date);
    if (picked != null) {
      datevalue(picked.toIso8601String());
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

  getdepatureview() {
    if (traveldata.length <= 1) {
      return true;
    } else {
      return false;
    }
  }


}
