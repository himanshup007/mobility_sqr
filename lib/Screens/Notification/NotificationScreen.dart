import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/ModelClasses/NotificationModel.dart';
import 'package:mobility_sqr/Screens/Dashboard/Dashboard.dart';
import 'package:mobility_sqr/Util/UtilClass.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';

class NotificationScreen extends StatefulWidget {
  static final String id = 'notification_screen';

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  List<NotificationData> notification = [];

  ApiProvider _apiProvider = ApiProvider();
  AnimationController controller;
  bool expanded = true;

  bool showhideloader = true;

  @override
  void initState() {
    super.initState();
    notificationList();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
  }

  void notificationList() {
    _apiProvider
        .get_notifcations()
        .then((value) => this.setState(() {
              notification = value.data;
              showhideloader = false;
            }))
        .onError((error, stackTrace) => this.setState(() {
              showhideloader = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff525A5C)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Notification',
          style: TextStyle(color: Color(0xff525A5C)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          notification.length == 0
              ? Container()
              : Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: AnimatedIcon(
                            icon: AnimatedIcons.close_menu,
                            color: Colors.black,
                            progress: controller,
                            semanticLabel: 'Show menu',
                          ),
                          onPressed: () {
                            setState(() {
                              expanded
                                  ? controller.forward()
                                  : controller.reverse();
                              expanded = !expanded;
                            });
                          }),
                      expanded
                          ? GestureDetector(
                        onTap: (){
                          this.setState(() {
                            showhideloader = true;
                          });

                          _apiProvider
                              .delete_notification(
                              notiId: "")
                              .then((value) => this.setState(() {
                            if (value) {
                              notification.clear();
                              notification = notification;
                              showhideloader = false;
                            } else {

                              showhideloader = false;
                            }
                          }));
                        },
                            child: Text(
                                "Clear all",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                          )
                          : SizedBox(),
                    ],
                  ),
                ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: Get.height,
            child: notification.length == 0 && !showhideloader
                ? Container(
                    height: Get.height,
                    child: Center(
                        child: Text(
                      "No New Notifications",
                      style: TextStyle(fontSize: 20),
                    )),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: notification.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          secondaryActions: [
                            IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red,
                                icon: Icons.delete,
                                foregroundColor: Colors.white,
                                onTap: () {
                                  this.setState(() {
                                    showhideloader = true;
                                  });

                                  _apiProvider
                                      .delete_notification(
                                          notiId: notification[index].id)
                                      .then((value) => this.setState(() {
                                            if (value) {
                                              notification.removeAt(index);
                                              notification = notification;
                                              showhideloader = false;
                                            } else {
                                              Get.snackbar("",
                                                  "Oops Something went wrong");
                                              showhideloader = false;
                                            }
                                          }));
                                }),
                          ],
                          child: GestureDetector(
                            onTap: () {
                              if (notification[index].entityType == 'Travel') {
                                this.setState(() {
                                  showhideloader = true;
                                });

                                _apiProvider
                                    .fetchViewTravelReq(
                                        notification[index].entityID)
                                    .then((value) => this.setState(() {
                                          showhideloader = false;
                                          NavigationHandler(value, context, 2);
                                        }));
                              } else {
                                showDefaultSnackbar(context, "Coming Soon");
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: Get.width / 10,
                                  child: Icon(
                                    Icons.notifications,
                                    size: 28,
                                    color: Color(0xffB71569),
                                  ),
                                ),
                                Container(
                                  width: Get.width / 1.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xffEDEDED)),
                                  height: 65,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width / 1.5,
                                          child: Text(
                                            "${notification[index].message}",
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: Color(0xff585A59),
                                            ),
                                            overflow: TextOverflow.fade,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width / 8,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${getNotifcationDateUpper(notification[index].dateCreated)}",
                                                style: TextStyle(
                                                    color: Color(0xffB71569),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "${getNotifcationDateLower(notification[index].dateCreated)}",
                                                style: TextStyle(
                                                    color: Color(0xffB71569),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
          ),
          showMobilityLoader(showhideloader, Colors.black12)
        ],
      ),
    );
  }
}
