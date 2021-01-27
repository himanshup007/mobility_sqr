class SubmitRequestForApprovalModel {
  String _travelReqId;
  String _requestNotes;
  String _approveAction;
  String _approvalLevel;
  String _currentTicketOwner;
  String _takeOwnership;
  String _transferTo;
  String _module;
  String _orgId;
  String _modifiedBy;

  SubmitRequestForApprovalModel(
      {String travelReqId,
        String requestNotes,
        String approveAction,
        String approvalLevel,
        String currentTicketOwner,
        String takeOwnership,
        String transferTo,
        String module,
        String orgId,
        String modifiedBy}) {
    this._travelReqId = travelReqId;
    this._requestNotes = requestNotes;
    this._approveAction = approveAction;
    this._approvalLevel = approvalLevel;
    this._currentTicketOwner = currentTicketOwner;
    this._takeOwnership = takeOwnership;
    this._transferTo = transferTo;
    this._module = module;
    this._orgId = orgId;
    this._modifiedBy = modifiedBy;
  }

  String get travelReqId => _travelReqId;
  set travelReqId(String travelReqId) => _travelReqId = travelReqId;
  String get requestNotes => _requestNotes;
  set requestNotes(String requestNotes) => _requestNotes = requestNotes;
  String get approveAction => _approveAction;
  set approveAction(String approveAction) => _approveAction = approveAction;
  String get approvalLevel => _approvalLevel;
  set approvalLevel(String approvalLevel) => _approvalLevel = approvalLevel;
  String get currentTicketOwner => _currentTicketOwner;
  set currentTicketOwner(String currentTicketOwner) =>
      _currentTicketOwner = currentTicketOwner;
  String get takeOwnership => _takeOwnership;
  set takeOwnership(String takeOwnership) => _takeOwnership = takeOwnership;
  String get transferTo => _transferTo;
  set transferTo(String transferTo) => _transferTo = transferTo;
  String get module => _module;
  set module(String module) => _module = module;
  String get orgId => _orgId;
  set orgId(String orgId) => _orgId = orgId;
  String get modifiedBy => _modifiedBy;
  set modifiedBy(String modifiedBy) => _modifiedBy = modifiedBy;

  SubmitRequestForApprovalModel.fromJson(Map<String, dynamic> json) {
    _travelReqId = json['travel_req_id'];
    _requestNotes = json['request_notes'];
    _approveAction = json['approve_action'];
    _approvalLevel = json['approval_level'];
    _currentTicketOwner = json['current_ticket_owner'];
    _takeOwnership = json['take_ownership'];
    _transferTo = json['transfer_to'];
    _module = json['module'];
    _orgId = json['org_id'];
    _modifiedBy = json['modified_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['travel_req_id'] = this._travelReqId;
    data['request_notes'] = this._requestNotes;
    data['approve_action'] = this._approveAction;
    data['approval_level'] = this._approvalLevel;
    data['current_ticket_owner'] = this._currentTicketOwner;
    data['take_ownership'] = this._takeOwnership;
    data['transfer_to'] = this._transferTo;
    data['module'] = this._module;
    data['org_id'] = this._orgId;
    data['modified_by'] = this._modifiedBy;
    return data;
  }
}