import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/VaultScreen/Screens/VaultTypeScreen.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';

class DefaultVaultScreen extends StatefulWidget {
  String VaultType;

  DefaultVaultScreen(@required this.VaultType);

  @override
  _DefaultVaultScreenState createState() => _DefaultVaultScreenState();
}

class _DefaultVaultScreenState extends State<DefaultVaultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        titleSpacing: 0.0,
        title: Text(
          "${this.widget.VaultType}",
          style: TextStyle(
              color: AppConstants.TEXT_BACKGROUND_COLOR,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          GetNotificationIcon(context),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 100.0.h,
            width: 100.0.w,
            child: ListView(
              shrinkWrap: true,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppConstants.APP_THEME_COLOR,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    " Add New",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            VaultTypeScreen('${widget.VaultType}')),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
