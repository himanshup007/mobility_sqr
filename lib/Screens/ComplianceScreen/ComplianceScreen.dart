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
                _customWidget(
                    '1. Has your current work location changed from original assignment location?'),
                _customWidget('2. Has your job role changed recently ?'),
                _customWidget('3. Has your project code/id changed ?'),
                _customWidget('4. Has your salary decreased from original?'),
                _customWidget('5. Has your work hours increased ?')
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
              activeBgColor: Colors.green,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.grey[900],
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
