import 'dart:async';
import 'package:meta/meta.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:path/path.dart';
import 'package:flutter_uploader/flutter_uploader.dart';

enum MediaType { Image, Video }

class FileUpload {
  final uploader = FlutterUploader();

  FileUpload._privateConstructor();

  static final FileUpload _instance = FileUpload._privateConstructor();

  static FileUpload get instance => _instance;

  uploadFile(image, _uploadUrl, _tasks,
      {Function(String, String) onstart}) async {
    ApiProvider _api = ApiProvider();
    String token = await _api.getToken_byReresh();

    if (image != null) {
      final String filename = basename(image.path);
      final String savedDir = dirname(image.path);
      final tag = "File upload ${filename}";
      var url = _uploadUrl;
      var fileItem = FileItem(
        filename: filename,
        savedDir: savedDir,
        fieldname: "file",
      );

      var taskId = await uploader.enqueue(
        url: url,
        data: {"name": "test"},
        files: [fileItem],
        method: UploadMethod.POST,
        headers: {'Authorization': 'Bearer ${token}'},
        tag: tag,
        showNotification: true,
      );
      onstart(taskId, tag);
    }
  }
}

class UploadItem {
  final String id;
  final String tag;
  final MediaType type;
  final int progress;
  final UploadTaskStatus status;

  UploadItem({
    this.id,
    this.tag,
    this.type,
    this.progress = 0,
    this.status = UploadTaskStatus.undefined,
  });

  UploadItem copyWith({UploadTaskStatus status, int progress}) => UploadItem(
      id: this.id,
      tag: this.tag,
      type: this.type,
      status: status ?? this.status,
      progress: progress ?? this.progress);

  bool isCompleted() =>
      this.status == UploadTaskStatus.canceled ||
      this.status == UploadTaskStatus.complete ||
      this.status == UploadTaskStatus.failed;
}
