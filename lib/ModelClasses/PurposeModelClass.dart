class PurposeModelClass {
  bool _status;
  String _message;
  List<Data> _data;

  PurposeModelClass({bool status, String message, List<Data> data}) {
    this._status = status;
    this._message = message;
    this._data = data;
  }

  bool get status => _status;
  set status(bool status) => _status = status;
  String get message => _message;
  set message(String message) => _message = message;
  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;

  PurposeModelClass.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['Message'];
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['Message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  bool _isChecked=false;
  int _id;
  String _dateCreated;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    _isChecked = value;
  }

  String _dateModified;
  dynamic _createdBy;
  dynamic _modifiedBy;
  bool _status;
  String _vPID;
  String _country;
  String _purposeName;
  String _applicableVisa;
  String _organization;
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

  Data(
      { bool isChecked,
        int id,
        String dateCreated,
        String dateModified,
        dynamic createdBy,
        dynamic modifiedBy,
        bool status,
        String vPID,
        String country,
        String purposeName,
        String applicableVisa,
        String organization,
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
        dynamic column12}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._vPID = vPID;
    this._country = country;
    this._purposeName = purposeName;
    this._applicableVisa = applicableVisa;
    this._organization = organization;
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
    this._isChecked=isChecked;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get dateCreated => _dateCreated;
  set dateCreated(String dateCreated) => _dateCreated = dateCreated;
  String get dateModified => _dateModified;
  set dateModified(String dateModified) => _dateModified = dateModified;
  dynamic get createdBy => _createdBy;
  set createdBy(dynamic createdBy) => _createdBy = createdBy;
  dynamic get modifiedBy => _modifiedBy;
  set modifiedBy(dynamic modifiedBy) => _modifiedBy = modifiedBy;
  bool get status => _status;
  set status(bool status) => _status = status;
  String get vPID => _vPID;
  set vPID(String vPID) => _vPID = vPID;
  String get country => _country;
  set country(String country) => _country = country;
  String get purposeName => _purposeName;
  set purposeName(String purposeName) => _purposeName = purposeName;
  String get applicableVisa => _applicableVisa;
  set applicableVisa(String applicableVisa) => _applicableVisa = applicableVisa;
  String get organization => _organization;
  set organization(String organization) => _organization = organization;
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

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _vPID = json['VPID'];
    _country = json['country'];
    _purposeName = json['purpose_name'];
    _applicableVisa = json['applicable_visa'];
    _organization = json['organization'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['VPID'] = this._vPID;
    data['country'] = this._country;
    data['purpose_name'] = this._purposeName;
    data['applicable_visa'] = this._applicableVisa;
    data['organization'] = this._organization;
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
    return data;
  }
}
