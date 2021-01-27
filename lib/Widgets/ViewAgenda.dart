import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

class AddAgendaView extends StatefulWidget {
  String mytext;
  VoidCallback onclose;

  AddAgendaView(this.mytext, {this.onclose});

  @override
  _AddAgendaState createState() => _AddAgendaState();
}

class _AddAgendaState extends State<AddAgendaView> {
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
                    fontSize: 25,
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
            enabled: false,
            controller: controller,

            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.done,
            maxLines: 12,

            style: TextStyle(
              fontSize: 20.0,
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




      ],
    );
  }
}
