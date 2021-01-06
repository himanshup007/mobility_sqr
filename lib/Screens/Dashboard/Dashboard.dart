import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/ModelClass.dart';
import 'package:mobility_sqr/ModelClasses/showHide.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  TextEditingController nameController = TextEditingController();
  ItemScrollController itemScrollController = ItemScrollController();
  String fullName = '';

  List userdetails = [];
  List traveldata = [];
  int index = 0;
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        titleSpacing: 0.0,
        title: Text("Voyager",
            style: TextStyle(
                color: AppConstants.APP_THEME_COLOR,
                fontSize: 16,
                fontWeight: FontWeight.w800)),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            DrawerHeader(

                decoration: BoxDecoration(
                  // color: Colors.green,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/cover.jpg'))),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        child: ImageIcon(
                          AssetImage(
                              'assets/images/myprofile_sidemenu_icon.png'),
                          size: 80,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.black12,
                      ),
                      Material(
                        child: Text(
                          'User Name',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700, height: 1.7),
                        ),
                      ),
                    ],
                  ),
                )),

            ListTile(
              // contentPadding: new EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              contentPadding:
              new EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              leading: ImageIcon(
                AssetImage("assets/images/myprofile_sidemenu_icon.png"),
                color: AppConstants.APP_THEME_COLOR,
              ),
              title: Text('My Profile'),
              onTap: () => {},
            ),
            Divider(
              height: 0.5,
              indent: 80,
              endIndent: 30,
              thickness: 0.8,
            ),
            ListTile(
              contentPadding:
              new EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              leading: ImageIcon(
                AssetImage("assets/images/biometric-thumb.png"),
                color: AppConstants.APP_THEME_COLOR,
              ),
              title: Text('Fingerprint Authentication'),
              onTap: () => {},
            ),
            Divider(
              height: 0.5,
              indent: 80,
              endIndent: 30,
              thickness: 0.8,
            ),
            ListTile(
              contentPadding:
              new EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              leading: ImageIcon(
                AssetImage("assets/images/change_password_sidemenu_icon.png"),
                color: AppConstants.APP_THEME_COLOR,
              ),
              title: Text('Change Password'),
              onTap: () => {},
            ),
            Divider(
              height: 0.5,
              indent: 80,
              endIndent: 30,
              thickness: 0.8,
            ),
            ListTile(
              contentPadding:
              new EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              leading: ImageIcon(
                AssetImage("assets/images/logout_sidemenu_icon.png"),
                color: AppConstants.APP_THEME_COLOR,
              ),
              title: Text('Logout'),
              onTap: () => {},
            )
          ],
        ),
      ),


      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(5, 50, 10, 0),
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
                margin: EdgeInsets.fromLTRB(5, 50, 10, 0),
                child: RaisedButton(
                    child: Text("Add Another City"),
                    onPressed: () {
                      if (traveldata[index].name.toString().trim().isEmpty) {
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
              height: 600,
              width: 100.0.w,
              child: ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 200,
                    width: 90.0.w,
                    margin: EdgeInsets.all(20),
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
                          margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
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
                  );
                },
                itemCount: traveldata.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
