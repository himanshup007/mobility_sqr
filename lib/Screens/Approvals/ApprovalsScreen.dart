import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/Approval.dart';
import 'package:mobility_sqr/ModelClasses/GetTravelRequest.dart';
import 'package:mobility_sqr/Screens/Approvals/bloc/aprrovals_bloc.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:sizer/sizer.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
class ApprovalsScreen extends StatefulWidget {
  @override
  _ApprovalsScreenState createState() => _ApprovalsScreenState();
}

class _ApprovalsScreenState extends State<ApprovalsScreen> {
  var checkedValue = false;
  final Repository repository = Repository();

  BuildContext dialogContext;
  var headertext= "Previous Travels";
  var args;
  final GlobalKey loaderkey = GlobalKey<NavigatorState>();
  ApiProvider _appApiProvider = ApiProvider();
  var where;
  bool showloader= false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute
            .of(context)
            .settings
            .arguments;
      });
      try{
        where = args['where'];
      }
      catch(e){

      }

      headertext = args['header'];
    });
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute
        .of(context)
        .settings
        .arguments;
    final navi = args["where"];


    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                _onWillPop();
              }),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white38,
          elevation: 0,
          title: Text("$headertext",
              style: TextStyle(color: Colors.black, fontSize: 17.0)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: BlocProvider(
                create: (context) => AprrovalsBloc(repository),
                child: Column(
                  children: [
                    Expanded(
                      flex: 15,
                      child: BlocBuilder<AprrovalsBloc, AprrovalsState>(
                          builder: (context, state) {
                            if (state is AprrovalsInitial) {
                              if (navi == 2) {
                                BlocProvider.of<AprrovalsBloc>(context)
                                    .add(Fetch_previous_req());
                              } else {
                                BlocProvider.of<AprrovalsBloc>(context)
                                    .add(Fetch_travel_req_approver());
                              }
                            }
                            if (state is AprrovalsLoading) {}
                            if (state is AprrovalsError) {
                              return Center(
                                child: Text('Oops Something Went Wrong!'),
                              );
                            }
                            if (state is AprrovalsLoaded) {
                              return AnimationLimiter(
                                child: ListView.builder(
                                    shrinkWrap: false,
                                    itemCount: state.approvalModal.data.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration: const Duration(milliseconds: 375),
                                        child: SlideAnimation(
                                          horizontalOffset: 50.0,
                                          child: FadeInAnimation(
                                            child: GestureDetector(
                                                onTap: () {
                                                  this.setState(() {
                                                    showloader=true;
                                                  });
                                                  _appApiProvider
                                                      .fetchViewTravelReq(
                                                      state.approvalModal
                                                          .data[index].travelReqId)
                                                      .then((value) =>
                                                      this.setState(() {
                                                        showloader=false;
                                                        NavigationHandler(value,context,where);
                                                      })
                                                    ).catchError((onError)=>
                                                  this.setState(() {
                                                    showloader=false;
                                                  })
                                                  );
                                                },
                                                child: Cell(
                                                    state.approvalModal.data[index],
                                                    where)),
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            }

                            return Container(
                              height: 100.0.h,
                              width: 100.0.w,
                              color: Colors.transparent,
                              child: Center(
                                child: LoadingBouncingGrid.circle(
                                  size: 50,
                                  backgroundColor: AppConstants.APP_THEME_COLOR,
                                ),
                              ),
                            );
                          }),
                    ),
                    // navi==2?Expanded(
                    //   flex: 1,
                    //   child: Center(
                    //     child: Container(
                    //       width: MediaQuery
                    //           .of(context)
                    //           .size
                    //           .width * 0.95,
                    //       height: 5.0.h,
                    //       child: FlatButton(
                    //         child: Text(
                    //           'SELECT',
                    //           style: TextStyle(fontSize: 20.0),
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         textColor: Colors.white,
                    //         color: AppConstants.APP_THEME_COLOR,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         onPressed: () {},
                    //       ),
                    //     ),
                    //   ),
                    // ):SizedBox(),
                  ],
                ),
              ),
            ),
            showMobilityLoader(showloader)
          ],
        ),
      ),
    );
  }


  Future<bool> _onWillPop() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/Dashboard', (Route<dynamic> route) => false);
  }
}
  NavigationHandler(GetTravelRequest value,BuildContext context,where) {


    Navigator.pushNamed(context, '/TravelReqView',arguments: {"EmployeeData":value.data,"where":where});

  }


class Cell extends StatefulWidget {
  Data fact;
  Function(bool) changeValue;
  int where;
  Cell(this.fact,this.where, {this.changeValue});



  @override
  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> {
  bool myvalue;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    TextWidget(
                        "Employee Name", 13.0, null, Colors.black54, 2.0),
                    TextWidget(widget.fact.firstName + widget.fact.lastName,
                        15.0, FontWeight.w700, null, 7.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              TextWidget(
                                  "From Date", 13.0, null, Colors.black54, 4.0),
                              TextWidget(getDepartureDate(widget.fact.details.length>0?widget.fact.details[0].departureDate:" "), 13.0,
                                  FontWeight.w600, null, 0),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              TextWidget(
                                  "To Date", 13.0, null, Colors.black54, 4.0),
                              TextWidget(getDepartureDate(widget.fact.details.length>0?widget.fact.details[widget.fact.details.length-1].returnDate:" "), 13.0,
                                  FontWeight.w600, null, 0),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Column(
                    children: [
                      TextWidget(
                          "Travel Request ID", 13.0, null, Colors.black54, 2.0),
                      TextWidget(widget.fact.travelReqId, 16.0, FontWeight.w700,
                          AppConstants.APP_THEME_COLOR, 7.0),
                      TextWidget(
                          "Employee ID", 13.0, null, Colors.black54, 2.0),
                      TextWidget(widget.fact.empCode, 15.0, FontWeight.w600,
                          Colors.black, 0),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: widget.where==5?Checkbox(
              //     checkColor: Colors.white,
              //     activeColor: AppConstants.APP_THEME_COLOR,
              //     value: widget.fact.isSelected,
              //     onChanged: (bool value) {
              //       this.setState(() {
              //         widget.fact.isSelected = !widget.fact.isSelected;
              //       });
              //       widget.changeValue(value);
              //     },
              //   ):SizedBox(),
              // ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 1,
            color: Colors.black38,
          ),
        ],
      ),
    );
  }


}

class TextWidget extends StatelessWidget {
  TextWidget(this.value, this.fontSize, this.fontWeight, this.fontColor,
      this.paddingBottom);

  final String value;
  final double fontSize;
  final FontWeight fontWeight;
  final dynamic fontColor;
  final double paddingBottom;

  //final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, paddingBottom),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          value,
          style: TextStyle(
              fontSize: fontSize, color: fontColor, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
getDepartureDate(String date) {
  print(date);
  if (date == "") {
    return "";
  } else {
    try{


    var depatureDate = DateTime.parse(date.toString());
    final String datestring = DateFormat("dd/MMM/yyyy").format(depatureDate);
    return datestring;
    } catch(e){
      return " ";
    }
  }
}