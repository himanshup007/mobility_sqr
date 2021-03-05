import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/Activities.dart';
import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';
import 'package:sizer/sizer.dart';

class ActivitiesList extends StatefulWidget {
  Function(Activity) onchange;
  List<Activity> activityList;
  VoidCallback onclose;

  ActivitiesList(this.activityList, {this.onchange, this.onclose});

  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<ActivitiesList> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0.h,
      width: 100.0.w,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Select an Activity",
              style: TextStyle(
                  color: AppConstants.APP_THEME_COLOR,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.activityList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.onchange(widget.activityList[index]);
                          widget.onclose();
                        },
                        child: ListTile(
                          leading: Container(
                            color: Color(0xFFF2F2F2),
                            height: 30,
                            width: 30,
                            child: ClayContainer(
                              color: Color(0xFFF2F2F2),
                              height: 20,
                              width: 20,
                              borderRadius: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: widget.activityList[index].id==1?Colors.lightBlueAccent:widget.activityList[index].id==2?Colors.green:widget.activityList[index].id==3?Colors.yellow:Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            '${widget.activityList[index].activityName}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
