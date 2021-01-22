class GetVisaModel {
  bool _status;
  String _message;
  List<GetVisaModelData> _data;

  GetVisaModel({bool status, String message, List<GetVisaModelData> data}) {
    this._status = status;
    this._message = message;
    this._data = data;
  }

  bool get status => _status;
  set status(bool status) => _status = status;
  String get message => _message;
  set message(String message) => _message = message;
  List<GetVisaModelData> get data => _data;
  set data(List<GetVisaModelData> data) => _data = data;

  GetVisaModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = new List<GetVisaModelData>();
      json['data'].forEach((v) {
        _data.add(new GetVisaModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetVisaModelData {
  int _id;
  String _countryCode;
  String _documentType;
  String _documentTitle;
  bool _isdependent;
  String _relation;
  String _documentNumber;
  String _issueDate;
  String _issuePlace;
  String _issuingAuthority;
  String _expirationDate;
  bool _isValidated;
  String _validFrom;
  String _attachmentId;
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

  GetVisaModelData(
      {int id,
        String countryCode,
        String documentType,
        String documentTitle,
        bool isdependent,
        String relation,
        String documentNumber,
        String issueDate,
        String issuePlace,
        String issuingAuthority,
        String expirationDate,
        bool isValidated,
        String validFrom,
        String attachmentId,
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
    this._countryCode = countryCode;
    this._documentType = documentType;
    this._documentTitle = documentTitle;
    this._isdependent = isdependent;
    this._relation = relation;
    this._documentNumber = documentNumber;
    this._issueDate = issueDate;
    this._issuePlace = issuePlace;
    this._issuingAuthority = issuingAuthority;
    this._expirationDate = expirationDate;
    this._isValidated = isValidated;
    this._validFrom = validFrom;
    this._attachmentId = attachmentId;
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
  String get countryCode => _countryCode;
  set countryCode(String countryCode) => _countryCode = countryCode;
  String get documentType => _documentType;
  set documentType(String documentType) => _documentType = documentType;
  String get documentTitle => _documentTitle;
  set documentTitle(String documentTitle) => _documentTitle = documentTitle;
  bool get isdependent => _isdependent;
  set isdependent(bool isdependent) => _isdependent = isdependent;
  String get relation => _relation;
  set relation(String relation) => _relation = relation;
  String get documentNumber => _documentNumber;
  set documentNumber(String documentNumber) => _documentNumber = documentNumber;
  String get issueDate => _issueDate;
  set issueDate(String issueDate) => _issueDate = issueDate;
  String get issuePlace => _issuePlace;
  set issuePlace(String issuePlace) => _issuePlace = issuePlace;
  String get issuingAuthority => _issuingAuthority;
  set issuingAuthority(String issuingAuthority) =>
      _issuingAuthority = issuingAuthority;
  String get expirationDate => _expirationDate;
  set expirationDate(String expirationDate) => _expirationDate = expirationDate;
  bool get isValidated => _isValidated;
  set isValidated(bool isValidated) => _isValidated = isValidated;
  String get validFrom => _validFrom;
  set validFrom(String validFrom) => _validFrom = validFrom;
  String get attachmentId => _attachmentId;
  set attachmentId(String attachmentId) => _attachmentId = attachmentId;
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

  GetVisaModelData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _countryCode = json['country_code'];
    _documentType = json['document_type'];
    _documentTitle = json['document_title'];
    _isdependent = json['isdependent'];
    _relation = json['relation'];
    _documentNumber = json['document_number'];
    _issueDate = json['issue_date'];
    _issuePlace = json['issue_place'];
    _issuingAuthority = json['issuing_authority'];
    _expirationDate = json['expiration_date'];
    _isValidated = json['is_validated'];
    _validFrom = json['valid_from'];
    _attachmentId = json['attachment_id'];
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
    data['country_code'] = this._countryCode;
    data['document_type'] = this._documentType;
    data['document_title'] = this._documentTitle;
    data['isdependent'] = this._isdependent;
    data['relation'] = this._relation;
    data['document_number'] = this._documentNumber;
    data['issue_date'] = this._issueDate;
    data['issue_place'] = this._issuePlace;
    data['issuing_authority'] = this._issuingAuthority;
    data['expiration_date'] = this._expirationDate;
    data['is_validated'] = this._isValidated;
    data['valid_from'] = this._validFrom;
    data['attachment_id'] = this._attachmentId;
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