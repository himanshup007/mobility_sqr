import 'dart:async';
import 'dart:io';

import 'package:clay_containers/clay_containers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/FilePickerUtil/FilePickerUtil.dart';
import 'package:mobility_sqr/FileUpload/FileUploader.dart';
import 'package:mobility_sqr/ImagePickerLibUtil/ImagePickerUtil.dart';
import 'package:mobility_sqr/ModelClasses/PostDocModel.dart';
import 'package:mobility_sqr/NotificationManager/Notification.dart';
import 'package:mobility_sqr/Screens/SOS/SOS.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:sizer/sizer.dart';

class VaultTypeScreen extends StatefulWidget {
  String VaultType;

  String vaultId;

  VaultTypeScreen(@required this.VaultType, this.vaultId);

  @override
  _VaultTypeScreenState createState() => _VaultTypeScreenState();
}

class _VaultTypeScreenState extends State<VaultTypeScreen> {
  PlatformFile _paths;
  String DocPath;
  Map<String, UploadItem> _tasks = {};
  File docFile;
  StreamSubscription _progressSubscription;
  StreamSubscription _resultSubscription;
  TextEditingController _doc_name_textcontroller = TextEditingController();
  TextEditingController _document_name_textcontroller = TextEditingController();
  TextEditingController _doc_des_textcontroller = TextEditingController();
  ApiProvider _apiProvider=ApiProvider();
  FileUpload _fileUpload = FileUpload.instance;

  NotificationManager _notificationManager = NotificationManager.instance;

  bool showloader=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      _notificationManager.showNotification(100, "Document uploaded Successfully!");

      this.setState(() {
        showloader=false;
      });
      print(
          "id: ${result.taskId}, status: ${result.status}, response: ${result.response}, statusCode: ${result.statusCode}, tag: ${result.tag}, headers: ${result.headers}");

      var body = result.response;

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

      this.setState(() {
        showloader=false;
      });
      if (task == null) return;

      this.setState(() {

        _tasks[exp.tag] = task.copyWith(status: exp.status);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            child: Column(
              children: [
                FittedBox(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100.0.w,
                          child: Text(
                            "Document Name",
                            style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 100.0.w,
                          child: TextField(
                            maxLength: 20,
                            style: TextStyle(fontSize: 18),
                            controller: _document_name_textcontroller,
                            decoration: new InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: "Enter Document Name ",
                                border: new OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Colors.grey))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FittedBox(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100.0.w,
                          child: Text(
                            "Document Description",
                            style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 100.0.w,
                          height: 20.0.h,
                          child: TextField(
                            maxLength: 250,
                            maxLines: 50,
                            style: TextStyle(fontSize: 18),
                            controller: _doc_des_textcontroller,
                            decoration: new InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: "Enter Document Description ",
                                border: new OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Colors.grey))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                FittedBox(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100.0.w,
                          child: Row(
                            children: [
                              Icon(Icons.attach_file),
                              Text(
                                "Attach Document",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FittedBox(
                          child: Container(
                              width: 100.0.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(color: Colors.white),
                                    child: GestureDetector(
                                      onTap: () async {
                                        showAlertDialogforFilePicker(context,
                                            pdfpick: (path) async {


                                          final File fileForFirebase = File(path.path);

                                          this.setState(() {

                                            _paths = path;
                                            DocPath = _paths.path;

                                            docFile=fileForFirebase;

                                          });
                                          String _fileName =
                                              _paths != null ? _paths.name : '...';
                                          _doc_name_textcontroller.text = _fileName;

                                        }, imagepick: (file) async {

                                          String file_name =
                                              file.path.split('/').last;
                                          _doc_name_textcontroller.text = file_name;

                                          this.setState(() {
                                            DocPath = file.path;

                                            docFile=file;

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
                                                _doc_name_textcontroller
                                                        .text.isEmpty
                                                    ? Text("Choose File")
                                                    : Text("Change File"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 60.0.w,
                                      child: TextField(
                                        controller: _doc_name_textcontroller,
                                        maxLength: 20,
                                        style: TextStyle(fontSize: 18),
                                        enabled: false,
                                        decoration: new InputDecoration(
                                            counterText: '',
                                            contentPadding: EdgeInsets.all(5),
                                            hintText: "Document Name ",
                                            border: new OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                borderSide: BorderSide(
                                                    color: Colors.grey))),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                    "Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                onPressed: () {
                  PostDocModel model=PostDocModel();
                  model.docName=_document_name_textcontroller.text;
                  model.docDescription=_doc_des_textcontroller.text;
                  model.documentUrl=DocPath;
                  model.vaultType=widget.vaultId;

                  _fileUpload.uploadFileVault(docFile,  AppConstants.BASE_URL + AppConstants.POST_VAULT_DOCUMENT, _tasks, model);
                  _notificationManager.showNotification(100, "Document Uploading");
                  this.setState(() {
                    showloader=true;
                  });
                },
              ),
            ),
          ),

          showMobilityLoader(showloader, Colors.transparent)

        ],
      ),
    );
  }
}

void showAlertDialogforFilePicker(BuildContext context,
    {Function(PlatformFile) pdfpick, Function(File) imagepick}) {
  FilePickerUtil util = FilePickerUtil();
  showDialog(
      builder: (context) => CupertinoAlertDialog(
            title: Text("Choose File"),
            content: Text("Please choose the Option"),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);

                    showPicker(context, onImagePick: (selected_image) {
                      File f = new File(selected_image.path);
                      imagepick(f);
                    });
                  },
                  child: Text("Select Photo")),
              CupertinoDialogAction(
                  textStyle: TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () async {
                    Navigator.pop(context);
                    PlatformFile path = await util.openFileExplorer();
                    pdfpick(path);
                  },
                  child: Text("Select PDF")),
            ],
          ),
      context: context);
}
