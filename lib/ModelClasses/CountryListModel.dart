class CountryListModel {
  bool _status;
  String _message;
  List<CountryModel> _data;

  CountryListModel({bool status, String message, List<CountryModel> data}) {
    this._status = status;
    this._message = message;
    this._data = data;
  }

  bool get status => _status;
  set status(bool status) => _status = status;
  String get message => _message;
  set message(String message) => _message = message;
  List<CountryModel> get data => _data;
  set data(List<CountryModel> data) => _data = data;

  CountryListModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['Message'];
    if (json['data'] != null) {
      _data = new List<CountryModel>();
      json['data'].forEach((v) {
        _data.add(new CountryModel.fromJson(v));
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

class CountryModel {
  int _id;
  String _dateCreated;
  String _dateModified;
  dynamic _createdBy;
  dynamic _modifiedBy;
  bool _status;
  String _countryId;
  String _name;
  String _sortname;
  dynamic _organization;
  String _stateId;

  CountryModel(
      {int id,
        String dateCreated,
        String dateModified,
        dynamic createdBy,
        dynamic modifiedBy,
        bool status,
        String countryId,
        String name,
        String sortname,
        dynamic organization,
      String stateId}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._countryId = countryId;
    this._name = name;
    this._sortname = sortname;
    this._organization = organization;
    this._stateId=stateId;
  }

  String get stateId => _stateId;

  set stateId(String value) {
    _stateId = value;
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
  String get countryId => _countryId;
  set countryId(String countryId) => _countryId = countryId;
  String get name => _name;
  set name(String name) => _name = name;
  String get sortname => _sortname;
  set sortname(String sortname) => _sortname = sortname;
  dynamic get organization => _organization;
  set organization(dynamic organization) => _organization = organization;

  CountryModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _countryId = json['country_id'];
    _name = json['name'];
    _sortname = json['sortname'];
    _organization = json['organization'];
    _stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['country_id'] = this._countryId;
    data['name'] = this._name;
    data['sortname'] = this._sortname;
    data['organization'] = this._organization;
    data['state_id'] = this._stateId;
    return data;
  }
}