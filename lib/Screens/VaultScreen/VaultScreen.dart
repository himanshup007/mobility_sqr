import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_animated_container.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/PassportModel.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/ModelClasses/VisaModel.dart';
import 'package:mobility_sqr/Screens/Profile/Profile_Screen.dart';

import 'package:flutter/material.dart';
import 'package:mobility_sqr/Screens/VaultScreen/Screens/PassportScreen.dart';
import 'package:mobility_sqr/Screens/VaultScreen/Screens/VaultTypeScreen.dart';
import 'package:mobility_sqr/Screens/VaultScreen/Screens/VisaScreen.dart';
import 'package:mobility_sqr/Widgets/AlertForClassDialog_withAnimation.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:sizer/sizer.dart';

class VaultScreen extends StatefulWidget {
  static String id = 'Vault_screen';

  @override
  _VaultScreenState createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
  ScrollController controller = ScrollController();
  ApiProvider _apiProvider = ApiProvider();
  TokenGetter userInfo = TokenGetter();
  PassportModel _user_passport;

  VisaModel _visaModel;
  String empcode = "";
  bool showloader = true;


  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() async {
    UserInfo _userinfo = await userInfo.readUserInfo() ?? null;
    empcode = _userinfo.data.empCode;
    getPassport(empcode);
    getVisa(empcode);
  }

  getPassport(String empcode) async {

    await _apiProvider
        .get_employee_passport(empCode: empcode)
        .then((value) => this.setState(() {
              _user_passport = value;
              showloader = false;
            }))
        .catchError((onError) => this.setState(() {
              this.setState(() {
                showloader = false;
              });
            }));
  }

  getVisa(String empcode) async{
    this.setState(() {
      showloader = true;
    });
    await _apiProvider.get_employee_visa(empCode: empcode).then((value) => this.setState(() {
      _visaModel = value;
      showloader = false;
    }))
        .catchError((onError) => this.setState(() {
      this.setState(() {
        showloader = false;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        titleSpacing: 0.0,
        title: Text(
          "Vault",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          SizedBox(
            width: 40,
          ),
          GetNotificationIcon(context),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: controller,
                child: Container(
                  height: height,
                  width: width,
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: tabWidget(
                                  'assets/images/passport.png', "Passport             ",
                                  onClick: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PassportScreen(_user_passport.data)),
                                );
                              }),
                            ),
                            Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                              flex: 4,
                              child:
                                  tabWidget('assets/images/visa.png', "Visa                                  ",onClick: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VisaScreen(_visaModel.data)),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: tabWidget('assets/images/resident_card.png',
                                "Residence Card             ",onClick: (){

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VaultTypeScreen('Residence')),
                                  );

                                }),
                          ),
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 4,
                            child: tabWidget('assets/images/medical_card.png',
                                "Medical Card             "),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: tabWidget(
                                'assets/images/national_id_tile.png', "National ID               "),
                          ),
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 4,
                            child: tabWidget(
                                'assets/images/assignement_letters.png',
                                "Assignment Letters"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: tabWidget('assets/images/invite_letters.png',
                                "Invite Letters     "),
                          ), Expanded(flex: 1, child: SizedBox()),
                          Expanded(flex: 4, child: tabWidget(
                              'assets/images/other_cards.png',
                              "Other Cards        ", onClick: () {

                          }),
                          ),
                          // Expanded(
                          //   flex: 4,
                          //   child: tabWidget('assets/images/assignement_letters.png',"Assignment Letters"),
                          // ),
                        ],
                      ), //invite_letters
                    ],
                  ),
                ),
              ),
              showMobilityLoader(showloader, Colors.white70)
            ],
          ),
        ),
      ),
    );
  }



  addTab() {
    showCustomDialogClass(
        context,
        Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Add Vault ",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Enter Title",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppConstants.TEXT_BACKGROUND_COLOR,
                        fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
tabWidget(String image, String title, {VoidCallback onClick}) {
  return GestureDetector(
    onTap: () {
      onClick();
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          image,
        ),
        Container(
          margin: EdgeInsets.only(top: 15.0.w,left: 10),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        )
      ],
    ),
  );
}