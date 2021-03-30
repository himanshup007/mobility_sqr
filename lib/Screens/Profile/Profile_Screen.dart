import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/FileUpload/FileUploader.dart';
import 'package:mobility_sqr/ImagePickerLibUtil/ImagePickerUtil.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/UserInfoPayload.dart';
import 'package:mobility_sqr/ModelClasses/UserProfileModel.dart';
import 'package:mobility_sqr/NotificationManager/Notification.dart';
import 'package:mobility_sqr/Screens/EmergencyContact/EmergencyScreen.dart';
import 'package:mobility_sqr/Screens/Profile/Personal_info/Personal_Info_Screen.dart';
import 'package:mobility_sqr/Screens/VaultScreen/VaultScreen.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppState {
  free,
  picked,
  cropped,
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File _pickedImage = null;
  String _pickedImageString;
  AppState state;
  FileUpload _fileUpload = FileUpload.instance;
  StreamSubscription _progressSubscription;
  StreamSubscription _resultSubscription;
  Map<String, UploadItem> _tasks = {};

  NotificationManager _notificationManager = NotificationManager.instance;

  UserProfile _userProfile;

  ApiProvider _apiProvider = ApiProvider();

  UserInfoPayload _userInfoPayload = UserInfoPayload();

  TokenGetter appsharedprefs = TokenGetter();

  fetch_userProfile() async {
    await _apiProvider
        .get_user_profile()
        .then((value) => this.setState(() {
              _userProfile = value.data[0];
            }))
        .onError((error, stackTrace) => print('error'));
  }

  setValueUpdate(String photo) async {

    this.setState(() {
      _pickedImageString=photo;
    });
    _userInfoPayload.countryOfBirth = _userProfile.countryOfBirth;
    _userInfoPayload.dob = _userProfile.dob;
    _userInfoPayload.email = _userProfile.email;
    _userInfoPayload.empCode = _userProfile.empCode;
    _userInfoPayload.firstName = _userProfile.firstName;
    _userInfoPayload.gender = _userProfile.gender;
    _userInfoPayload.lastName = _userProfile.lastName;
    _userInfoPayload.loginMethod = _userProfile.loginMethod;
    _userInfoPayload.maritalStatus = _userProfile.maritalStatus;
    _userInfoPayload.middleName = _userProfile.middleName;
    _userInfoPayload.nationality = _userProfile.nationality;
    _userInfoPayload.personId = _userProfile.personId;
    _userInfoPayload.photo = photo;
    _userInfoPayload.placeOfBirth = _userProfile.placeOfBirth;
    _userInfoPayload.preferredFirstName = _userProfile.preferredFirstName;
    _userInfoPayload.preferredLastName = _userProfile.preferredLastName;
    _userInfoPayload.salutation = _userProfile.salutation;
    _userInfoPayload.secondNationality = _userProfile.secondNationality;
    _userInfoPayload.suffix = _userProfile.suffix;
    _userInfoPayload.supervisor = _userProfile.supervisor;
    _userInfoPayload.updateId = _userProfile.id;
    _userInfoPayload.userName = _userProfile.userName;

    await _apiProvider
        .update_Profile(_userInfoPayload)
        .then((value) => SaveUpdatedData(value));
  }

  SaveUpdatedData(dynamic userinfo) async {
    if (userinfo != null) {
      await appsharedprefs.saveUserInfo(userinfo);
    }
  }
  var routes;
  @override
  void initState() {

    Future.delayed(Duration.zero,(){
       routes =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      setState(() {

        _pickedImageString=routes['image'];
      });
    });






    // TODO: implement initState
    super.initState();
    state = AppState.free;
    fetch_userProfile();
    _progressSubscription = _fileUpload.uploader.progress.listen((progress) {
      final task = _tasks[progress.tag];
      print("progress: ${progress.progress} , tag: ${progress.tag}");
      if (task == null) return;
      if (task.isCompleted()) return;

      this.setState(() {
        _tasks[progress.tag] =
            task.copyWith(progress: progress.progress, status: progress.status);
      });
    });
    _resultSubscription = _fileUpload.uploader.result.listen((result) {
      _notificationManager.showNotification(100, "Profile Pic updated");

      print(
          "id: ${result.taskId}, status: ${result.status}, response: ${result.response}, statusCode: ${result.statusCode}, tag: ${result.tag}, headers: ${result.headers}");

      var body = result.response;

      setValueUpdate(jsonDecode(body)['data']);
      final task = _tasks[result.tag];
      if (task == null) return;

      this.setState(() {
        _tasks[result.tag] = task.copyWith(status: result.status);
      });
    }, onError: (ex, stacktrace) {
      print("exception: $ex");
      print("stacktrace: $stacktrace" ?? "no stacktrace");
      final exp = ex as UploadException;
      final task = _tasks[exp.tag];
      if (task == null) return;

      this.setState(() {
        _tasks[exp.tag] = task.copyWith(status: exp.status);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 240,
                    margin: EdgeInsets.only(top: 50),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: AppConstants.TEXT_BACKGROUND_COLOR),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Hero(
                                  tag: 'profile',
                                  child: Material(
                                      child: _pickedImage == null
                                          ? (_pickedImageString == null
                                              ? ImageIcon(
                                                  AssetImage(
                                                    'assets/images/myprofile_sidemenu_icon.png',
                                                  ),
                                                  size: 80,
                                                )
                                              : CircleAvatar(
                                                  radius: 40.0,
                                                  backgroundImage: NetworkImage(
                                                      "${_pickedImageString}"),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                ))
                                          : ClipOval(
                                              child: Image.file(_pickedImage))),
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 68,
                                child: CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {
                                      showPicker(context,
                                          onImagePick: (selected_image) {
                                        this.setState(() {
                                          _pickedImage = selected_image;

                                          state = AppState.cropped;

                                          _fileUpload.uploadFile(
                                              _pickedImage,
                                              'http://52.165.220.40:8080/uploadDoc/',
                                              _tasks, onstart: (taskid, tag) {
                                            this.setState(() {
                                              _tasks.putIfAbsent(
                                                  tag,
                                                  () => UploadItem(
                                                        id: taskid,
                                                        tag: tag,
                                                        type: MediaType.Image,
                                                        status: UploadTaskStatus
                                                            .enqueued,
                                                      ));
                                            });
                                            _notificationManager
                                                .showNotification(100,
                                                    "Updating Profile Pic");
                                          });
                                        });
                                      });
                                    },
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                  radius: 15,
                                  backgroundColor: AppConstants.APP_THEME_COLOR,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Text(
                                "${routes['name']}",
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.0),
                              ),
                              Text(
                                "Head-Global Mobility at OYO",
                                style: TextStyle(
                                    color: AppConstants.TEXT_BACKGROUND_COLOR),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      width: 50.0,
                      height: 120.0,
                      child: GetNotificationIcon(context),
                    ),
                  ),
                  Container(
                    width: 50.0,
                    height: 120.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context,_pickedImageString);
                      },
                      child: Center(
                        child: ImageIcon(
                          AssetImage(
                            'assets/images/back_terms_condition.png',
                          ),
                          size: 22,
                          color: AppConstants.TEXT_BACKGROUND_COLOR,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: tabWidget(
                                'assets/images/personal_info_tile.png',
                                "Personal Information", onClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonalInfo()),
                              );
                            }),
                          ),
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 4,
                            child: tabWidget('assets/images/contact.png',
                                "Emergency Contacts", onClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmergencyContact()),
                              );
                            }),
                          ),
                        ],
                      ),
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
