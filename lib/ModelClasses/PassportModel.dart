class PassportModel {
  String _massage;
  bool _status;
  List<PassportDetail> _data;

  PassportModel({String massage, bool status, List<PassportDetail> data}) {
    this._massage = massage;
    this._status = status;
    this._data = data;
  }

  String get massage => _massage;
  set massage(String massage) => _massage = massage;
  bool get status => _status;
  set status(bool status) => _status = status;
  List<PassportDetail> get data => _data;
  set data(List<PassportDetail> data) => _data = data;

  PassportModel.fromJson(Map<String, dynamic> json) {
    _massage = json['massage'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = new List<PassportDetail>();
      json['data'].forEach((v) {
        _data.add(new PassportDetail.fromJson(v));
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

class PassportDetail {
  int _id;
  String _dateCreated;
  String _dateModified;
  String _createdBy;
  String _modifiedBy;
  bool _status;
  bool _passportStatus;
  String _passportNumber;
  String _passportExpiryDate;
  bool _isdependent;
  String _relation;
  String _nationality;
  String _countryOfIssue;
  String _placeOfIssue;
  String _dateOfIssue;
  String _dateOfExpiration;
  bool _duplicatePassport;
  String _pagesPassport;
  String _photo;
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
  dynamic _organization;

  PassportDetail(
      {int id,
        String dateCreated,
        String dateModified,
        String createdBy,
        String modifiedBy,
        bool status,
        bool passportStatus,
        String passportNumber,
        String passportExpiryDate,
        bool isdependent,
        String relation,
        String nationality,
        String countryOfIssue,
        String placeOfIssue,
        String dateOfIssue,
        String dateOfExpiration,
        bool duplicatePassport,
        String pagesPassport,
        String photo,
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
        String empCode,
        dynamic organization}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._passportStatus = passportStatus;
    this._passportNumber = passportNumber;
    this._passportExpiryDate = passportExpiryDate;
    this._isdependent = isdependent;
    this._relation = relation;
    this._nationality = nationality;
    this._countryOfIssue = countryOfIssue;
    this._placeOfIssue = placeOfIssue;
    this._dateOfIssue = dateOfIssue;
    this._dateOfExpiration = dateOfExpiration;
    this._duplicatePassport = duplicatePassport;
    this._pagesPassport = pagesPassport;
    this._photo = photo;
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
  bool get passportStatus => _passportStatus;
  set passportStatus(bool passportStatus) => _passportStatus = passportStatus;
  String get passportNumber => _passportNumber;
  set passportNumber(String passportNumber) => _passportNumber = passportNumber;
  String get passportExpiryDate => _passportExpiryDate;
  set passportExpiryDate(String passportExpiryDate) =>
      _passportExpiryDate = passportExpiryDate;
  bool get isdependent => _isdependent;
  set isdependent(bool isdependent) => _isdependent = isdependent;
  String get relation => _relation;
  set relation(String relation) => _relation = relation;
  String get nationality => _nationality;
  set nationality(String nationality) => _nationality = nationality;
  String get countryOfIssue => _countryOfIssue;
  set countryOfIssue(String countryOfIssue) => _countryOfIssue = countryOfIssue;
  String get placeOfIssue => _placeOfIssue;
  set placeOfIssue(String placeOfIssue) => _placeOfIssue = placeOfIssue;
  String get dateOfIssue => _dateOfIssue;
  set dateOfIssue(String dateOfIssue) => _dateOfIssue = dateOfIssue;
  String get dateOfExpiration => _dateOfExpiration;
  set dateOfExpiration(String dateOfExpiration) =>
      _dateOfExpiration = dateOfExpiration;
  bool get duplicatePassport => _duplicatePassport;
  set duplicatePassport(bool duplicatePassport) =>
      _duplicatePassport = duplicatePassport;
  String get pagesPassport => _pagesPassport;
  set pagesPassport(String pagesPassport) => _pagesPassport = pagesPassport;
  String get photo => _photo;
  set photo(String photo) => _photo = photo;
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
  dynamic get organization => _organization;
  set organization(dynamic organization) => _organization = organization;

  PassportDetail.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _passportStatus = json['passport_status'];
    _passportNumber = json['passport_number'];
    _passportExpiryDate = json['passport_expiry_date'];
    _isdependent = json['isdependent'];
    _relation = json['relation'];
    _nationality = json['nationality'];
    _countryOfIssue = json['country_of_issue'];
    _placeOfIssue = json['place_of_issue'];
    _dateOfIssue = json['date_of_issue'];
    _dateOfExpiration = json['date_of_expiration'];
    _duplicatePassport = json['duplicate_passport'];
    _pagesPassport = json['pages_passport'];
    _photo = json['photo'];
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
    data['passport_status'] = this._passportStatus;
    data['passport_number'] = this._passportNumber;
    data['passport_expiry_date'] = this._passportExpiryDate;
    data['isdependent'] = this._isdependent;
    data['relation'] = this._relation;
    data['nationality'] = this._nationality;
    data['country_of_issue'] = this._countryOfIssue;
    data['place_of_issue'] = this._placeOfIssue;
    data['date_of_issue'] = this._dateOfIssue;
    data['date_of_expiration'] = this._dateOfExpiration;
    data['duplicate_passport'] = this._duplicatePassport;
    data['pages_passport'] = this._pagesPassport;
    data['photo'] = this._photo;
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
    data['organization'] = this._organization;
    return data;
  }
}