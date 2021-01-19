import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  color: AppConstants.APP_THEME_COLOR,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        "https://i.imgur.com/BoN9kdC.png")))),
                        SizedBox(height: 10),
                        Text(
                          "Divyanshu Kumar",
                          textScaleFactor: 1.3,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.0),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 50.0,
                  height: 120.0,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: ImageIcon(

                        AssetImage(
                          'assets/images/back_terms_condition.png',
                        ),
                        size: 22,
                        color: Colors.white,

                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -47.0, 0.0),
              child: Column(
                children: [
                  ProfileRowWidget(
                    'assets/images/personal_info.png',
                    "Personal Information",
                    onTap:(){
                      Navigator.pushNamed(
                          context, '/PersonalInfo');
                    },
                  ),
                  ProfileRowWidget('assets/images/emergency_contact.png',
                      "Emergency Contacts", onTap:(){},),
                  ProfileRowWidget('assets/images/passport_info.png',
                      "Passport Information", onTap:(){},),
                  ProfileRowWidget(
                      'assets/images/visa_info.png', "Visa Information", onTap:(){},),
                  ProfileRowWidget(
                      'assets/images/national_id.png', "National ID", onTap:(){},),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ProfileRowWidget extends StatelessWidget {
  VoidCallback onTap;

  ProfileRowWidget(this.image, this.text, {@required this.onTap});

  final String image;
  final dynamic text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: 85,
         child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: ImageIcon(
                      AssetImage(image),
                      size: 29,
                      color: AppConstants.APP_THEME_COLOR,
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 8, 17, 8),
                child: Container(
                  height: double.maxFinite,
                  width: 0.5,
                  color: Colors.black45,
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppConstants.TEXT_BACKGROUND_COLOR),
                ),
              ),
              Expanded(
                flex: 1,
                child: ImageIcon(
                  AssetImage(
                    'assets/images/icon-forward.png',
                  ),
                  size: 18,
                  color: AppConstants.APP_THEME_COLOR,
                ),
              )
            ],
          ),
          elevation: 3,
        ),
      ),
    );
  }
}
