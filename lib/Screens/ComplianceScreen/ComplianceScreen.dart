import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:sizer/sizer.dart';

class ComplianceScreen extends StatefulWidget {
  @override
  _ComplianceScreenState createState() => _ComplianceScreenState();
}

class _ComplianceScreenState extends State<ComplianceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        titleSpacing: 0.0,
        title: Text(
          "Onsite Compliance",
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
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            ListView(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 15),
                  child: Text("Onsite Compliance Questions :- ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                ),
                Divider(thickness: 1,),
                _customWidget(
                    '1. Has your current work location changed / set to change from your original assigned location?'),
                _customWidget('2. Has your job role changed recently or set to change? '),
                _customWidget('3. Has your project code/id changed or set to change?'),
                _customWidget('4. Has your salary decreased from original offered salary or set to decrease?'),
                _customWidget('5. Have your work hours increased or set to increase?')
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: AppConstants.APP_THEME_COLOR,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),

                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _customWidget(String title) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: 70.0.w,
                child: Text(
                  title,
                  maxLines: 2,
                )),
            ToggleSwitch(
              minWidth: 40.0,
              minHeight: 30.0,
              fontSize: 10.0,
              initialLabelIndex: 1,
              activeBgColor: Colors.red,
              activeFgColor: Colors.white,
              inactiveBgColor: AppConstants.APP_THEME_COLOR,
              inactiveFgColor: Colors.white,
              labels: ['Yes', 'No'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          ],
        ),
      ),
    );
  }
}
