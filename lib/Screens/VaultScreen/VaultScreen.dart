import 'package:flutter/cupertino.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/Profile/Profile_Screen.dart';

import 'package:flutter/material.dart';
import 'package:mobility_sqr/Widgets/AlertForClassDialog_withAnimation.dart';

class VaultScreen extends StatefulWidget {
  static String id = 'Vault_screen';

  @override
  _VaultScreenState createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                forceElevated: false,
                elevation: 0,
                floating: true,
                pinned: true,
                expandedHeight: 250,
                title: Text('Vault'),
                centerTitle: true,
                backgroundColor: AppConstants.APP_THEME_COLOR,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  )
                ],
                flexibleSpace: Stack(children: [
                  Positioned(
                      child: Image(
                          image: AssetImage('assets/images/banner_bg.png')),
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0),
                ]),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      transform: Matrix4.translationValues(0.0, 0, 100.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Positioned(
                              child: ProfileRowWidget(
                                'assets/images/passport.png',
                                "Passport",
                                onTap: () {},
                              ),
                              bottom: -20,
                              left: 0,
                              right: 0,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            ProfileRowWidget(
                              'assets/images/visa.png',
                              "Visa",
                              onTap: () {},
                            ),
                            ProfileRowWidget(
                              'assets/images/resident_card.png',
                              "Residence Card",
                              onTap: () {},
                            ),
                            ProfileRowWidget(
                              'assets/images/medical_card.png',
                              "Medical Card",
                              onTap: () {},
                            ),
                            ProfileRowWidget(
                              'assets/images/other_cards.png',
                              "Other Cards",
                              onTap: () {},
                            ),
                            ProfileRowWidget(
                              'assets/images/assignement_letters.png',
                              "Assignment Letters",
                              onTap: () {},
                            ),
                            ProfileRowWidget(
                              'assets/images/invite_letters.png',
                              "Invite Letters",
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
                "Add Vault  ",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),

              Row(
                children: [
                  Text("Enter Title",style: TextStyle(fontWeight: FontWeight.bold,color: AppConstants.TEXT_BACKGROUND_COLOR,fontSize: 20),),

                  TextFormField()
                ],
              )
            ],
          ),
        ));
  }
}
