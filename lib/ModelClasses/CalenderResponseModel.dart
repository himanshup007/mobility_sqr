class CalenderEventResponseModel {
  String _massage;
  bool _status;
  List<CalendarEvent> _data;

  CalenderEventResponseModel({String massage, bool status, List<CalendarEvent> data}) {
    this._massage = massage;
    this._status = status;
    this._data = data;
  }

  String get massage => _massage;
  set massage(String massage) => _massage = massage;
  bool get status => _status;
  set status(bool status) => _status = status;
  List<CalendarEvent> get data => _data;
  set data(List<CalendarEvent> data) => _data = data;

  CalenderEventResponseModel.fromJson(Map<String, dynamic> json) {
    _massage = json['massage'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = new List<CalendarEvent>();
      json['data'].forEach((v) {
        _data.add(new CalendarEvent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this._massage;
    data['status'] = this._status;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CalendarEvent {
  int _id;
  String _dateCreated;
  String _dateModified;
  String _createdBy;
  String _modifiedBy;
  bool _status;
  String _fromDate;
  String _toDate;
  String _countryCode;
  String _countryName;
  String _cityCode;
  String _cityName;
  String _activity;
  String _isVisible;
  String _isDeleted;
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
  String _empCode;

  CalendarEvent(
      {int id,
        String dateCreated,
        String dateModified,
        String createdBy,
        String modifiedBy,
        bool status,
        String fromDate,
        String toDate,
        String countryCode,
        String countryName,
        String cityCode,
        String cityName,
        String activity,
        String isVisible,
        String isDeleted,
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
        String empCode}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._fromDate = fromDate;
    this._toDate = toDate;
    this._countryCode = countryCode;
    this._countryName = countryName;
    this._cityCode = cityCode;
    this._cityName = cityName;
    this._activity = activity;
    this._isVisible = isVisible;
    this._isDeleted = isDeleted;
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
    this._empCode = empCode;
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
  String get fromDate => _fromDate;
  set fromDate(String fromDate) => _fromDate = fromDate;
  String get toDate => _toDate;
  set toDate(String toDate) => _toDate = toDate;
  String get countryCode => _countryCode;
  set countryCode(String countryCode) => _countryCode = countryCode;
  String get countryName => _countryName;
  set countryName(String countryName) => _countryName = countryName;
  String get cityCode => _cityCode;
  set cityCode(String cityCode) => _cityCode = cityCode;
  String get cityName => _cityName;
  set cityName(String cityName) => _cityName = cityName;
  String get activity => _activity;
  set activity(String activity) => _activity = activity;
  String get isVisible => _isVisible;
  set isVisible(String isVisible) => _isVisible = isVisible;
  String get isDeleted => _isDeleted;
  set isDeleted(String isDeleted) => _isDeleted = isDeleted;
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
  String get empCode => _empCode;
  set empCode(String empCode) => _empCode = empCode;

  CalendarEvent.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _fromDate = json['from_date'];
    _toDate = json['to_date'];
    _countryCode = json['country_code'];
    _countryName = json['country_name'];
    _cityCode = json['city_code'];
    _cityName = json['city_name'];
    _activity = json['activity'];
    _isVisible = json['is_visible'];
    _isDeleted = json['is_deleted'];
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
    _empCode = json['emp_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['from_date'] = this._fromDate;
    data['to_date'] = this._toDate;
    data['country_code'] = this._countryCode;
    data['country_name'] = this._countryName;
    data['city_code'] = this._cityCode;
    data['city_name'] = this._cityName;
    data['activity'] = this._activity;
    data['is_visible'] = this._isVisible;
    data['is_deleted'] = this._isDeleted;
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
    data['emp_code'] = this._empCode;
    return data;


  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarEvent &&
          runtimeType == other.runtimeType &&
          _activity == other._activity;

  @override
  int get hashCode => _activity.hashCode;
}