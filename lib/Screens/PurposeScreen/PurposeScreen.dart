import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/PurposeModelClass.dart';
import 'package:mobility_sqr/Screens/PurposeScreen/purpose_bloc.dart';
import 'package:sizer/sizer.dart';
class PurposeScreen extends StatefulWidget {


  @override
  _PurposeScreenState createState() => _PurposeScreenState();
}

class _PurposeScreenState extends State<PurposeScreen> {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    List<PurposeData> list = args['list'];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        titleSpacing: 0.0,
        title: Text(
          "Purpose of Travel",
          style: TextStyle(
              color: AppConstants.TEXT_BACKGROUND_COLOR,
              fontSize: 18,
              fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppConstants.TEXT_BACKGROUND_COLOR),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child:ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                        checkColor: Colors.white,
                        //selectedTileColor: Colors.white,
                        activeColor: AppConstants.APP_THEME_COLOR,
                        title: Text(list[index].purposeName),
                        value: list[index].isChecked,
                        onChanged: (val) {
                          setState(
                            () {
                              list[index].isChecked =
                                  !list[index].isChecked;
                            },
                          );
                        });
                  }),
        ),


            SizedBox(height: 10,),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppConstants.APP_THEME_COLOR),
                  borderRadius: BorderRadius.circular(10),
                  color: AppConstants.APP_THEME_COLOR
                ),
                child: FlatButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: 21.0,
                       ),
                    textAlign: TextAlign.center,
                  ),

                  minWidth: 90.0.w,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context,list);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
