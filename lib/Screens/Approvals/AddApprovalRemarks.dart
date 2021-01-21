import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

import 'ApprovalWidget.dart';

 class AddApprovalRemarks extends StatefulWidget {
  @override
  _AddAgendaState createState() => _AddAgendaState();
}

class _AddAgendaState extends State<AddApprovalRemarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Text(
                      "Remarks",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Colors.black),
                      textAlign: TextAlign.left,
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
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  maxLines: 7,
                  maxLength: 1000,
                  style: TextStyle(
                    fontSize: 16.0, height: 1.0, color: Colors.black,),
                  decoration: InputDecoration(

                      border: OutlineInputBorder(),

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
                        'REJECT',
                        style: TextStyle(fontSize: 16.0),
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
                       },
                    ),
                     FlatButton(
                      child: Text(

                        'APPROVE',
                        style: TextStyle(fontSize: 16.0),
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
        ),
      ),
    );
  }
}




// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       home: AddApprovalRemarks(),
//     );
//   }
// }
//
// class AddApprovalRemarks extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<AddApprovalRemarks> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         title: Text('Flutter Custom Popover'),
//       ),
//       body: Container(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _handleFABPressed,
//         child: Icon(Icons.filter_alt_outlined),
//       ),
//     );
//   }
//
//   void _handleFABPressed() {
//     showModalBottomSheet<int>(
//       backgroundColor: Colors.transparent,
//       context: context,
//       builder: (context) {
//         return Popover(
//           child: Center(
//             child: Padding(
//                padding: EdgeInsets.only(
//                   bottom: MediaQuery.of(context).viewInsets.bottom),
//                child:  Container(
//                 width: MediaQuery.of(context).size.width * 0.85,
//                 child: Column(
//                   children: [
//                     //SizedBox(height: 50),
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 7,
//                           child: Text(
//                             "Remarks",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 25,
//                                 color: Colors.black),
//                             textAlign: TextAlign.left,
//                           ),
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: ImageIcon(
//                             AssetImage(
//                               'assets/images/close.png',
//                             ),
//                             size: 19,
//                             color: Colors.black38,
//                           ),
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: ImageIcon(
//                             AssetImage(
//                               'assets/images/close.png',
//                             ),
//                             size: 19,
//                             color: Colors.black38,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.85,
//                       child: TextField(
//                         //autofocus: true,
//                         keyboardType: TextInputType.multiline,
//                         textInputAction: TextInputAction.done,
//                         maxLines: 7,
//                         maxLength: 1000,
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           height: 1.0,
//                           color: Colors.black,
//                         ),
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: AppConstants.APP_THEME_COLOR))),
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.85,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           FlatButton(
//                             child: Text(
//                               'REJECT',
//                               style: TextStyle(fontSize: 16.0),
//                               textAlign: TextAlign.center,
//                             ),
//                             height: 40,
//                             // minWidth: 165,
//                             textColor: Colors.amber[600],
//                             shape: RoundedRectangleBorder(
//                               side: BorderSide(
//                                   color: Colors.orangeAccent,
//                                   width: 1,
//                                   style: BorderStyle.solid),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             onPressed: () {},
//                           ),
//                           FlatButton(
//                             child: Text(
//                               'APPROVE',
//                               style: TextStyle(fontSize: 16.0),
//                               textAlign: TextAlign.center,
//                             ),
//                             height: 40,
//                             //minWidth: 165,
//                             textColor: Colors.white,
//                             color: AppConstants.APP_THEME_COLOR,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             onPressed: () {
//                               //Navigator.pushNamed(context, '/Dashboard');
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//
// }
