import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

File _image;

final picker = ImagePicker();
Future<File> _getImageFromCamera() async {

  final pickedImage = await picker.getImage(source: ImageSource.camera);
  _image = pickedImage != null ? File(pickedImage.path) : null;
  if (_image != null) {
    return  _cropImage();
  }
}

Future<File> _getImageFromGallery() async {
  final pickedImage = await picker.getImage(source: ImageSource.gallery);
  _image = pickedImage != null ? File(pickedImage.path) : null;
  if (_image != null) {
   return _cropImage();
  }
}
Future<File> _cropImage() async {
  File croppedFile = await ImageCropper.cropImage(
      sourcePath: _image.path,
      compressQuality: 50,
      compressFormat: ImageCompressFormat.png,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
      ]
          : [
        CropAspectRatioPreset.square,
      ],
      androidUiSettings: AndroidUiSettings(
          hideBottomControls: true,
          showCropGrid: true,
          toolbarColor: Color(0xff94488F),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        title: 'Cropper',
      ));
  if (croppedFile != null) {


    return croppedFile;


  }
}


void showPicker(context,{Function(File)onImagePick }) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Photo Library'),
                    onTap: () async {
                    File _image=  await _getImageFromGallery();

                    onImagePick(_image);

                    Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: ()  async {
                    File _image= await _getImageFromCamera();

                    onImagePick(_image);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}
