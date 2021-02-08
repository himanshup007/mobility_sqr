import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/ActionHistoryModel.dart';
import 'package:mobility_sqr/ModelClasses/PerDiemModelClass.dart';
import 'package:sizer/sizer.dart';
import 'package:currency_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:currency_pickers/currency_pickers.dart';
import 'package:mobility_sqr/ModelClasses/AddReqPayLoad.dart';

class ActionHistory extends StatefulWidget {
  VoidCallback onclose;
  ActionHistoryModel historyData;

  ActionHistory(this.historyData, {this.onclose});

  @override
  _ActionHistoryState createState() => _ActionHistoryState();
}

class _ActionHistoryState extends State<ActionHistory> {
  TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0.h,
      width: 100.0.w,
      child: Column(
        children: [
          Stack(children: [
            Center(
              child: Text(
                "Action History",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  widget.onclose();
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ImageIcon(
                      AssetImage(
                        'assets/images/close.png',
                      ),
                      size: 40,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Container(
            color: Colors.black38,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      "Role",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      child: Text(
                        "Name",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      "Status",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),
                ),
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     child: Text(
                //       "Action Date", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                //
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.historyData.data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  getList(index, widget.historyData.data),
                  SizedBox(
                    height: 10,
                  )
                ],
              );
            },
          ),
          SizedBox(height: 40,),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(child: Row(
                    children: [
                      Text("Approved"),
                      SizedBox(width: 2,),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.green ,
                            shape: BoxShape.circle),
                      ),
                    ],
                  )),
                  Container(
                    child: Row(
                      children: [
                        Text("Rejected"),
                        SizedBox(width: 2,),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.red ,
                              shape: BoxShape.circle),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text("In Progress"),
                        SizedBox(width: 2,),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.orange ,
                              shape: BoxShape.circle),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(child: Row(
                    children: [
                      Text("Transferred"),
                      SizedBox(width: 2,),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.purple ,
                            shape: BoxShape.circle),
                      ),
                    ],
                  )),
                  SizedBox(width: 35,),
                  Container(
                    child: Row(
                      children: [
                        Text("Closed"),
                        SizedBox(width: 2,),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.lightGreenAccent ,
                              shape: BoxShape.circle),
                        ),
                      ],
                    ),
                  ),

                ],
              ),


            ],
          )
        ],
      ),
    );
  }

  widgetRow(String role, String name, String  status, String Actiondate) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                "$role",
                style: textStyle,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                child: Text(
                  "$name",
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: getColorViaStatus(status,name) ,
                  shape: BoxShape.circle),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     child: Text(
          //       "$Actiondate",
          //       style: textStyle,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  getColorViaStatus(String status, String name){

    if(name != ""){


    if(status=="1"){
      return Colors.green;
    }
   else if(status=="2"){
      return Colors.orange;
    }
  else  if(status=="3"){
      return Colors.lightGreenAccent;
    }
  else   if(status=="4"){
      return Colors.green;
    }
  else if(status=="5"){
      return Colors.purple;
    }else{
      return Colors.orange;
    }
    }

  }

  getList(i, values) {
    if (i == 0) {
      return widgetRow("Supervisor", values[i].supervisorName,
          values[i].supervisorStatus, " ");
    }
    if (i == 1) {
      return widgetRow("Expense Approver", values[i].expenseApproverName,
          values[i].expenseApproverStatus, " ");
    }
    if (i == 2) {
      return widgetRow("Project Manager", values[i].projectManagerName,
          values[i].projectManagerStatus, " ");
    }
    if (i == 3) {
      return widgetRow("Business Lead", values[i].businessLeadName,
          values[i].businessLeadStatus, " ");
    }
    if (i == 4) {
      return widgetRow(
          "Client Executive Lead",
          values[i].clientExecutiveLeadName,
         values[i].clientExecutiveLeadStatus,
          " ");
    }
  }

  setStatusProgress(String value) {
    if (value.trim().isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
