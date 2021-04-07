import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clay_containers/widgets/clay_container.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/FileUpload/FileUploader.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';
import 'package:mobility_sqr/ModelClasses/PassportModel.dart';
import 'package:mobility_sqr/ModelClasses/RelationList.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/Screens/TravelCalendar/customEventWidget.dart';
import 'package:mobility_sqr/Screens/VaultScreen/Screens/VaultTypeScreen.dart';
import 'package:mobility_sqr/Util/UtilClass.dart';

import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:sizer/sizer.dart';

class AddNewPassport extends StatefulWidget {
  @override
  _AddNewPassportState createState() => _AddNewPassportState();
}

class _AddNewPassportState extends State<AddNewPassport> {
  PlatformFile _paths;
  String DocPath;

  File docFile;
  FileUpload _fileUpload = FileUpload.instance;
  TextEditingController _doc_name_textcontroller = TextEditingController();
  StreamSubscription _progressSubscription;
  StreamSubscription _resultSubscription;
  Map<String, UploadItem> _tasks = {};
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TokenGetter _getter = TokenGetter();
  List<Relation> relationList = [
    Relation(id: 100, status: false, code: 'self', description: 'self')
  ];
  Relation selectedRelation;
  bool isPassportActive = true;
  bool isDuplicatePassport = true;

  ApiProvider _apiProvider = ApiProvider();
  List<String> _Countrylist;
  List<CountryModel> _CountrylistModel;
  Country selCountry =
      Country(name: "Select Country", iso3Code: '', isoCode: '', phoneCode: '');
  Country selCountryIssue =
      Country(name: "Select Country", iso3Code: '', isoCode: '', phoneCode: '');
  DateTime _dateTimeIssue;
  DateTime _dateTimeExpiry;

  ScrollController _scrollController = ScrollController();

  String _pickedFileString = "";

  double _progressValue = 0.0;

  bool showloader = false;
  PassportDetail passportModel = PassportDetail();

