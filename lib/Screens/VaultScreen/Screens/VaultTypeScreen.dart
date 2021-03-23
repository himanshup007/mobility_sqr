import 'dart:io';


import 'package:clay_containers/clay_containers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/FilePickerUtil/FilePickerUtil.dart';
import 'package:mobility_sqr/ImagePickerLibUtil/ImagePickerUtil.dart';
import 'package:mobility_sqr/Screens/SOS/SOS.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:sizer/sizer.dart';

class VaultTypeScreen extends StatefulWidget {
  String VaultType;

  VaultTypeScreen(@required this.VaultType);

  @override
  _VaultTypeScreenState createState() => _VaultTypeScreenState();
}

class _VaultTypeScreenState extends State<VaultTypeScreen> {
  PlatformFile _paths;
  String DocPath;

  TextEditingController _doc_name_textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
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
                                      _paths = path;

                                      String _fileName =
                                          _paths != null ? _paths.name : '...';
                                      _doc_name_textcontroller.text = _fileName;
                                      this.setState(() {
                                        DocPath = _paths.path;
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
    );
  }
}

void showAlertDialogforFilePicker(BuildContext context,
    {Function(PlatformFile) pdfpick,Function(File)onImagePick}) {
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

                    showPicker(context,
                        onImagePick: (selected_image) {
                          File f = new File(selected_image.path);
                       String file_name=   File(selected_image.path).path.split('/').last;
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
