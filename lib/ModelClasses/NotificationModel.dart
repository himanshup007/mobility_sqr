class NotificationModel {
  bool _status;
  int _statusCode;
  String _message;
  List<NotificationData> _data;

  NotificationModel(
      {bool status, int statusCode, String message, List<NotificationData> data}) {
    this._status = status;
    this._statusCode = statusCode;
    this._message = message;
    this._data = data;
  }

  bool get status => _status;
  set status(bool status) => _status = status;
  int get statusCode => _statusCode;
  set statusCode(int statusCode) => _statusCode = statusCode;
  String get message => _message;
  set message(String message) => _message = message;
  List<NotificationData> get data => _data;
  set data(List<NotificationData> data) => _data = data;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _statusCode = json['status_code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = new List<NotificationData>();
      json['data'].forEach((v) {
        _data.add(new NotificationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['status_code'] = this._statusCode;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationData {
  int _id;
  String _dateCreated;
  String _dateModified;
  String _createdBy;
  String _modifiedBy;
  bool _status;
  String _notificationID;
  String _message;
  String _entityType;
  String _entityID;
  String _notificationDate;
  String _actionTakenBy;
  dynamic _column1;
  dynamic _column2;
  dynamic _column3;
  dynamic _column4;
  dynamic _column5;
  dynamic _column6;
  dynamic _column7;
  dynamic _column8;
  dynamic _column9;
  dynamic _column10;
  dynamic _column11;
  dynamic _column12;
  String _organization;

  NotificationData(
      {int id,
        String dateCreated,
        String dateModified,
        String createdBy,
        String modifiedBy,
        bool status,
        String notificationID,
        String message,
        String entityType,
        String entityID,
        String notificationDate,
        String actionTakenBy,
        dynamic column1,
        dynamic column2,
        dynamic column3,
        dynamic column4,
        dynamic column5,
        dynamic column6,
        dynamic column7,
        dynamic column8,
        dynamic column9,
        dynamic column10,
        dynamic column11,
        dynamic column12,
        String organization}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._notificationID = notificationID;
    this._message = message;
    this._entityType = entityType;
    this._entityID = entityID;
    this._notificationDate = notificationDate;
    this._actionTakenBy = actionTakenBy;
    this._column1 = column1;
    this._column2 = column2;
    this._column3 = column3;
    this._column4 = column4;
    this._column5 = column5;
    this._column6 = column6;
    this._column7 = column7;
    this._column8 = column8;
    this._column9 = column9;
    this._column10 = column10;
    this._column11 = column11;
    this._column12 = column12;
    this._organization = organization;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get dateCreated => _dateCreated;
  set dateCreated(String dateCreated) => _dateCreated = dateCreated;
  String get dateModified => _dateModified;
  set dateModified(String dateModified) => _dateModified = dateModified;
  String get createdBy => _createdBy;
  set createdBy(String createdBy) => _createdBy = createdBy;
  String get modifiedBy => _modifiedBy;
  set modifiedBy(String modifiedBy) => _modifiedBy = modifiedBy;
  bool get status => _status;
  set status(bool status) => _status = status;
  String get notificationID => _notificationID;
  set notificationID(String notificationID) => _notificationID = notificationID;
  String get message => _message;
  set message(String message) => _message = message;
  String get entityType => _entityType;
  set entityType(String entityType) => _entityType = entityType;
  String get entityID => _entityID;
  set entityID(String entityID) => _entityID = entityID;
  String get notificationDate => _notificationDate;
  set notificationDate(String notificationDate) =>
      _notificationDate = notificationDate;
  String get actionTakenBy => _actionTakenBy;
  set actionTakenBy(String actionTakenBy) => _actionTakenBy = actionTakenBy;
  dynamic get column1 => _column1;
  set column1(dynamic column1) => _column1 = column1;
  dynamic get column2 => _column2;
  set column2(dynamic column2) => _column2 = column2;
  dynamic get column3 => _column3;
  set column3(dynamic column3) => _column3 = column3;
  dynamic get column4 => _column4;
  set column4(dynamic column4) => _column4 = column4;
  dynamic get column5 => _column5;
  set column5(dynamic column5) => _column5 = column5;
  dynamic get column6 => _column6;
  set column6(dynamic column6) => _column6 = column6;
  dynamic get column7 => _column7;
  set column7(dynamic column7) => _column7 = column7;
  dynamic get column8 => _column8;
  set column8(dynamic column8) => _column8 = column8;
  dynamic get column9 => _column9;
  set column9(dynamic column9) => _column9 = column9;
  dynamic get column10 => _column10;
  set column10(dynamic column10) => _column10 = column10;
  dynamic get column11 => _column11;
  set column11(dynamic column11) => _column11 = column11;
  dynamic get column12 => _column12;
  set column12(dynamic column12) => _column12 = column12;
  String get organization => _organization;
  set organization(String organization) => _organization = organization;

  NotificationData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _notificationID = json['Notification_ID'];
    _message = json['Message'];
    _entityType = json['Entity_Type'];
    _entityID = json['Entity_ID'];
    _notificationDate = json['Notification_Date'];
    _actionTakenBy = json['Action_taken_by'];
    _column1 = json['column1'];
    _column2 = json['column2'];
    _column3 = json['column3'];
    _column4 = json['column4'];
    _column5 = json['column5'];
    _column6 = json['column6'];
    _column7 = json['column7'];
    _column8 = json['column8'];
    _column9 = json['column9'];
    _column10 = json['column10'];
    _column11 = json['column11'];
    _column12 = json['column12'];
    _organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['Notification_ID'] = this._notificationID;
    data['Message'] = this._message;
    data['Entity_Type'] = this._entityType;
    data['Entity_ID'] = this._entityID;
    data['Notification_Date'] = this._notificationDate;
    data['Action_taken_by'] = this._actionTakenBy;
    data['column1'] = this._column1;
    data['column2'] = this._column2;
    data['column3'] = this._column3;
    data['column4'] = this._column4;
    data['column5'] = this._column5;
    data['column6'] = this._column6;
    data['column7'] = this._column7;
    data['column8'] = this._column8;
    data['column9'] = this._column9;
    data['column10'] = this._column10;
    data['column11'] = this._column11;
    data['column12'] = this._column12;
    data['organization'] = this._organization;
    return data;
  }
}