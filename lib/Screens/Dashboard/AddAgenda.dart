import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

class AddAgenda extends StatefulWidget {
  @override
  _AddAgendaState createState() => _AddAgendaState();
}

class _AddAgendaState extends State<AddAgenda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  "Add Agenda",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: ImageIcon(
                  AssetImage(
                    'assets/images/close.png',
                  ),
                  size: 19,
                  color: Colors.black38,
                ),
              ),
            ],
          ),

           SizedBox(height: 20),
           Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 2,
            color: AppConstants.APP_THEME_COLOR,
           ),

          SizedBox(height: 20),

          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: TextField(
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              maxLines: 7,

               style: TextStyle(
                fontSize: 16.0, height: 1.0, color: Colors.black,),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter day-wise agenda",
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: AppConstants.APP_THEME_COLOR))),
            ),
          ),

          SizedBox(height: 30),

           Container(
             width: MediaQuery.of(context).size.width * 0.95,
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  child: Text(
                    'Clear',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  height: 40,
                  minWidth: 165,
                  textColor: Colors.amber[600],

                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.orangeAccent,
                        width: 1,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(10),

                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, '/Dashboard');
                  },
                ),
                // SizedBox(width: 5),
                FlatButton(
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  height: 40,
                  minWidth: 165,
                  textColor: Colors.white,
                  color: AppConstants.APP_THEME_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    //Navigator.pushNamed(context, '/Dashboard');
                  },
                ),
              ],
          ),
           ),


        ],
      ),
    );
  }
}
