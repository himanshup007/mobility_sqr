import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/PassportModel.dart';
import 'package:mobility_sqr/Util/UtilClass.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:sizer/sizer.dart';

class PassportScreen extends StatefulWidget {
  List<PassportDetail> passportDetaillist;

  PassportScreen(this.passportDetaillist);





  @override
  _PassportScreenState createState() => _PassportScreenState();
}

class _PassportScreenState extends State<PassportScreen> {


  @override
  void initState() {

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        titleSpacing: 0.0,
        title: Text(
          "Passport",
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
                ListView.builder(
                itemBuilder: (context, index) => _renderContainer("key$index",index),
                itemCount: widget.passportDetaillist.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true),

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: AppConstants.APP_THEME_COLOR,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      " Add New",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: () {

                  },
                ),
              ),
            ),
              ],
        ),
      ),
    );
  }

  Widget _renderContainer(mykey, int index){
    mykey=GlobalKey<SimpleFoldingCellState>();
    return Container(
      color: Colors.transparent,
      child: SimpleFoldingCell.create(
        key: mykey,
        frontWidget: _buildFrontWidget(mykey,widget.passportDetaillist, index),
        innerWidget: _buildInnerWidget(mykey,widget.passportDetaillist,index),
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

  Widget _buildFrontWidget(mykey, List<PassportDetail> passportDetaillist, int index) {
    return GestureDetector(
      onTap: (){
        mykey?.currentState?.toggleFold();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF9a4c92),
                const Color(0xFFbf7192),
                const Color(0xFF8c3771),
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
                    "${passportDetaillist[index].empCode}",
                    style: _textStyle,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.deepPurpleAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                        child: AutoSizeText(
                          "${passportDetaillist[index].countryOfIssue.toUpperCase()}",
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
                    "assets/images/passport_white.png",
                    scale: .8,
                  ),
                  column_widget(passportDetaillist[index]),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "View Passport",
                      style: TextStyle(color: Colors.amber, fontSize: 16),
                    ),
                    SizedBox(width: 5,),
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

  column_widget(PassportDetail passportDetaillist) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Number",
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w500),
        ),
        Text(
          "${passportDetaillist.passportNumber}",
          style: _textStyle,
        ),
        SizedBox(height: 5,),
        Text(
          "Valid Through",
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w500),
        ),
        Text(
          passportDetaillist.dateOfExpiration!=""?"${getPassportimeformat(passportDetaillist.dateOfExpiration)}":'N/A',
          style: _textStyle,
        )
      ],
    );
  }

// onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
  Widget _buildInnerWidget(mykey, List<PassportDetail> passportDetaillist, int index) {
    return Container(
      color: Color(0xFFecf2f9),
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.network('${AppConstants.BASE_URL}${passportDetaillist[index].photo}'),),
          Positioned(
            top: 0,
            right: 5,

            child: GestureDetector(
              onTap: (){
                mykey?.currentState?.toggleFold();
              },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.deepPurpleAccent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Close",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
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
