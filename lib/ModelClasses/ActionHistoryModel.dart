class ActionHistoryModel {
  String _massage;
  bool _status;
  List<HistoryData> _data;
  List<Tranfer> _tranfer;

  ActionHistoryModel(
      {String massage, bool status, List<HistoryData> data, List<Tranfer> tranfer}) {
    this._massage = massage;
    this._status = status;
    this._data = data;
    this._tranfer = tranfer;
  }

  String get massage => _massage;
  set massage(String massage) => _massage = massage;
  bool get status => _status;
  set status(bool status) => _status = status;
  List<HistoryData> get data => _data;
  set data(List<HistoryData> data) => _data = data;
  List<Tranfer> get tranfer => _tranfer;
  set tranfer(List<Tranfer> tranfer) => _tranfer = tranfer;

  ActionHistoryModel.fromJson(Map<String, dynamic> json) {
    _massage = json['massage'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = new List<HistoryData>();
      json['data'].forEach((v) {
        _data.add(new HistoryData.fromJson(v));
      });
    }
    if (json['tranfer'] != null) {
      _tranfer = new List<Tranfer>();
      json['tranfer'].forEach((v) {
        _tranfer.add(new Tranfer.fromJson(v));
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
    if (this._tranfer != null) {
      data['tranfer'] = this._tranfer.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HistoryData {
  String _supervisorStatus;
  String _approvalLevel;
  String _supervisor;
  String _currentTicketOwner;
  String _supervisorName;
  String _actionDate;
  String _expenseApproverStatus;
  String _expenseApprover;
  String _expenseApproverName;
  String _projectManagerStatus;
  String _projectManagerName;
  String _projectManager;
  String _businessLeadStatus;
  String _businessLeadName;
  String _businessLead;
  String _clientExecutiveLeadStatus;
  String _clientExecutiveLeadName;
  String _clientExecutiveLead;

  Data(
      {String supervisorStatus,
        String approvalLevel,
        String supervisor,
        String currentTicketOwner,
        String supervisorName,
        String actionDate,
        String expenseApproverStatus,
        String expenseApprover,
        String expenseApproverName,
        String projectManagerStatus,
        String projectManagerName,
        String projectManager,
        String businessLeadStatus,
        String businessLeadName,
        String businessLead,
        String clientExecutiveLeadStatus,
        String clientExecutiveLeadName,
        String clientExecutiveLead}) {
    this._supervisorStatus = supervisorStatus;
    this._approvalLevel = approvalLevel;
    this._supervisor = supervisor;
    this._currentTicketOwner = currentTicketOwner;
    this._supervisorName = supervisorName;
    this._actionDate = actionDate;
    this._expenseApproverStatus = expenseApproverStatus;
    this._expenseApprover = expenseApprover;
    this._expenseApproverName = expenseApproverName;
    this._projectManagerStatus = projectManagerStatus;
    this._projectManagerName = projectManagerName;
    this._projectManager = projectManager;
    this._businessLeadStatus = businessLeadStatus;
    this._businessLeadName = businessLeadName;
    this._businessLead = businessLead;
    this._clientExecutiveLeadStatus = clientExecutiveLeadStatus;
    this._clientExecutiveLeadName = clientExecutiveLeadName;
    this._clientExecutiveLead = clientExecutiveLead;
  }

  String get supervisorStatus => _supervisorStatus;
  set supervisorStatus(String supervisorStatus) =>
      _supervisorStatus = supervisorStatus;
  String get approvalLevel => _approvalLevel;
  set approvalLevel(String approvalLevel) => _approvalLevel = approvalLevel;
  String get supervisor => _supervisor;
  set supervisor(String supervisor) => _supervisor = supervisor;
  String get currentTicketOwner => _currentTicketOwner;
  set currentTicketOwner(String currentTicketOwner) =>
      _currentTicketOwner = currentTicketOwner;
  String get supervisorName => _supervisorName;
  set supervisorName(String supervisorName) => _supervisorName = supervisorName;
  String get actionDate => _actionDate;
  set actionDate(String actionDate) => _actionDate = actionDate;
  String get expenseApproverStatus => _expenseApproverStatus;
  set expenseApproverStatus(String expenseApproverStatus) =>
      _expenseApproverStatus = expenseApproverStatus;
  String get expenseApprover => _expenseApprover;
  set expenseApprover(String expenseApprover) =>
      _expenseApprover = expenseApprover;
  String get expenseApproverName => _expenseApproverName;
  set expenseApproverName(String expenseApproverName) =>
      _expenseApproverName = expenseApproverName;
  String get projectManagerStatus => _projectManagerStatus;
  set projectManagerStatus(String projectManagerStatus) =>
      _projectManagerStatus = projectManagerStatus;
  String get projectManagerName => _projectManagerName;
  set projectManagerName(String projectManagerName) =>
      _projectManagerName = projectManagerName;
  String get projectManager => _projectManager;
  set projectManager(String projectManager) => _projectManager = projectManager;
  String get businessLeadStatus => _businessLeadStatus;
  set businessLeadStatus(String businessLeadStatus) =>
      _businessLeadStatus = businessLeadStatus;
  String get businessLeadName => _businessLeadName;
  set businessLeadName(String businessLeadName) =>
      _businessLeadName = businessLeadName;
  String get businessLead => _businessLead;
  set businessLead(String businessLead) => _businessLead = businessLead;
  String get clientExecutiveLeadStatus => _clientExecutiveLeadStatus;
  set clientExecutiveLeadStatus(String clientExecutiveLeadStatus) =>
      _clientExecutiveLeadStatus = clientExecutiveLeadStatus;
  String get clientExecutiveLeadName => _clientExecutiveLeadName;
  set clientExecutiveLeadName(String clientExecutiveLeadName) =>
      _clientExecutiveLeadName = clientExecutiveLeadName;
  String get clientExecutiveLead => _clientExecutiveLead;
  set clientExecutiveLead(String clientExecutiveLead) =>
      _clientExecutiveLead = clientExecutiveLead;

  HistoryData.fromJson(Map<String, dynamic> json) {
    _supervisorStatus = json['supervisor_status'];
    _approvalLevel = json['approval_level'];
    _supervisor = json['supervisor'];
    _currentTicketOwner = json['current_ticket_owner'];
    _supervisorName = json['supervisor_name'];
    _actionDate = json['action_date'];
    _expenseApproverStatus = json['expense_approver_status'];
    _expenseApprover = json['expense_approver'];
    _expenseApproverName = json['expense_approver_name'];
    _projectManagerStatus = json['project_manager_status'];
    _projectManagerName = json['project_manager_name'];
    _projectManager = json['project_manager'];
    _businessLeadStatus = json['business_lead_status'];
    _businessLeadName = json['business_lead_name'];
    _businessLead = json['business_lead'];
    _clientExecutiveLeadStatus = json['client_executive_lead_status'];
    _clientExecutiveLeadName = json['client_executive_lead_name'];
    _clientExecutiveLead = json['client_executive_lead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supervisor_status'] = this._supervisorStatus;
    data['approval_level'] = this._approvalLevel;
    data['supervisor'] = this._supervisor;
    data['current_ticket_owner'] = this._currentTicketOwner;
    data['supervisor_name'] = this._supervisorName;
    data['action_date'] = this._actionDate;
    data['expense_approver_status'] = this._expenseApproverStatus;
    data['expense_approver'] = this._expenseApprover;
    data['expense_approver_name'] = this._expenseApproverName;
    data['project_manager_status'] = this._projectManagerStatus;
    data['project_manager_name'] = this._projectManagerName;
    data['project_manager'] = this._projectManager;
    data['business_lead_status'] = this._businessLeadStatus;
    data['business_lead_name'] = this._businessLeadName;
    data['business_lead'] = this._businessLead;
    data['client_executive_lead_status'] = this._clientExecutiveLeadStatus;
    data['client_executive_lead_name'] = this._clientExecutiveLeadName;
    data['client_executive_lead'] = this._clientExecutiveLead;
    return data;
  }
}

class Tranfer {
  String _transfer;

  Tranfer({String transfer}) {
    this._transfer = transfer;
  }

  String get transfer => _transfer;
  set transfer(String transfer) => _transfer = transfer;

  Tranfer.fromJson(Map<String, dynamic> json) {
    _transfer = json['transfer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transfer'] = this._transfer;
    return data;
  }
}