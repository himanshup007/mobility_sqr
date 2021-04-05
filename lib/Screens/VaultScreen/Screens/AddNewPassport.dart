import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/RelationList.dart';
import 'package:mobility_sqr/Screens/TravelCalendar/customEventWidget.dart';
import 'package:mobility_sqr/Util/UtilClass.dart';

import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:sizer/sizer.dart';

class AddNewPassport extends StatefulWidget {
  @override
  _AddNewPassportState createState() => _AddNewPassportState();
}

class _AddNewPassportState extends State<AddNewPassport> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TokenGetter _getter = TokenGetter();
  List<Relation> relationList = [];
  Relation selectedRelation;
  bool isSelf = true;

  @override
  void initState() {
    super.initState();
    getRelationList();
  }

  getRelationList() async {
    RelationList data = await _getter.readRelationList();
    if (data != null) {
      this.setState(() {
        relationList.addAll(data.data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0.0,
        title: Text(
          "Add Passport",
          style: TextStyle(
              color: AppConstants.TEXT_BACKGROUND_COLOR,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          GetNotificationIcon(context),
        ],
      ),
      body: Container(
        height: 100.0.h,
        width: 100.0.w,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Passport For',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                FlutterSwitch(
                  height: 25.0,
                  width: 60.0,
                  padding: 2.0,
                  toggleSize: 25.0,
                  valueFontSize: 12.0,
                  borderRadius: 12.0,
                  showOnOff: true,
                  inactiveColor: Colors.black12,
                  activeColor: AppConstants.APP_THEME_COLOR,
                  value: isSelf,
                  onToggle: (value) {
                    print(value);
                    this.setState(() {
                      isSelf = !isSelf;
                    });
                  },
                ),
              ],
            ),
            isSelf
                ? Container(
                    width: 90.0.w,
                    height: 40,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: FormField<RelationList>(
                      builder: (FormFieldState<RelationList> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Relation>(
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("Select Relation"),
                              ),
                              value: selectedRelation,
                              isDense: true,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedRelation = newValue;
                                });
                              },
                              items: relationList != null
                                  ? relationList.map((Relation value) {
                                      return DropdownMenuItem<Relation>(
                                        value: value,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(value.description),
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
                    width: 90.0.w,
                    height: 40,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Self",
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Passport Active',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                FlutterSwitch(
                  height: 25.0,
                  width: 60.0,
                  padding: 2.0,
                  toggleSize: 25.0,
                  borderRadius: 12.0,
                  valueFontSize: 12,
                  showOnOff: true,
                  inactiveColor: Colors.black12,
                  activeColor: AppConstants.APP_THEME_COLOR,
                  value: isSelf,
                  onToggle: (value) {
                    print(value);
                    this.setState(() {
                      isSelf = !isSelf;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Is this a duplicate passport?',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                FlutterSwitch(
                  height: 25.0,
                  width: 60.0,
                  padding: 2.0,
                  toggleSize: 25.0,
                  borderRadius: 12.0,
                  valueFontSize: 12,
                  showOnOff: true,
                  inactiveColor: Colors.black12,
                  activeColor: AppConstants.APP_THEME_COLOR,
                  value: isSelf,
                  onToggle: (value) {
                    print(value);
                    this.setState(() {
                      isSelf = !isSelf;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Passport Number",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50.0.w,
                  height: 40,
                  child: new TextField(
                    maxLength: 16,
                    style: TextStyle(fontSize: 18),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: new InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nationality",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 50.0.w,
                  height: 40,
                  child: new TextField(
                    maxLength: 16,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: new InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Country of Issue",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 50.0.w,
                    height: 40,
                    child: new TextField(
                      maxLength: 16,
                      style: TextStyle(fontSize: 18),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: new InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.only(left: 10),
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Place of Issue",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 50.0.w,
                    height: 40,
                    child: new TextField(
                      maxLength: 16,
                      style: TextStyle(fontSize: 18),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: new InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.only(left: 10),
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                      ),
                    ),
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
                SizedBox(
                  child:
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Text(
                      "Date of Issue",
                      style: TextStyle(

                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 50.0.w,
                  child: CustomEventWidget(
                      getDepartureEventFormat(DateTime.now().toString()),
                      "Date of Issue",
                      Icons.calendar_today,
                      context, onTap: () {
                    selectDate(
                        context, DateTime(2010), DateTime(2100), DateTime.now(),
                        datevalue: (selDate) {});
                  }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child:
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Text(
                      "Date of Expiration",
                      style: TextStyle(

                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 50.0.w,
                  child: CustomEventWidget(
                      getDepartureEventFormat(DateTime.now().toString()),
                      "Date of Expiration",
                      Icons.calendar_today,
                      context, onTap: () {
                    selectDate(
                        context, DateTime(2010), DateTime(2100), DateTime.now(),
                        datevalue: (selDate) {});
                  }),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(

                  child: Text(
                    "Empty pages left in the passport",
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 10.0.w,
                  height: 40,
                  child: new TextField(
                    maxLength: 16,
                    style: TextStyle(fontSize: 18),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: new InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            FittedBox(
              child: Container(
                  width: 100.0.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: GestureDetector(
                            onTap: () async {

                            },
                            child: ClayContainer(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 25,
                                      ),
                                      Text("Choose File")

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          width: 60.0.w,
                          child: TextField(
                            maxLength: 20,
                            style: TextStyle(fontSize: 18),
                            enabled: false,
                            decoration: new InputDecoration(
                                counterText: '',
                                contentPadding: EdgeInsets.all(5),
                                hintText: "Document Name ",
                                border: new OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Colors.grey))),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