  @override
  void initState() {
    super.initState();

    passportModel.passportStatus = isPassportActive;
    passportModel.duplicatePassport = isDuplicatePassport;

    SchedulerBinding.instance.addPostFrameCallback((_) =>
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
    this.setState(() {
      selectedRelation = relationList[0];
    });

    getRelationList();

    _apiProvider
        .getCountrylist(countryId: "")
        .then((value) => CountrySetter(value));

    _progressSubscription = _fileUpload.uploader.progress.listen((progress) {
      final task = _tasks[progress.tag];
      print("progress: ${progress.progress} , tag: ${progress.tag}");

      if (task == null) return;
      if (task.isCompleted()) return;

      this.setState(() {
        _progressValue = progress.progress.toDouble();
        _tasks[progress.tag] =
            task.copyWith(progress: progress.progress, status: progress.status);
      });
    });
    _resultSubscription = _fileUpload.uploader.result.listen((result) {
      print(
          "id: ${result.taskId}, status: ${result.status}, response: ${result.response}, statusCode: ${result.statusCode}, tag: ${result.tag}, headers: ${result.headers}");

      var body = result.response;

      _pickedFileString = jsonDecode(body)['data'];
      this.setState(() {
        showloader = false;
      });
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

  CountrySetter(value) {
    this.setState(() {
      _Countrylist = getShortName(value);
      _CountrylistModel = value.data;
    });
  }

  getShortName(CountryListModel value) {
    List<String> myCountryCodes = [];

    for (int i = 0; i < value.data.length; i++) {
      myCountryCodes.add(value.data[i].sortname);
    }

    return myCountryCodes;
  }

  getRelationList() async {
    RelationList data = await _getter.readRelationList();
    if (data != null) {
      this.setState(() {
        relationList.addAll(data.data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      floatingActionButton: !keyboardIsOpened
          ? FloatingActionButton.extended(
              elevation: 50,
              backgroundColor: AppConstants.APP_THEME_COLOR,
              autofocus: true,
              onPressed: () async {
                passportModel.photo = _pickedFileString;
                UserInfo userInfo = await _getter.readUserInfo();
                passportModel.empCode = userInfo.data.empCode;
                passportModel.status=true;
                ;
              },
              icon: Icon(Icons.save),
              tooltip: 'Save',
              label: Text('Save'),
            )
          : null,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0.0,
        title: Text(
          "Add Passport",
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
            width: 95.0.w,
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Passport For',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  width: 90.0.w,
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: FormField<RelationList>(
                    builder: (FormFieldState<RelationList> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Relation>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Select Relation"),
                            ),
                            value: selectedRelation,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                selectedRelation = newValue;
                                if (newValue.description == 'self') {
                                  passportModel.isdependent = false;
                                  passportModel.relation =
                                      newValue.id.toString();
                                } else {
                                  passportModel.relation = newValue.description;
                                }
                              });
                            },
                            items: relationList != null
                                ? relationList.map((Relation value) {
                                    return DropdownMenuItem<Relation>(
                                      value: value,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(value.description),
                                      ),
                                    );
                                  }).toList()
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Passport Active',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    FlutterSwitch(
                      height: 25.0,
                      width: 60.0,
                      padding: 2.0,
                      toggleSize: 25.0,
                      borderRadius: 12.0,
                      valueFontSize: 12,
                      showOnOff: true,
                      inactiveColor: Colors.black12,
                      activeColor: AppConstants.APP_THEME_COLOR,
                      value: isPassportActive,
                      onToggle: (value) {
                        print(value);
                        this.setState(() {
                          passportModel.passportStatus =
                              !passportModel.passportStatus;
                          isPassportActive = !isPassportActive;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Is this a duplicate passport?',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    FlutterSwitch(
                      height: 25.0,
                      width: 60.0,
                      padding: 2.0,
                      toggleSize: 25.0,
                      borderRadius: 12.0,
                      valueFontSize: 12,
                      showOnOff: true,
                      inactiveColor: Colors.black12,
                      activeColor: AppConstants.APP_THEME_COLOR,
                      value: isDuplicatePassport,
                      onToggle: (value) {
                        print(value);
                        this.setState(() {
                          passportModel.duplicatePassport =
                              !passportModel.duplicatePassport;
                          isDuplicatePassport = !isDuplicatePassport;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Passport Number",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50.0.w,
                      height: 40,
                      child: new TextField(
                        maxLength: 16,
                        style: TextStyle(fontSize: 18),
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (text) {
                          passportModel.passportNumber = text;
                        },
                        decoration: new InputDecoration(
                          counterText: '',
                          contentPadding: EdgeInsets.only(left: 10),
                          enabledBorder: const OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Nationality",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: selCountry != null && selCountry.isoCode != ''
                          ? Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              margin: EdgeInsets.only(bottom: 20),
                              child: CountryPickerUtils.getDefaultFlagImage(
                                  selCountry))
                          : Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              margin: EdgeInsets.only(bottom: 20),
                              child: Icon(Icons.flag),
                            ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 6,
                      child: CustomEventWidget(
                          "${selCountry.name}",
                          "Select Country",
                          Icons.arrow_drop_down_sharp,
                          context, onTap: () {
                        openCustomCountryPickerDialog(context,
                            callback: (value) {
                          this.setState(() {
                            selCountry = value;
                          });
                          passportModel.nationality = selCountry.name;
                        }, list: _Countrylist != null ? _Countrylist : "");
                      }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Country of Issue",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: selCountryIssue != null &&
                              selCountryIssue.isoCode != ''
                          ? Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              margin: EdgeInsets.only(bottom: 20),
                              child: CountryPickerUtils.getDefaultFlagImage(
                                  selCountryIssue))
                          : Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              margin: EdgeInsets.only(bottom: 20),
                              child: Icon(Icons.flag),
                            ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 6,
                      child: CustomEventWidget(
                          "${selCountryIssue.name}",
                          "Select Country",
                          Icons.arrow_drop_down_sharp,
                          context, onTap: () {
                        openCustomCountryPickerDialog(context,
                            callback: (value) {
                          this.setState(() {
                            selCountryIssue = value;
                          });

                          passportModel.countryOfIssue = selCountry.name;
                        }, list: _Countrylist != null ? _Countrylist : "");
                      }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Place of Issue",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        width: 50.0.w,
                        height: 40,
                        child: new TextField(
                          maxLength: 16,
                          style: TextStyle(fontSize: 18),
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (text) {
                            passportModel.placeOfIssue = text;
                          },
                          decoration: new InputDecoration(
                            counterText: '',
                            contentPadding: EdgeInsets.only(left: 10),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Date of Issue",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0.w,
                      child: CustomEventWidget(
                          getDepartureEventFormat(_dateTimeIssue == null
                              ? DateTime.now().toString()
                              : _dateTimeIssue.toString()),
                          "Date of Issue",
                          Icons.calendar_today,
                          context, onTap: () {
                        selectDate(
                            context,
                            DateTime(2010),
                            DateTime(2100),
                            _dateTimeIssue == null
                                ? DateTime.now()
                                : _dateTimeIssue, datevalue: (selDate) {
                          passportModel.dateOfIssue = selDate;
                          this.setState(() {
                            _dateTimeIssue = DateTime.parse(selDate);
                          });
                        });
                      }),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Date of Expiration",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0.w,
                      child: CustomEventWidget(
                          getDepartureEventFormat(_dateTimeExpiry == null
                              ? DateTime.now().toString()
                              : _dateTimeExpiry.toString()),
                          "Date of Expiration",
                          Icons.calendar_today,
                          context, onTap: () {
                        selectDate(
                            context,
                            DateTime(2010),
                            DateTime(2100),
                            _dateTimeExpiry == null
                                ? DateTime.now()
                                : _dateTimeExpiry, datevalue: (selDate) {
                          passportModel.passportExpiryDate = selDate;
                          this.setState(() {
                            _dateTimeExpiry = DateTime.parse(selDate);
                          });
                        });
                      }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Text(
                        "Empty pages left in the passport",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      width: 10.0.w,
                      height: 40,
                      child: new TextField(
                        maxLength: 3,
                        style: TextStyle(fontSize: 18),
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (text) {
                          passportModel.pagesPassport = text;
                        },
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: false),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: new InputDecoration(
                          counterText: '',
                          contentPadding: EdgeInsets.only(left: 10),
                          enabledBorder: const OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FittedBox(
                  child: Container(
                      width: 100.0.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white),
                              child: GestureDetector(
                                onTap: () async {
                                  showAlertDialogforFilePicker(context,
                                      pdfpick: (path) async {
                                    showloader = true;
                                    final File fileForFirebase =
                                        File(path.path);

                                    this.setState(() {
                                      _paths = path;
                                      DocPath = _paths.path;

                                      docFile = fileForFirebase;
                                      FileuploadService(fileForFirebase);
                                    });
                                    String _fileName =
                                        _paths != null ? _paths.name : '...';
                                    _doc_name_textcontroller.text = _fileName;
                                  }, imagepick: (file) async {
                                    showloader = true;
                                    String file_name =
                                        file.path.split('/').last;
                                    _doc_name_textcontroller.text = file_name;

                                    this.setState(() {
                                      DocPath = file.path;

                                      docFile = file;

                                      FileuploadService(docFile);
                                    });
                                  });
                                },
                                child: ClayContainer(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 25,
                                          ),
                                          Text(_doc_name_textcontroller.text ==
                                                  ''
                                              ? "Choose File"
                                              : "Change File")
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Container(
                              width: 60.0.w,
                              child: TextField(
                                maxLength: 20,
                                style: TextStyle(fontSize: 18),
                                enabled: false,
                                controller: _doc_name_textcontroller,
                                decoration: new InputDecoration(
                                    counterText: '',
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: "Document Name ",
                                    border: new OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Container(
                  height: 60,
                  child: Text(""),
                ),
              ],
            ),
          ),
          showloader
              ? Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.black26,
                  child: Center(
                    child: Container(
                      width: 50.0.w,
                      height: 50.0.w,
                      child: LiquidCircularProgressIndicator(
                        value: _progressValue / 100,
                        valueColor: AlwaysStoppedAnimation(
                            AppConstants.APP_THEME_COLOR),
                        backgroundColor: Colors.white,
                        borderColor: Colors.red,
                        borderWidth: 1.0,
                        direction: Axis.vertical,
                        center: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$_progressValue%\n Uploading Document',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.yellow),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  FileuploadService(_pickedFile) {
    _fileUpload
        .uploadFile(_pickedFile, 'http://52.165.220.40:8080/uploadDoc/', _tasks,
            onstart: (taskid, tag) {
      this.setState(() {
        _tasks.putIfAbsent(
            tag,
            () => UploadItem(
                  id: taskid,
                  tag: tag,
                  status: UploadTaskStatus.enqueued,
                ));
      });
    });
  }
}
