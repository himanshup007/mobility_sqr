import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

class AddAgenda extends StatefulWidget {
  Function(String) onchange;
  String mytext;
  VoidCallback onclose;

  AddAgenda(this.mytext, {this.onchange, this.onclose});

  @override
  _AddAgendaState createState() => _AddAgendaState();
}

class _AddAgendaState extends State<AddAgenda> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text=widget.mytext;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Add Agenda",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
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
          ],
        ),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: 2,
          color: AppConstants.APP_THEME_COLOR,
        ),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          child: TextFormField(
            controller: controller,

            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.done,
            maxLines: 12,

            style: TextStyle(
              fontSize: 16.0,
              height: 1.0,
              color: Colors.black,
            ),
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
          width: MediaQuery.of(context).size.width * 0.75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text(
                  'Clear',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                height: 40,
                minWidth: 100,
                textColor: Colors.amber[600],
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.orangeAccent,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  controller.clear();
                  widget.onchange(controller.text);
                  //Navigator.pushNamed(context, '/Dashboard');
                },
              ),
              SizedBox(width: 5),
              FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                height: 40,
                minWidth: 100,
                textColor: Colors.white,
                color: AppConstants.APP_THEME_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  widget.onchange(controller.text);
                  //Navigator.pushNamed(context, '/Dashboard');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
