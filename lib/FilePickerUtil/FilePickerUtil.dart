import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class FilePickerUtil {
  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  bool _multiPick = false;
  FileType _pickingType = FileType.custom;



  FilePickerUtil();

   openFileExplorer() async {

    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: ['pdf', 'doc'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }

      return _paths[0];

  }





}
