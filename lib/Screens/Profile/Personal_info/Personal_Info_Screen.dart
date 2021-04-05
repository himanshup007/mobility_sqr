import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/UserProfileModel.dart';
import 'package:mobility_sqr/Util/UtilClass.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:sizer/sizer.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool iseditable = false;
  ScrollController _scrollController = ScrollController();
ApiProvider _apiProvider =ApiProvider();
  UserProfile _userProfile=UserProfile();
  bool showhideloader=true;

  @override
  void initState() {
    super.initState();

    // _apiProvider.getCountrylist('');
    _apiProvider.get_user_profile().then((value) => this.setState(() {
      _userProfile=value.data[0];
      showhideloader=false;
    })).onError((error, stackTrace) => this.setState(() {
      showhideloader=false;
    }));

    Future.delayed(const Duration(milliseconds: 500), () {


      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease);

    });

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
     // bottom: true,
      top: false,
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,

          title:
              Text("Personal Information", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                this.setState(() {
                  iseditable = !iseditable;
                });
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                height: 23,
                width: 23,
                child: Image.asset(
                  'assets/images/edit.png',
                  fit: BoxFit.contain,
                  color:
                      iseditable ? Colors.black12 : AppConstants.APP_THEME_COLOR,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          height: 100.0.h,
          margin: EdgeInsets.only(top: 10),
          child: Stack(
            children: [
              Container(
                height: Get.height*0.8,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  reverse: true,
                  child: Column(
                    children: [
                      ColumnWidget('User Name', 'Enter User Name', iseditable, false,myText: _userProfile.userName,),
                      ColumnWidget('Business Email', 'Enter Business Email', iseditable, false,myText: _userProfile.email,),
                      ColumnWidget('First Name', 'Enter First Name', iseditable, false,myText: _userProfile.firstName,),
                      ColumnWidget('Middle Name', 'Enter Middle Name', iseditable, false,myText: _userProfile.middleName,),
                      ColumnWidget('Last Name', 'Enter Last Name', iseditable, false,myText: _userProfile.lastName,),
                      ColumnWidget('Date of Joining', 'Enter Date', iseditable, true,icon: Icons.calendar_today_rounded,myText:_userProfile.dateCreated!=null?getDepartureTime(_userProfile.dateCreated):"",),
                      ColumnWidget('Email Address', 'Enter Email Address', iseditable, false,myText: _userProfile.email,),
                      ColumnWidget('Country of Birth', 'Select Country of Birth',iseditable, true,myText: _userProfile.countryOfBirth!=null?_userProfile.countryOfBirth:"",),
                      ColumnWidget('Marital Status', 'Select Marital Status', iseditable, true,myText: _userProfile.maritalStatus,),
                      ColumnWidget('Date of Birth', 'Enter Date', iseditable, true,icon: Icons.calendar_today_rounded,myText: _userProfile.dob!=null?getDepartureTime(_userProfile.dob):"",),
                      ColumnWidget('Nationality', 'Select Nationality', iseditable, true,myText: _userProfile.nationality,),
                      ColumnWidget('Supervisor', 'Search...', iseditable, false,myText: _userProfile.supervisorName,),

                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom))
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 1,
                right: 0,
                left: 0,

                child: Center(
                  child: Container(
                     width: MediaQuery.of(context).size.width * 0.95,
                     height: 45,
                    child: FlatButton(
                      child: Text(
                        'DONE',
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                      textColor: Colors.white,
                      color: AppConstants.APP_THEME_COLOR,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Dashboard');
                      },
                    ),
                  ),
                ),
              ),

              Container(

                width: Get.height,
                child: showMobilityLoader(showhideloader, Colors.transparent),
              )
            ],

          ),

        ),
      ),
    );

    // ColumnWidget('assets/images/emergency_contact.png',
    //   "Emergency Contacts", onTap:(){},),
    //    );
  }
}

class ColumnWidget extends StatelessWidget {
   VoidCallback onTap;

  ColumnWidget(this.label, this.hint, this.iseditable, this.showDropdown ,{this.icon,this.myText}
      //{@required this.onTap}
      );
  String myText;
  IconData icon;
  final String label;
  final bool iseditable;
  final bool showDropdown;
  final dynamic hint;
  TextEditingController _textEditingController= TextEditingController();



  @override
  Widget build(BuildContext context) {

    _textEditingController.text=myText;
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppConstants.TEXT_BACKGROUND_COLOR,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
              )),
          //SizedBox(height: 5),
          TextFormField(

            controller: _textEditingController,

            style: TextStyle(
              fontSize: 16.0,
              height: 1.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                suffixIcon: showDropdown
                    ? icon!=null?Icon( icon,
                  color: iseditable?AppConstants.APP_THEME_COLOR:Colors.grey,
                  size: 25,):Icon(
                        Icons.arrow_drop_down,
                       color: iseditable?AppConstants.APP_THEME_COLOR:Colors.grey,
                        size: 25,
                      )
                    : null,
                // contentPadding: EdgeInsets.fromLTRB(0, 9, 0, 7),
                 enabled: iseditable,
                isDense: true,
                border: UnderlineInputBorder(),
                hintText: hint,
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppConstants.APP_THEME_COLOR))),
          ),
        ],
      ),
    );
  }
}
