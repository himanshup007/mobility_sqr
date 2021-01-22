import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/LoginScreen/bloc/UsernameBloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class Terms extends StatelessWidget {



  @override
  Widget build(BuildContext context) {



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
                    child: Text("The \"firm\" takes the issue of Data Protection seriously and will process the personal details provided to us "
                        "on this form and during the course of your employment with the firm (the \"Information\") in accordance with the Data "
                        "Protection Act 1998 (the \"Act\"). Your information will be held by our human resources department in your personnel "
                        "records and will/may be used for the purposes of administering your employment, benefits and training with the firm, "
                        "ensuring your health and safety and to fulfil the firm's responsibilities as an employer.From time to time, it may be "
                        "necessary for the firm to disclose aspects of this information to others, including partners and appropriate employees "
                        "of the firm, the firm's professional advisers.In accordance with the Act, the firm has a legal obligation to ensure that"
                        " the Information is kept accurate and up to date. Please assist us to comply with this obligation by ensuring that you "
                        "inform us of any changes to the information on this form. The Firm will hold your information on file for 18 months after"
                        " the date of submission. Please confirm below to signify your explicit consent to the firm processing your information "
                        "for the above purposes before proceeding with your application.",
                        textScaleFactor: 1.3,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 13.0),
                      ),
                      ),
                  //   child: SingleChildScrollView(
                  //     child: Html(
                  //       defaultTextStyle: const TextStyle(color: Colors.black45),
                  //       data: """
                  //     <div>Follow<a class='sup'><sup>pl</sup></a>
                  //     Below hr
                  //     <b>Bold</b>
                  //     <h3  style: TextStyle(fontSize: 8),>what wawefrwefs sent down to you from your Lord</h3>,
                  // and do not follow other guardians apart from Him. Little do
                  // <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                  // <div>Follow<a class='sup'><sup>pl</sup></a>
                  //   Below hr
                  //     <b>Bold</b>
                  // <h3  style: TextStyle(fontSize: 8),>what wawefrwefs sent down to you from your Lord</h3>
                  // and do not follow other guardians apart from Him. Little do
                  // <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                  // <div>Follow<a class='sup'><sup>pl</sup></a>
                  //   Below hr
                  //     <b>Bold</b>
                  // <h3  style: TextStyle(fontSize: 8),>what wawefrwefs sent down to you from your Lord</h3>
                  // and do not follow other guardians apart from Him. Little do
                  // <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                  // <div>Follow<a class='sup'><sup>pl</sup></a>
                  //   Below hr
                  //     <b>Bold</b>
                  // <h3  style: TextStyle(fontSize: 8),>what wawefrwefs sent down to you from your Lord</h3>
                  // and do not follow other guardians apart from Him. Little do
                  // <span class='h'>you remind yourselves</span><a class='f'><sup f=2437>1</sup></a></div>
                  // """,
                  //
                  //       // padding: EdgeInsets.all(8.0),
                  //       onLinkTap: (url) {
                  //         print("Opening $url...");
                  //       },
                  //       customRender: (node, children) {
                  //         if (node is dom.Element) {
                  //           switch (node.localName) {
                  //             case "custom_tag": // using this, you can handle custom tags in your HTML
                  //               return Column(children: children);
                  //           }
                  //         }
                  //       },
                  //     ),
                  //  ),

                  )
              ),
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
