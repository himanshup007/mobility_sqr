import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/LoginScreen/bloc/UsernameBloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class Terms extends StatelessWidget {
  get child => null;


  @override
  Widget build(BuildContext context) {

    bloc.setUserInfo();

    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title:
              Text("Terms & Conditions", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          width: 100.0.w,
          child: Column(
            children: [
              Expanded(
                  flex: 8,
                  child: Container(
                    width: 90.0.w,
                    child: SingleChildScrollView(
                      child: Html(
                        defaultTextStyle: const TextStyle(color: Colors.black45),
                        data: """
                      <div>Follow<a class='sup'><sup>pl</sup></a> 
                      Below hr
                      <b>Bold</b>
                      <h1>what was sent down to you from your Lord</h1>, 
                  and do not follow other guardians apart from Him. Little do 
                  <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                  <div>Follow<a class='sup'><sup>pl</sup></a> 
                    Below hr
                      <b>Bold</b>
                  <h1>what was sent down to you from your Lord</h1>, 
                  and do not follow other guardians apart from Him. Little do 
                  <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                  <div>Follow<a class='sup'><sup>pl</sup></a> 
                    Below hr
                      <b>Bold</b>
                  <h1>what was sent down to you from your Lord</h1>, 
                  and do not follow other guardians apart from Him. Little do 
                  <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                  <div>Follow<a class='sup'><sup>pl</sup></a> 
                    Below hr
                      <b>Bold</b>
                  <h1>what was sent down to you from your Lord</h1>, 
                  and do not follow other guardians apart from Him. Little do 
                  <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                  """,

                        // padding: EdgeInsets.all(8.0),
                        onLinkTap: (url) {
                          print("Opening $url...");
                        },
                        customRender: (node, children) {
                          if (node is dom.Element) {
                            switch (node.localName) {
                              case "custom_tag": // using this, you can handle custom tags in your HTML
                                return Column(children: children);
                            }
                          }
                        },
                      ),
                    ),
                  )),
              SizedBox(height: 15),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      FlatButton(
                        child: Text(
                          'AGREE',
                          style: TextStyle(fontSize: 20.0),
                          textAlign: TextAlign.center,
                        ),
                        height: 40,
                        minWidth: 85.0.w,
                        textColor: Colors.white,
                        color: AppConstants.APP_THEME_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/Dashboard');
                        },
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                        child: Text(
                          'Disagree',
                          style: TextStyle(
                              fontSize: 21.0,
                              decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                        height: 40,
                        minWidth: 20.0.w,
                        textColor: AppConstants.APP_THEME_COLOR,
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
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
  }
}
