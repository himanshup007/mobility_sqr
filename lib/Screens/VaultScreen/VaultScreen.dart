import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_animated_container.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/Profile/Profile_Screen.dart';

import 'package:flutter/material.dart';
import 'package:mobility_sqr/Widgets/AlertForClassDialog_withAnimation.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';

class VaultScreen extends StatefulWidget {
  static String id = 'Vault_screen';

  @override
  _VaultScreenState createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
  var baseColor = Colors.white;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AppConstants.APP_THEME_COLOR,
        onPressed: () {
          addTab();
        },
      ),
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
          GetNotificationIcon(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            controller: controller,
            child: Container(
              height: height,
              width: width,
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              color: Colors.white,
              child: Column(
                children: [
                  Container(

                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child:
                              tabWidget('assets/images/passport.png', "Passport",onClick: (){

                              }),
                        ),
                        Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                          flex: 4,
                          child: tabWidget('assets/images/visa_info.png', "Visa"),
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
                            "Residance Card"),
                      ),
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 4,
                        child: tabWidget(
                            'assets/images/medical_card.png', "Medical Card"),
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
                            'assets/images/other_cards.png', "Other Cards"),
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
                        flex: 5,
                        child: tabWidget('assets/images/invite_letters.png',
                            "Invite Letters"),
                      ),
                      Expanded(flex: 6, child: SizedBox()),
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
        ),
      ),
    );
  }

  tabWidget(String image, String title, {VoidCallback onClick}) {
    return
      RaisedButton(
        onPressed: () { onClick();},
        textColor: Colors.white,
        elevation: 10,
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),

        ),
        child: Container(
          width: 300,
          height: 150,

          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.purple
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image,color: Colors.white,),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w700),
              )
            ],
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
