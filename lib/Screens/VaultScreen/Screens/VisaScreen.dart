import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';
import 'package:get/get.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/PassportModel.dart';
import 'package:mobility_sqr/ModelClasses/VisaModel.dart';
import 'package:mobility_sqr/Util/UtilClass.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:sizer/sizer.dart';

class VisaScreen extends StatefulWidget {
  List<VisaDetail> visaDetaillist;

  VisaScreen(this.visaDetaillist);

  @override
  _VisaScreenState createState() => _VisaScreenState();
}

class _VisaScreenState extends State<VisaScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          titleSpacing: 0.0,
          title: Text(
            "Visa",
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
          color: Colors.white,
          height: 100.0.h,
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Container(
                height: Get.height,
                child: ListView.builder(
                    itemBuilder: (context, index) =>
                        _renderContainer("key$index", index),
                    itemCount: widget.visaDetaillist.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 60,
                  color: AppConstants.APP_THEME_COLOR,
                  child: RaisedButton(
                    color: AppConstants.APP_THEME_COLOR,
                    child: Text(
                      " Add New",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderContainer(mykey, int index) {
    mykey = GlobalKey<SimpleFoldingCellState>();
    return Container(
      color: Colors.transparent,
      child: SimpleFoldingCell.create(
        key: mykey,
        frontWidget: _buildFrontWidget(mykey, widget.visaDetaillist, index),
        innerWidget: _buildInnerWidget(mykey, widget.visaDetaillist, index),
        cellSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 4),
        padding: EdgeInsets.all(15),
        animationDuration: Duration(milliseconds: 300),
        borderRadius: 10,
        onOpen: () => print('View'),
        onClose: () => print('cell closed'),
      ),
    );
  }

  Widget _buildFrontWidget(mykey, List<VisaDetail> visaDetaillist, int index) {
    return GestureDetector(
      onTap: () {
        mykey?.currentState?.toggleFold();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF575fd0),
                const Color(0xFF8489f4),
                const Color(0xFF5052ca),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0, 2.0],
              tileMode: TileMode.clamp),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${visaDetaillist[index].empCode}",
                    style: _textStyle,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.deepPurpleAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: AutoSizeText(
                          "${visaDetaillist[index].countryCode.toUpperCase()}",
                          maxFontSize: 12,
                          minFontSize: 6,
                          style: _textStyle,
                        ),
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/visa_white.png",
                    scale: .8,
                  ),
                  column_widget(visaDetaillist[index]),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View Visa",
                      style: TextStyle(color: Colors.amber, fontSize: 16),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  column_widget(VisaDetail passportDetaillist) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Number",
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w500),
        ),
        Text(
          "${passportDetaillist.documentNumber}",
          style: _textStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Valid Through",
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w500),
        ),
        Text(
          passportDetaillist.expirationDate != ""
              ? "${getPassportimeformat(passportDetaillist.expirationDate)}"
              : 'N/A',
          style: _textStyle,
        )
      ],
    );
  }

// onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
  Widget _buildInnerWidget(mykey, List<VisaDetail> visaDetaillist, int index) {
    return Container(
      color: Color(0xFFecf2f9),
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: visaDetaillist[index].attachmentId != ""
                ? Image.network(
                    '${AppConstants.BASE_URL}${visaDetaillist[index].attachmentId}')
                : Text("No file Found"),
          ),
          Positioned(
            top: 0,
            right: 5,
            child: GestureDetector(
              onTap: () {
                mykey?.currentState?.toggleFold();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.deepPurpleAccent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Close",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle =
      TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);
}
