import 'dart:convert';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mobility_sqr/LocalStorage/TokenGetter.dart';
import 'package:mobility_sqr/ModelClasses/AddReqPayLoad.dart';
import 'package:mobility_sqr/ModelClasses/CurrencyConversionModel.dart';
import 'package:mobility_sqr/ModelClasses/PerDiemModelClass.dart';
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
  var _TokenGetter = TokenGetter();

  BuildContext dialogContext;
  List<currency_data> _currencyConversiondata;

  UserInfo info;

  String HomeCountryName;
  TravelReqPayLoad list;


  getDialCode() async {

    dialCode = await _TokenGetter.readDialCode() ?? "";
  }
  getvalues() async {
    info = await _TokenGetter.readUserInfo() ?? null;
    HomeCountryName = info.data.home;
  }
  @override
  Future<void> initState() {

    super.initState();
    getDialCode();
    getvalues();
  }
  getValuesforCurrencyConversion() async {

await _appApiProvider.get_currency_conversion().then((value) => setCurrencyValue(value) );


  }
  setCurrencyValue(CurrencyConversionModel value){
    if(value.status=="Success"){
      _currencyConversiondata=value.data;

    }else{

    }

  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute
        .of(context)
        .settings
        .arguments;
     list = args['list'];
    PerDiemModel perDiem = args['perDiem'];
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
              child: TextFormField(
                style:
                TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
                initialValue: list.homeContactName!=null?list.homeContactName:"",
                onChanged: (text) {
                  list.homeContactName = text;
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
              child: Row(
                children: [
                  list.homePhoneExt == 'Code'
                      ? Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Container(child: Icon(Icons.arrow_drop_down)),
                  )
                      : Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Container(
                      child: CountryPickerUtils.getDefaultFlagImage(
                          list.homeCountry),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: GestureDetector(
                      onTap: () {
                        openCountryPickerDialog(context, callback: (value) {
                          this.setState(() {
                            list.homePhoneExt = "+" + value.phoneCode;
                            list.homeCountry = value;
                          });
                        }, dialCode: dialCode);
                      },
                      child: Container(
                        child: Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                list.homePhoneExt,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
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
                    child: GestureDetector(
                      child: Container(

                        child: TextFormField(
                          initialValue: list.homePhoneNumber!=null?list.homePhoneNumber:"",
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false),
                          inputFormatters:[FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppConstants.APP_THEME_COLOR),

                              ),
                              border: new UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.black12)),
                              hintText: "Enter Phone No",

                              hintStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: AppConstants.TEXT_BACKGROUND_COLOR,


                              ),
                              focusColor: AppConstants.APP_THEME_COLOR,

                                  ),
                          onChanged: (text){
                           list.homePhoneNumber=text;
                          },
                        ),
                      ),
                    )
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
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
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
                      list.isLaptopRequired = !list.isLaptopRequired;
                    });
                    if (!list.isLaptopRequired) {
                      list.haveLaptop = false;
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            list.isLaptopRequired
                ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Do you have a laptop?',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
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
                          list.haveLaptop = !list.haveLaptop;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            )
                : SizedBox(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Additional note',
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: TextFormField(
                initialValue: list.remark!=null?list.remark:"",
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                maxLines: 7,
                maxLength: 1000,
                onChanged: (text) {
                  list.remark = text;
                },
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.0,
                  color: Colors.black,
                ),
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
                style: TextStyle(fontSize: 13.0, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  showCustomDialogClass(
                      context, ApproxTravelCost(list, perDiem));
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
                        style: BorderStyle.solid),
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

                    try{
                      list=SetDependentList(list);
                    }catch(e){

                    }

                    for(int i=0;i<list.travelCity.length;i++){

                      if(list.travelCity.length>1){

                      if(i==list.travelCity.length-1){
                        list.travelCity[i].returnDate=list.travelCity[i].departureDate;
                      }
                      else{
                        list.travelCity[i].returnDate=list.travelCity[i+1].departureDate;
                      }

                      }
                    }



                    //list.travelVisa.addAll(GenerateVisa(list,info,HomeCountryName));

if(list.travelCity.length>1){
  list.isTravelMultiCity = true;
  list.isTravelMultiCountry = true;
}else{
  list.isTravelMultiCity = false;
  list.isTravelMultiCountry = false;

}

                    list.createdBy = list.empEmail;
                    list.expenceCureency = "USD";
                    list.expenceFromCountry =
                        list.travelCity[0].travellingCountry;
                    list.expenceToCountry =
                        list.travelCity[0].travellingCountryTo;
                    list.expenceReturnDate = list.travelCity[0].returnDate;
                    list.expenceDepartureDate =
                        list.travelCity[0].departureDate;
                    list.expenceEstimatedCost = "200";
                    list.travelReqStatus = "1";

                    _onLoading();
                    var jsonbody = jsonEncode(list.toJson());
                    _appApiProvider.PostTravelRequest(jsonbody)
                        .then((response) => handleNavigation(response));
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom,
            ),
          ],
        ),
      ),
    );
  }


