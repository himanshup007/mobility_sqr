import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

import 'package:mobility_sqr/ModelClasses/DependentModel.dart';
import 'package:sizer/sizer.dart';


class Dependents extends StatefulWidget {
  @override
  _DependentsState createState() => _DependentsState();
}

class _DependentsState extends State<Dependents> {
  var checkedValue = false;



  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    List<SecondDependentData> list = args['list'];
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white38,
          elevation: 0,
          title: Text("Travelling with dependents",
              style: TextStyle(color: Colors.black, fontSize: 17.0)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 12,
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                shrinkWrap: false,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            list[index].isSelected = !list[index].isSelected;
                          });
                        },
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Container(

                                child: Column(
                                  children: [
                                    SizedBox(height: 18),
                                    RowWidget("Name", list[index].name),
                                    SizedBox(height: 8),
                                    RowWidget("Relation",
                                        list[index].relationship),
                                    SizedBox(height: 8),
                                    RowWidget(
                                        "Visa Number", list[index].empCode),
                                    SizedBox(height: 8),
                                    RowWidget(
                                        "Passport Number",list[index].city),
                                    SizedBox(height: 8),
                                    RowWidget("Visa Validity", "Valid"),
                                    //SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Checkbox(
                                checkColor: Colors.white,
                                activeColor: AppConstants.APP_THEME_COLOR,
                                value: list[index].isSelected,
                                onChanged: (bool value) {
                                  setState(() {
                                    list[index].isSelected = value;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
                      Container(
                        height: 1,
                        color: Colors.black38,
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
               child: FlatButton(
                 minWidth: MediaQuery.of(context).size.width,
                child: Text(
                'DONE',
                style: TextStyle(fontSize: 17.0),
                textAlign: TextAlign.center,
                  ),

                  textColor: Colors.white,
                  color: AppConstants.APP_THEME_COLOR,
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                Navigator.pop(context,list);
                  },
                ),
                   ),
            ),
          ],
        ));
  }
}

class RowWidget extends StatelessWidget {
  RowWidget(this.keyName, this.value);

  final String keyName;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            child: Text(
              keyName,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 6,
          child: Container(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
