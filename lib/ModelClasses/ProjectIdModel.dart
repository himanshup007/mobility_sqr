class ProjectIdModel {
  dynamic _status;
  String _message;
  List<ProjectList> _data;

  ProjectIdModel({dynamic status, String message, List<ProjectList> data}) {
    this._status = status;
    this._message = message;
    this._data = data;
  }

  dynamic get status => _status;
  set status(dynamic status) => _status = status;
  String get message => _message;
  set message(String message) => _message = message;
  List<ProjectList> get data => _data;
  set data(List<ProjectList> data) => _data = data;

  ProjectIdModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = new List<ProjectList>();
      json['data'].forEach((v) {
        _data.add(new ProjectList.fromJson(v));
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

class ProjectList {
  int _id;
  String _dateCreated;
  String _dateModified;
  String _createdBy;
  String _modifiedBy;
  String _pid;
  String _projectName;
  String _startDate;
  String _endDate;
  String _expenseApprover;
  String _projectManager;
  String _businessLead;
  String _clientExecutiveLead;
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

  ProjectList(
      {int id,
        String dateCreated,
        String dateModified,
        String createdBy,
        String modifiedBy,
        String pid,
        String projectName,
        String startDate,
        String endDate,
        String expenseApprover,
        String projectManager,
        String businessLead,
        String clientExecutiveLead,
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
    this._pid = pid;
    this._projectName = projectName;
    this._startDate = startDate;
    this._endDate = endDate;
    this._expenseApprover = expenseApprover;
    this._projectManager = projectManager;
    this._businessLead = businessLead;
    this._clientExecutiveLead = clientExecutiveLead;
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
  String get pid => _pid;
  set pid(String pid) => _pid = pid;
  String get projectName => _projectName;
  set projectName(String projectName) => _projectName = projectName;
  String get startDate => _startDate;
  set startDate(String startDate) => _startDate = startDate;
  String get endDate => _endDate;
  set endDate(String endDate) => _endDate = endDate;
  String get expenseApprover => _expenseApprover;
  set expenseApprover(String expenseApprover) =>
      _expenseApprover = expenseApprover;
  String get projectManager => _projectManager;
  set projectManager(String projectManager) => _projectManager = projectManager;
  String get businessLead => _businessLead;
  set businessLead(String businessLead) => _businessLead = businessLead;
  String get clientExecutiveLead => _clientExecutiveLead;
  set clientExecutiveLead(String clientExecutiveLead) =>
      _clientExecutiveLead = clientExecutiveLead;
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

  ProjectList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _pid = json['pid'];
    _projectName = json['project_name'];
    _startDate = json['start_date'];
    _endDate = json['End_Date'];
    _expenseApprover = json['expense_approver'];
    _projectManager = json['project_manager'];
    _businessLead = json['business_lead'];
    _clientExecutiveLead = json['client_executive_lead'];
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
    data['pid'] = this._pid;
    data['project_name'] = this._projectName;
    data['start_date'] = this._startDate;
    data['End_Date'] = this._endDate;
    data['expense_approver'] = this._expenseApprover;
    data['project_manager'] = this._projectManager;
    data['business_lead'] = this._businessLead;
    data['client_executive_lead'] = this._clientExecutiveLead;
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