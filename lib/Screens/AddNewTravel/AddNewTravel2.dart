import 'dart:convert';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mobility_sqr/LocalStorage/TokenGetter.dart';
import 'package:mobility_sqr/ModelClasses/AddReqPayLoad.dart';
import 'package:mobility_sqr/ModelClasses/TravelReqResponse.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/Widgets/AlertForClassDialog_withAnimation.dart';
import 'package:mobility_sqr/Widgets/ApproxTravelCost.dart';
import 'package:mobility_sqr/Widgets/CountryCodePicker.dart';
import 'package:mobility_sqr/Widgets/DashboardEditField.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';
import 'package:sizer/sizer.dart';


class AddNewTravel2 extends StatefulWidget {
  @override
  AddNewTravel2State createState() => AddNewTravel2State();
}

class AddNewTravel2State extends State<AddNewTravel2> {
  Country homePhoneCountry;
  ApiProvider _appApiProvider = ApiProvider();
  var dialCode;

  BuildContext dialogContext;
  getDialCode() async {
    var _TokenGetter = TokenGetter();
    dialCode = await _TokenGetter.readDialCode() ?? "";
  }

  @override
  Future<void> initState()  {
    // TODO: implement initState
    super.initState();
    getDialCode();


  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    TravelReqPayLoad list = args['list'];
    setValues(list);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white38,
        elevation: 0,
        title: Text("New Request", style: TextStyle(color: Colors.black)),
        centerTitle: true,

      ),
      body: Container(
         width: 100.0.w,
        margin: EdgeInsets.symmetric(horizontal: 17.0),
        child: ListView(
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Home Contact",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: AppConstants.APP_THEME_COLOR,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                )),

            Container(
              height: 46.0,
              child: TextField(
                style:
                TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
                onChanged: (text){
                  list.homeContactName=text;

                },
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter name',
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: AppConstants.APP_THEME_COLOR))),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 46.0,
              child:Row(
                children: [

                  list.homePhoneExt ==
                      'Code'
                      ? Padding(
                    padding: EdgeInsets.only(top:5),
                    child: Container(
                        child: Icon(Icons
                            .arrow_drop_down)),
                  )
                      : Padding(
                    padding: EdgeInsets.only(top:5),
                    child: Container(
                      child: CountryPickerUtils
                          .getDefaultFlagImage(
                          list.homeCountry),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:5),
                    child: GestureDetector(
                      onTap: () {
                        openCountryPickerDialog(
                            context,
                            callback: (value) {
                              this.setState(() {
                                list.homePhoneExt =
                                    "+" +
                                        value
                                            .phoneCode;
                                list.homeCountry =
                                    value;
                              });
                            }, dialCode: dialCode);
                      },
                      child: Container(
                        child: Align(
                            alignment: Alignment
                                .center,
                            child: FittedBox(
                              fit: BoxFit
                                  .scaleDown,
                              child: Text(
                                list.homePhoneExt,
                                textAlign:
                                TextAlign
                                    .center,
                                style: TextStyle(
                                    fontSize: 16),
                              ),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 12,
                    child: DashboardCustomEditField(
                      "Enter Phone No",
                      false,
                      Icons.ac_unit,
                      1,
                      onChange: (text) {
                        list.homePhoneNumber =
                            text;
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Do you need a laptop?',
                  style: TextStyle(
                      fontSize: 15.0,fontWeight: FontWeight.w600,color: Colors.black54),
                  textAlign: TextAlign.center,
                ),

                FlutterSwitch(
                  height: 25.0,
                  width: 40.0,
                  padding: 2.0,
                  toggleSize: 20.0,
                  borderRadius: 12.0,
                  inactiveColor: Colors.black12,
                  activeColor: AppConstants.APP_THEME_COLOR,
                  value: list.isLaptopRequired,
                  onToggle: (value) {
                    this.setState(() {
                      list.isLaptopRequired=!list.isLaptopRequired;
                    });
                    if(!list.isLaptopRequired){
                      list.haveLaptop=false;
                    }
                  },
                ),
              ],
            ),

            SizedBox(height: 20),
            list.isLaptopRequired?Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Do you have a laptop?',
                      style: TextStyle(
                          fontSize: 15.0,fontWeight: FontWeight.w600,color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),

                    FlutterSwitch(
                      height: 25.0,
                      width: 40.0,
                      padding: 2.0,
                      toggleSize: 20.0,
                      borderRadius: 12.0,
                      inactiveColor: Colors.black12,
                      activeColor: AppConstants.APP_THEME_COLOR,
                      value: list.haveLaptop,
                      onToggle: (value) {
                        print(value);
                        this.setState(() {
                          list.haveLaptop=!list.haveLaptop;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10,)
              ],
            ):SizedBox(),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Additional note',
                style: TextStyle(
                  fontSize: 16.0, ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),

            Container(
              child: TextField(
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                maxLines: 7,
                maxLength: 1000,

                onChanged: (text){
                  list.remark=text;
                },
                style: TextStyle(
                  fontSize: 16.0, height: 1.0, color: Colors.black,),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppConstants.APP_THEME_COLOR))),
              ),
            ),


            SizedBox(height: 10),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '(Maximum 1000 characters)',
                style: TextStyle(
                    fontSize: 13.0,color: Colors.black54 ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),

            Align(
              alignment: Alignment.centerRight,
              child:FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  showCustomDialogClass(context,ApproxTravelCost());
                },
                child: Text(
                  'View approximate travel cost',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: AppConstants.APP_THEME_COLOR,
                      decoration: TextDecoration.underline),
                  textAlign: TextAlign.right,
                ),
              ),
            ),

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  child: Text(
                    'SAVE',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  height: 40,
                  minWidth: 165,
                  textColor: Colors.amber[600],

                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.amber[600],
                        width: 1,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(10),

                  ),
                  onPressed: () {


                    //Navigator.pushNamed(context, '/Dashboard');
                  },
                ),
                // SizedBox(width: 5),
                FlatButton(
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  height: 40,
                  minWidth: 165,
                  textColor: Colors.white,
                  color: AppConstants.APP_THEME_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    list.isTravelMultiCity=false;
                    list.isTravelMultiCountry=false;
                    list.createdBy=list.empEmail;
                    list.expenceCureency="USD";
                    list.expenceFromCountry=list.travelCity[0].travellingCountry;
                    list.expenceToCountry=list.travelCity[0].travellingCountryTo;
                    list.expenceReturnDate=list.travelCity[0].returnDate;
                    list.expenceDepartureDate=list.travelCity[0].departureDate;
                    list.expenceEstimatedCost="200";
                    list.travelReqStatus="1";

                    _onLoading();
                    var jsonbody= jsonEncode(list.toJson());
                    _appApiProvider.PostTravelRequest(jsonbody).then((response) =>
                        handleNavigation(response)
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }

  setValues(TravelReqPayLoad ReqBody) async {
    var _TokenGetter=TokenGetter();
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;

    ReqBody.organization=userInfo.data.organization;
    ReqBody.empEmail=userInfo.data.empCode;

  }

  handleNavigation(TravelReqResponseModel submitTravelReqResponse){

    Navigator.of(context, rootNavigator: true).pop(dialogContext);
    if(submitTravelReqResponse.status==true){
      Navigator.pushNamed(context, '/SuccessfullyAdded');
  }
    else{
      showDefaultSnackbar(context, submitTravelReqResponse.massage);
    }

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
            child:LoadingBouncingGrid.circle(
              size: 50,
              backgroundColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}


