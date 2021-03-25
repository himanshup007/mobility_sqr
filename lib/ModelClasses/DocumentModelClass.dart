class DocumentModelClass {
  String _massage;
  bool _status;
  List<Data> _data;

  DocumentModelClass({String massage, bool status, List<Data> data}) {
    this._massage = massage;
    this._status = status;
    this._data = data;
  }

  String get massage => _massage;
  set massage(String massage) => _massage = massage;
  bool get status => _status;
  set status(bool status) => _status = status;
  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;

  DocumentModelClass.fromJson(Map<String, dynamic> json) {
    _massage = json['massage'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
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

class Data {
  int _id;
  String _dateCreated;
  String _dateModified;
  String _createdBy;
  String _modifiedBy;
  bool _status;
  String _docName;
  String _docDescription;
  String _documentUrl;
  String _empCode;
  String _vaultType;

  Data(
      {int id,
        String dateCreated,
        String dateModified,
        String createdBy,
        String modifiedBy,
        bool status,
        String docName,
        String docDescription,
        String documentUrl,
        String empCode,
        String vaultType}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._docName = docName;
    this._docDescription = docDescription;
    this._documentUrl = documentUrl;
    this._empCode = empCode;
    this._vaultType = vaultType;
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
  String get docName => _docName;
  set docName(String docName) => _docName = docName;
  String get docDescription => _docDescription;
  set docDescription(String docDescription) => _docDescription = docDescription;
  String get documentUrl => _documentUrl;
  set documentUrl(String documentUrl) => _documentUrl = documentUrl;
  String get empCode => _empCode;
  set empCode(String empCode) => _empCode = empCode;
  String get vaultType => _vaultType;
  set vaultType(String vaultType) => _vaultType = vaultType;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _docName = json['doc_name'];
    _docDescription = json['doc_description'];
    _documentUrl = json['document_url'];
    _empCode = json['emp_code'];
    _vaultType = json['vault_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['doc_name'] = this._docName;
    data['doc_description'] = this._docDescription;
    data['document_url'] = this._documentUrl;
    data['emp_code'] = this._empCode;
    data['vault_type'] = this._vaultType;
    return data;
  }
}