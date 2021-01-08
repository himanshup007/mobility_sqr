
import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/ModelClass.dart';
import 'package:mobility_sqr/ModelClasses/showHide.dart';
import 'package:mobility_sqr/Widgets/DashboardEditField.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:mobility_sqr/Widgets/textFieldProject.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';

class AddCity extends StatefulWidget {
  @override
  _AddCity createState() => _AddCity();
}

class _AddCity extends State<AddCity> {
  TextEditingController nameController = TextEditingController();
  ItemScrollController itemScrollController = ItemScrollController();
  String fullName = '';

  List userdetails = [];
  List traveldata = [];
  int index = 0;

  int id = 1;

  String radioButtonItem='ONE';
  @override
  void initState() {
    super.initState();

    initalizeValues();
  }

  initalizeValues() {
    showHide data;

    data = new showHide();
    data.name = "data${1}";
    data.hide = false;
    userdetails.add(data);

    ModelClass modelClass;

    modelClass = new ModelClass(" ", " ", index);
    traveldata.add(modelClass);
  }

  manageColor(bool show) {
    if (show == false) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  AddNewReq() {
    showHide data;
    data = new showHide();
    data.name = "data${2}";
    data.hide = false;
    userdetails.add(data);
    ModelClass modelClass;

    modelClass = new ModelClass(" ", " ", index);

    for (int i = 0; i < userdetails.length; i++) {
      if (i == index) {
        userdetails[i].hide = false;
      } else {
        userdetails[i].hide = true;
      }
    }

    setState(() {
      userdetails = userdetails;
      traveldata.add(modelClass);
    });

    for (int i = 0; i < userdetails.length - 1; i++) {
      print(userdetails.length);

      print(traveldata.length);
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      itemScrollController.scrollTo(
          index: index,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          titleSpacing: 0.0,
          title: Text(
            "New Request",
            style: TextStyle(
                color: AppConstants.TEXT_BACKGROUND_COLOR,
                fontSize: 18,
                fontWeight: FontWeight.w800),
          ),
          actions: [GetNotificationIcon()],
          centerTitle: true,
          iconTheme: IconThemeData(color: AppConstants.TEXT_BACKGROUND_COLOR),
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                height: 15.0.w,
                width: 100.0.w,
                child: Column(children: [
                  Expanded(
                    flex: 10,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: DashboardEditFieldHeader("Project",AppConstants.TEXT_BACKGROUND_COLOR),
                    ),
                  ),
                Expanded(child: SizedBox(),flex: 1,),
                Expanded(
                    flex: 8,
                    child:DashboardCustomEditField("Search for a project ID",true,Icons.search,onTap: (){},))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child:  DashboardEditFieldHeader("Travel Type",AppConstants.TEXT_BACKGROUND_COLOR),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [

                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'Billable';
                              id = 1;
                            });
                          },
                        ),
                        Text(
                          'Billable',
                          style: new TextStyle(fontSize: 17.0),
                        ),
                      ],
                    ),
                  ),


                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Non-Billable';
                            id = 2;
                          });
                        },
                      ),
                      Text(
                        'Non-Billable',
                        style: new TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 20,
                    alignment: Alignment.centerLeft,
                    child: new ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            itemScrollController.scrollTo(
                                index: index,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOutCubic);
                            this.setState(() {
                              for (int i = 0; i < userdetails.length; i++) {
                                if (i == index) {
                                  userdetails[i].hide = false;
                                } else {
                                  userdetails[i].hide = true;
                                }
                              }
                            });
                          },
                          child: Container(
                            width: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                              color: manageColor(userdetails[index].hide),
                            ),
                            child: Text(
                              "${index + 1}",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                      itemCount: userdetails.length,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                        child: Text("Add Another City"),
                        onPressed: () {
                          if (traveldata[index]
                              .name
                              .toString()
                              .trim()
                              .isEmpty) {
                            showDialog(
                                context: context,
                                child: new AlertDialog(
                                  title: new Text("Mobility"),
                                  content: new Text("Insert trip name"),
                                ));

                            itemScrollController.scrollTo(
                                index: userdetails.length - 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOutCubic);
                            for (int i = 0; i < userdetails.length; i++) {
                              if (i == userdetails.length - 1) {
                                userdetails[i].hide = false;
                              } else {
                                userdetails[i].hide = true;
                              }
                            }
                            this.setState(() {
                              userdetails = userdetails;
                            });
                          } else {
                            this.setState(() {
                              index = index + 1;
                            });
                            AddNewReq();
                          }
                        }),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Expanded(
                child: Container(
                  height: 70.0.h,
                  width: 100.0.w,
                  child: ScrollablePositionedList.builder(
                    itemScrollController: itemScrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 70.0.h,
                          width: 92.0.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red[500],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 50,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.deepOrangeAccent,
                                        spreadRadius: 3),
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(fontSize: 17),
                                    hintText: 'Search your trips',
                                    suffixIcon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(20),
                                  ),
                                  onChanged: (text) {
                                    traveldata[index].name = text;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: traveldata.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
