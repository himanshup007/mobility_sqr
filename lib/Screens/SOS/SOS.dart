import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:telephony/telephony.dart';
import 'package:url_launcher/url_launcher.dart';


class SOS extends StatefulWidget {
  @override
  _SOSState createState() => _SOSState();
}

class _SOSState extends State<SOS> {
  CountDownController _controller = CountDownController();

  final Telephony telephony = Telephony.instance;
  String location="";

  final SmsSendStatusListener listener = (SendStatus status) {

  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    askPermissions();
   location = _getLocation();


  }

  askPermissions() async {
    bool permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
    if(permissionsGranted){
      print("Permission granted");
    }else{
      askPermissions();
    }
  }
  @override
  Widget build(BuildContext context) {

    return Container(

      child: Column(
        children: [
          Text("Emergency",style:TextStyle(fontSize: 30,fontStyle: FontStyle.normal,fontWeight: FontWeight.w700),),
            SizedBox(height: 40,),
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
                backgroundColor:Colors.red,

                // Background Gradient for Countdown Widget.
                backgroundGradient: null,

                // Border Thickness of the Countdown Ring.
                strokeWidth: 20.0,

                // Begin and end contours with a flat edge and no extension.
                strokeCap: StrokeCap.round,

                // Text Style for Countdown Text.
                textStyle: TextStyle(
                    fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),

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
                 telephony.sendSms(
                     to: "8505957287",
                     message: location,
                     statusListener: listener
                 );

                },
              ),
              ),
            ),
          ],

      ),
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
_getLocation() async {
  LocationData currentLocation;

  var location = new Location();
  try {
    currentLocation = await location.getLocation();

    double lat = currentLocation.latitude;
    double lng = currentLocation.longitude;
    // final response = await http.post(
    //     "http://192.168.1.107/sahyog/views/sahyogflutter/helper/demo/geocode.php",
    //     body: {
    //       "lat": lat.toString(),
    //       "lng": lng.toString(),
    //       "action": "geo_loc",
    //     });
    // Map<String, dynamic> _data = jsonDecode(response.body);
    final coordinates = new Coordinates(lat, lng);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");

    return "${first.featureName} : ${first.addressLine}";
  } catch (e) {
    print("error");
    print(e);
  }
}
