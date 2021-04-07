import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:mobility_sqr/Widgets/RadioWidget.dart';
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
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    "Onsite Compliance Questions :- ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuestionCard(
                        question:
                            "1. Has your current work location changed / set to change from your original assigned location?",
                      ),
                      SizedBox(height: 10,),
                      QuestionCard(
                        question:
                            "2. Has your job role changed recently or set to change?",
                      ),
                      SizedBox(height: 10,),
                      QuestionCard(
                        question:
                            "3. Has your project code/id changed or set to change?",
                      ),
                      SizedBox(height: 10,),QuestionCard(
                        question:
                            "4. Has your salary decreased from original offered salary or set to decrease?",
                      ),
                      SizedBox(height: 10,),
                      QuestionCard(
                        question:
                        '5. Have your work hours increased or set to increase?',
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                )
                // _customWidget(
                //     '1. Has your current work location changed / set to change from your original assigned location?'),
                // _customWidget(
                //     '2. Has your job role changed recently or set to change? '),
                // _customWidget(
                //     '3. Has your project code/id changed or set to change?'),
                // _customWidget(
                //     '4. Has your salary decreased from original offered salary or set to decrease?'),
                // _customWidget(
                //     '5. Have your work hours increased or set to increase?')
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: AppConstants.APP_THEME_COLOR)),
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

  // _customWidget(String title) {
  //   return Padding(
  //     padding: const EdgeInsets.all(20.0),
  //     child: Container(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           SizedBox(
  //               width: 70.0.w,
  //               child: Text(
  //                 title,
  //                 maxLines: 2,
  //               )),
  //           ToggleSwitch(
  //             minWidth: 40.0,
  //             minHeight: 30.0,
  //             fontSize: 10.0,
  //             initialLabelIndex: 1,
  //             activeBgColor: AppConstants.APP_THEME_COLOR,
  //             activeFgColor: Colors.white,
  //             inactiveBgColor: Colors.black26,
  //             inactiveFgColor: Colors.white,
  //             labels: ['Yes', 'No'],
  //             onToggle: (index) {
  //               print('switched to: $index');
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({this.question});
  final String question;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Color(0xffe8e1f3),
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: Get.height / 7,
        child: Column(
          children: [
            Text(
              question,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Transform.scale(
                    scale: 1.5,
                    child: Radio(
                        value: "",
                        groupValue: "",
                        onChanged: null,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => AppConstants.APP_THEME_COLOR))),
                Text("Yes"),
                SizedBox(
                  width: Get.width / 6,
                ),
                Transform.scale(
                    scale: 1.5,
                    child: Radio(
                        value: "",
                        groupValue: "",
                        onChanged: null,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey))),
                Text("No"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
