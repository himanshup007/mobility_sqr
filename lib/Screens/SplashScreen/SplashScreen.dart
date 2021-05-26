import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobility_sqr/Util/SearhBloc/search_bloc.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool get isPlaying => _controller?.isActive ?? false;
  Artboard _riveArtboard;
  Artboard _riveArtboardbg;
  RiveAnimationController _controller;
  RiveAnimationController _controllerbg;

  double height;
  double width;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/animations/loader.riv').then(
      (data) async {
        var file = RiveFile();

        var success = file.import(data);
        if (success) {
          var artboard = file.mainArtboard;

          artboard.addController(
            _controller = SimpleAnimation('go'),
          );
          setState(() => _riveArtboard = artboard);
        }
      },
    );
    rootBundle.load('assets/animations/splash_bg.riv').then(
      (data) async {
        var file = RiveFile();

        // Load the RiveFile from the binary data.
        var success = file.import(data);
        if (success) {
          var artboard = file.mainArtboard;

          artboard.addController(
            _controllerbg = SimpleAnimation('go'),
          );
          setState(() => _riveArtboardbg = artboard);
        }
      },
    );
    Timer(Duration(seconds: 4),
        () => Navigator.of(context).pushReplacementNamed('/Username_Screen'));
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            margin: EdgeInsets.only(top: height / 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/splash_logo.png",
                    fit: BoxFit.contain,
                    height: height / 10,
                  ),
                ),
                Center(
                  child: _riveArtboard == null
                      ? const SizedBox()
                      : Rive(
                          artboard: _riveArtboard,
                          useArtboardSize: true,
                        ),
                ),
                Stack(
                  children: [
                    _riveArtboardbg == null
                        ? const SizedBox()
                        : Center(
                            heightFactor: .5,
                            child: Rive(
                              artboard: _riveArtboardbg,
                              useArtboardSize: true,
                            ),
                          ),
                    Container(
                      width: width,
                      margin: EdgeInsets.only(top: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/blue_male.png",
                            fit: BoxFit.contain,
                            height: height / 5,
                          ),
                          Image.asset(
                            "assets/images/Rightside_male.png",
                            fit: BoxFit.contain,
                            height: height / 5,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
