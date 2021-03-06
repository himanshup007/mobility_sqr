import 'dart:io';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:clay_containers/clay_containers.dart';

import 'package:flutter/material.dart';

import 'package:location/location.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

import 'package:url_launcher/url_launcher.dart';

class SOS extends StatefulWidget {
  @override
  _SOSState createState() => _SOSState();
}

class _SOSState extends State<SOS> {
  CountDownController _controller = CountDownController();

  String  location=" ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   // location_setter();
  }
  location_setter() async {

   // location= await _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Emergency",
          style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: 200,
            child: CircularCountDownTimer(
              // Countdown duration in Seconds.
              duration: 5,

              // Countdown initial elapsed Duration in Seconds.
              initialDuration: 0,

              // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
              controller: _controller,

              // Width of the Countdown Widget.
              width: MediaQuery.of(context).size.width / 2,

              // Height of the Countdown Widget.
              height: MediaQuery.of(context).size.height / 2,

              // Ring Color for Countdown Widget.
              ringColor: Colors.black54,

              // Ring Gradient for Countdown Widget.
              ringGradient: null,

              // Filling Color for Countdown Widget.
              fillColor: Colors.white,

              // Filling Gradient for Countdown Widget.
              fillGradient: null,

              // Background Color for Countdown Widget.
              backgroundColor: Colors.red,

              // Background Gradient for Countdown Widget.
              backgroundGradient: null,

              // Border Thickness of the Countdown Ring.
              strokeWidth: 20.0,

              // Begin and end contours with a flat edge and no extension.
              strokeCap: StrokeCap.round,

              // Text Style for Countdown Text.
              textStyle: TextStyle(
                  fontSize: 33.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),

              // Format for the Countdown Text.
              textFormat: CountdownTextFormat.S,

              // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
              isReverse: false,

              // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
              isReverseAnimation: false,

              // Handles visibility of the Countdown Text.
              isTimerTextShown: true,

              // Handles the timer start.
              autoStart: true,

              // This Callback will execute when the Countdown Starts.
              onStart: () {
                // Here, do whatever you want
                print('Countdown Started');
              },

              // This Callback will execute when the Countdown Ends.
              onComplete: () {
                // Here, do whatever you want
                _makePhoneCall('tel:8505957287');
                Navigator.of(context).pop();


              },
            ),
          ),
        ),

        // GestureDetector(
        //   onTap: (){
        //
        //     _sendtext(location);
        //   },
        //   child: ClayContainer(
        //     height: 60,
        //     width: 200,
        //     surfaceColor: AppConstants.APP_THEME_COLOR,
        //     color: Colors.white,
        //     borderRadius:10 ,
        //     child: Center(child: Text("Send Msg",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
        //   ),
        // )
      ],
    );
  }
}

Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// _getLocation() async {
//   LocationData currentLocation;
//
//   var location = new Location();
//   try {
//     currentLocation = await location.getLocation();
//
//     double lat = currentLocation.latitude;
//     double lng = currentLocation.longitude;
//
//     final coordinates = new Coordinates(lat, lng);
//     var addresses =
//         await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     var first = addresses.first;
//     print("${first.featureName}${first.addressLine}");
//
//     return "${first.featureName}%3A${first.countryName}";
//   } catch (e) {
//     print("error");
//     print(e);
//     return "Failed to get location";
//   }
// }
_sendtext(location) async {
  if(Platform.isAndroid){
    //FOR Android
    String url ='sms:8505957287?body=$location';
    await launch(url);
  }
  else if(Platform.isIOS){
    //FOR IOS
    String url ='sms:8505957287&body=$location';
    await launch(url);
  }
}