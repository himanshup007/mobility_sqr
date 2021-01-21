import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mobility_sqr/Widgets/AlertForClassDialog_withAnimation.dart';
import 'package:mobility_sqr/Widgets/ApproxTravelCost.dart';


class AddNewTravel2 extends StatefulWidget {
  @override
  AddNewTravel2State createState() => AddNewTravel2State();
}

class AddNewTravel2State extends State<AddNewTravel2> {

   @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //  top: false,
    //bottom: false,
    bool _switchValue=true;
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
        // width: 100.0.w,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 17.0),
        child: Column(
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
            SizedBox(height: 10),
            Container(
              height: 46.0,
              child: TextField(
                 style:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
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
              child: TextField(
                 style:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter phone no.',
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppConstants.APP_THEME_COLOR))),
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
                   inactiveColor: AppConstants.APP_THEME_COLOR,
                   activeColor: AppConstants.APP_THEME_COLOR,
                    value: _switchValue,
                   onToggle: (value) {
                     setState(() {
                      });
                   },
                 ),
               ],
             ),

            SizedBox(height: 20),

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
                      //Navigator.pushNamed(context, '/Dashboard');
                    },
                  ),
                ],
              ),
           ],
        ),
      ),
     );
  }
}