SetDependentList(TravelReqPayLoad list){
  DependentData dependentData;
  for(int i=0;i<list.travelCity.length;i++){

    for(int j=0;j<list.travelCity[i].myDependentList.length;j++){


      if(list.travelCity[i].myDependentList[j].isSelected){
        dependentData= new DependentData(dependentName:list.travelCity[i].myDependentList[j].name,dependentRelation: list.travelCity[i].myDependentList[j].relationship,reqId: "0");

        list.travelCity[i].dependentData.add(dependentData );
        dependentData=null;

      }

    }

  }
  return list;
}




  setValues(TravelReqPayLoad ReqBody) async {
    var _TokenGetter = TokenGetter();
    UserInfo userInfo = await _TokenGetter.readUserInfo() ?? null;

    ReqBody.organization = userInfo.data.organization;
    ReqBody.empEmail = userInfo.data.empCode;
  }

  handleNavigation(TravelReqResponseModel submitTravelReqResponse) {
    Navigator.of(context, rootNavigator: true).pop(dialogContext);
    if (submitTravelReqResponse.status == true) {
      Navigator.pushNamed(context, '/SuccessfullyAdded');
    } else {
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
            child: LoadingBouncingGrid.circle(
              size: 50,
              backgroundColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}

GenerateVisa(TravelReqPayLoad mydata, UserInfo info,String homeCountryName)  {
  bool isHomeCountry = false;

  List<TravelVisa> visalist= new List<TravelVisa>();
  TravelVisa visa;
  for (int i = 0; i < mydata.travelCity.length; i++) {
    if (homeCountryName.trim().toLowerCase() ==
        mydata.travelCity[i].travellingCountryTo.trim().toLowerCase()) {
      isHomeCountry = true;
    }
    if(!isHomeCountry){
    for(int j=0;j<mydata.travelCity[i].dependentData.length;j++){


        visa= new TravelVisa();
        visa.reqId = "0";
        visa.projectId = mydata.project;
        visa.projectName = mydata.projectName;
        visa.isBillable = mydata.isBillable;
        visa.fromCity = mydata.travelCity[i].travellingCountry;
        visa.toCity = mydata.travelCity[i].travellingCountryTo;
        visa.travelStartDate =  DateTime.parse(mydata.travelCity[i].departureDate).toUtc().toIso8601String();
        if(mydata.travelCity.length==1){
          visa.travelEndDate = DateTime.parse(mydata.travelCity[i].returnDate).toUtc().toIso8601String();
        }else if(i==mydata.travelCity.length-1){
          visa.travelEndDate=DateTime.parse(mydata.travelCity[i].departureDate).toUtc().toIso8601String();
        }
        else{
          visa.travelEndDate=DateTime.parse(mydata.travelCity[1+1].departureDate).toUtc().toIso8601String();
        }

        if(mydata.travelCity[i].travelPurpose=="Work"){
          visa.visaPurpose = "19";
        }else{
          visa.visaPurpose = "6";
        }



        visa.appliedVisa = mydata.travelCity[i].travelPurpose;
        visa.requestNotes = "";
        visa.visaStatus = "1";
        visa.empEmail = info.data.empCode;
        visa.organization = info.data.orgId;
        visa.visaReqId = "";
        visa.isDependent = true;
        visa.dependentRelation = mydata.travelCity[i].dependentData[j].dependentRelation;
        visa.dependentName = mydata.travelCity[i].dependentData[j].dependentName;
        visa.country ="123";
        visa.createdBy = info.data.empCode;
        visalist.add(visa);
        isHomeCountry=false;
    }
    }


  }


  return visalist;


}
