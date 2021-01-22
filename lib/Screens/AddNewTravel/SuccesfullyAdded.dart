 import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';




class SuccessfullyAdded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: MediaQuery.of(context).size.width * 0.50,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.contain,
                          image: new AssetImage(
                              'assets/images/DoneIcon.png')
                      ))),
              SizedBox(height: 70),

              Container(child: Text("Request submitted Successfully",style: TextStyle(fontSize: 20),)),
              SizedBox(height: 20),
              FlatButton(
                height: 40,
                minWidth: 150,
                child: Text(
                  'DONE',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                textColor: Colors.white,
                color: AppConstants.APP_THEME_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/Dashboard');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
