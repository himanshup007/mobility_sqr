class GetTravelRequest {
  String _massage;
  bool _status;
  List<Data> _data;

  GetTravelRequest({String massage, bool status, List<Data> data}) {
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

  GetTravelRequest.fromJson(Map<String, dynamic> json) {
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
  String _travelReqId;
  String _projectName;
  bool _isBillable;
  bool _isTravelMultiCountry;
  bool _isTravelMultiCity;
  String _requestNotes;
  String _remark;
  String _homeContactName;
  String _homePhoneExt;
  String _homePhoneNumber;
  bool _isLaptopRequired;
  String _travelReqStatus;
  dynamic _travelReqStatusNotes;
  String _currentTicketOwner;
  String _supervisor;
  String _expenseApprover;
  String _projectManager;
  String _businessLead;
  String _clientExecutiveLead;
  bool _haveLaptop;
  String _approvalLevel;
  String _expenceCureency;
  String _expenceDepartureDate;
  String _expenceEstimatedCost;
  String _expenceFromCountry;
  String _expenceReturnDate;
  String _expenceToCountry;
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
  String _empEmail;
  String _project;
  String _organization;
  String _empCode;
  String _firstName;
  String _lastName;
  List<VisaRequests> _visaRequests;
  List<Details> _details;
  List<Dependent> _dependent;

  Data(
      {int id,
        String dateCreated,
        String dateModified,
        String createdBy,
        String modifiedBy,
        bool status,
        String travelReqId,
        String projectName,
        bool isBillable,
        bool isTravelMultiCountry,
        bool isTravelMultiCity,
        String requestNotes,
        String remark,
        String homeContactName,
        String homePhoneExt,
        String homePhoneNumber,
        bool isLaptopRequired,
        String travelReqStatus,
        dynamic travelReqStatusNotes,
        String currentTicketOwner,
        String supervisor,
        String expenseApprover,
        String projectManager,
        String businessLead,
        String clientExecutiveLead,
        bool haveLaptop,
        String approvalLevel,
        String expenceCureency,
        String expenceDepartureDate,
        String expenceEstimatedCost,
        String expenceFromCountry,
        String expenceReturnDate,
        String expenceToCountry,
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
        String empEmail,
        String project,
        String organization,
        String empCode,
        String firstName,
        String lastName,
        List<VisaRequests> visaRequests,
        List<Details> details,
        List<Dependent> dependent}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._travelReqId = travelReqId;
    this._projectName = projectName;
    this._isBillable = isBillable;
    this._isTravelMultiCountry = isTravelMultiCountry;
    this._isTravelMultiCity = isTravelMultiCity;
    this._requestNotes = requestNotes;
    this._remark = remark;
    this._homeContactName = homeContactName;
    this._homePhoneExt = homePhoneExt;
    this._homePhoneNumber = homePhoneNumber;
    this._isLaptopRequired = isLaptopRequired;
    this._travelReqStatus = travelReqStatus;
    this._travelReqStatusNotes = travelReqStatusNotes;
    this._currentTicketOwner = currentTicketOwner;
    this._supervisor = supervisor;
    this._expenseApprover = expenseApprover;
    this._projectManager = projectManager;
    this._businessLead = businessLead;
    this._clientExecutiveLead = clientExecutiveLead;
    this._haveLaptop = haveLaptop;
    this._approvalLevel = approvalLevel;
    this._expenceCureency = expenceCureency;
    this._expenceDepartureDate = expenceDepartureDate;
    this._expenceEstimatedCost = expenceEstimatedCost;
    this._expenceFromCountry = expenceFromCountry;
    this._expenceReturnDate = expenceReturnDate;
    this._expenceToCountry = expenceToCountry;
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
    this._empEmail = empEmail;
    this._project = project;
    this._organization = organization;
    this._empCode = empCode;
    this._firstName = firstName;
    this._lastName = lastName;
    this._visaRequests = visaRequests;
    this._details = details;
    this._dependent = dependent;
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
  String get travelReqId => _travelReqId;
  set travelReqId(String travelReqId) => _travelReqId = travelReqId;
  String get projectName => _projectName;
  set projectName(String projectName) => _projectName = projectName;
  bool get isBillable => _isBillable;
  set isBillable(bool isBillable) => _isBillable = isBillable;
  bool get isTravelMultiCountry => _isTravelMultiCountry;
  set isTravelMultiCountry(bool isTravelMultiCountry) =>
      _isTravelMultiCountry = isTravelMultiCountry;
  bool get isTravelMultiCity => _isTravelMultiCity;
  set isTravelMultiCity(bool isTravelMultiCity) =>
      _isTravelMultiCity = isTravelMultiCity;
  String get requestNotes => _requestNotes;
  set requestNotes(String requestNotes) => _requestNotes = requestNotes;
  String get remark => _remark;
  set remark(String remark) => _remark = remark;
  String get homeContactName => _homeContactName;
  set homeContactName(String homeContactName) =>
      _homeContactName = homeContactName;
  String get homePhoneExt => _homePhoneExt;
  set homePhoneExt(String homePhoneExt) => _homePhoneExt = homePhoneExt;
  String get homePhoneNumber => _homePhoneNumber;
  set homePhoneNumber(String homePhoneNumber) =>
      _homePhoneNumber = homePhoneNumber;
  bool get isLaptopRequired => _isLaptopRequired;
  set isLaptopRequired(bool isLaptopRequired) =>
      _isLaptopRequired = isLaptopRequired;
  String get travelReqStatus => _travelReqStatus;
  set travelReqStatus(String travelReqStatus) =>
      _travelReqStatus = travelReqStatus;
  dynamic get travelReqStatusNotes => _travelReqStatusNotes;
  set travelReqStatusNotes(dynamic travelReqStatusNotes) =>
      _travelReqStatusNotes = travelReqStatusNotes;
  String get currentTicketOwner => _currentTicketOwner;
  set currentTicketOwner(String currentTicketOwner) =>
      _currentTicketOwner = currentTicketOwner;
  String get supervisor => _supervisor;
  set supervisor(String supervisor) => _supervisor = supervisor;
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
  bool get haveLaptop => _haveLaptop;
  set haveLaptop(bool haveLaptop) => _haveLaptop = haveLaptop;
  String get approvalLevel => _approvalLevel;
  set approvalLevel(String approvalLevel) => _approvalLevel = approvalLevel;
  String get expenceCureency => _expenceCureency;
  set expenceCureency(String expenceCureency) =>
      _expenceCureency = expenceCureency;
  String get expenceDepartureDate => _expenceDepartureDate;
  set expenceDepartureDate(String expenceDepartureDate) =>
      _expenceDepartureDate = expenceDepartureDate;
  String get expenceEstimatedCost => _expenceEstimatedCost;
  set expenceEstimatedCost(String expenceEstimatedCost) =>
      _expenceEstimatedCost = expenceEstimatedCost;
  String get expenceFromCountry => _expenceFromCountry;
  set expenceFromCountry(String expenceFromCountry) =>
      _expenceFromCountry = expenceFromCountry;
  String get expenceReturnDate => _expenceReturnDate;
  set expenceReturnDate(String expenceReturnDate) =>
      _expenceReturnDate = expenceReturnDate;
  String get expenceToCountry => _expenceToCountry;
  set expenceToCountry(String expenceToCountry) =>
      _expenceToCountry = expenceToCountry;
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
  String get empEmail => _empEmail;
  set empEmail(String empEmail) => _empEmail = empEmail;
  String get project => _project;
  set project(String project) => _project = project;
  String get organization => _organization;
  set organization(String organization) => _organization = organization;
  String get empCode => _empCode;
  set empCode(String empCode) => _empCode = empCode;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  List<VisaRequests> get visaRequests => _visaRequests;
  set visaRequests(List<VisaRequests> visaRequests) =>
      _visaRequests = visaRequests;
  List<Details> get details => _details;
  set details(List<Details> details) => _details = details;
  List<Dependent> get dependent => _dependent;
  set dependent(List<Dependent> dependent) => _dependent = dependent;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _travelReqId = json['travel_req_id'];
    _projectName = json['project_name'];
    _isBillable = json['is_billable'];
    _isTravelMultiCountry = json['is_travel_multi_country'];
    _isTravelMultiCity = json['is_travel_multi_city'];
    _requestNotes = json['request_notes'];
    _remark = json['remark'];
    _homeContactName = json['home_contact_name'];
    _homePhoneExt = json['home_phone_ext'];
    _homePhoneNumber = json['home_phone_number'];
    _isLaptopRequired = json['is_laptop_required'];
    _travelReqStatus = json['travel_req_status'];
    _travelReqStatusNotes = json['travel_req_status_notes'];
    _currentTicketOwner = json['current_ticket_owner'];
    _supervisor = json['supervisor'];
    _expenseApprover = json['expense_approver'];
    _projectManager = json['project_manager'];
    _businessLead = json['business_lead'];
    _clientExecutiveLead = json['client_executive_lead'];
    _haveLaptop = json['have_laptop'];
    _approvalLevel = json['approval_level'];
    _expenceCureency = json['expence_cureency'];
    _expenceDepartureDate = json['expence_departureDate'];
    _expenceEstimatedCost = json['expence_estimatedCost'];
    _expenceFromCountry = json['expence_fromCountry'];
    _expenceReturnDate = json['expence_returnDate'];
    _expenceToCountry = json['expence_toCountry'];
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
    _empEmail = json['emp_email'];
    _project = json['project'];
    _organization = json['organization'];
    _empCode = json['emp_code'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    if (json['visa_requests'] != null) {
      _visaRequests = new List<VisaRequests>();
      json['visa_requests'].forEach((v) {
        _visaRequests.add(new VisaRequests.fromJson(v));
      });
    }
    if (json['details'] != null) {
      _details = new List<Details>();
      json['details'].forEach((v) {
        _details.add(new Details.fromJson(v));
      });
    }
    if (json['dependent'] != null) {
      _dependent = new List<Dependent>();
      json['dependent'].forEach((v) {
        _dependent.add(new Dependent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['travel_req_id'] = this._travelReqId;
    data['project_name'] = this._projectName;
    data['is_billable'] = this._isBillable;
    data['is_travel_multi_country'] = this._isTravelMultiCountry;
    data['is_travel_multi_city'] = this._isTravelMultiCity;
    data['request_notes'] = this._requestNotes;
    data['remark'] = this._remark;
    data['home_contact_name'] = this._homeContactName;
    data['home_phone_ext'] = this._homePhoneExt;
    data['home_phone_number'] = this._homePhoneNumber;
    data['is_laptop_required'] = this._isLaptopRequired;
    data['travel_req_status'] = this._travelReqStatus;
    data['travel_req_status_notes'] = this._travelReqStatusNotes;
    data['current_ticket_owner'] = this._currentTicketOwner;
    data['supervisor'] = this._supervisor;
    data['expense_approver'] = this._expenseApprover;
    data['project_manager'] = this._projectManager;
    data['business_lead'] = this._businessLead;
    data['client_executive_lead'] = this._clientExecutiveLead;
    data['have_laptop'] = this._haveLaptop;
    data['approval_level'] = this._approvalLevel;
    data['expence_cureency'] = this._expenceCureency;
    data['expence_departureDate'] = this._expenceDepartureDate;
    data['expence_estimatedCost'] = this._expenceEstimatedCost;
    data['expence_fromCountry'] = this._expenceFromCountry;
    data['expence_returnDate'] = this._expenceReturnDate;
    data['expence_toCountry'] = this._expenceToCountry;
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
    data['emp_email'] = this._empEmail;
    data['project'] = this._project;
    data['organization'] = this._organization;
    data['emp_code'] = this._empCode;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    if (this._visaRequests != null) {
      data['visa_requests'] =
          this._visaRequests.map((v) => v.toJson()).toList();
    }
    if (this._details != null) {
      data['details'] = this._details.map((v) => v.toJson()).toList();
    }
    if (this._dependent != null) {
      data['dependent'] = this._dependent.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VisaRequests {
  String _visaReqId;

  VisaRequests({String visaReqId}) {
    this._visaReqId = visaReqId;
  }

  String get visaReqId => _visaReqId;
  set visaReqId(String visaReqId) => _visaReqId = visaReqId;

  VisaRequests.fromJson(Map<String, dynamic> json) {
    _visaReqId = json['visa_req_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visa_req_id'] = this._visaReqId;
    return data;
  }
}

class Details {
  int _id;
  String _travelReqIdId;
  String _travellingCountry;
  String _travellingCountryTo;
  String _officeLocation;
  String _clientNumber;
  dynamic _organization;
  String _sourceCity;
  String _destinationCity;
  String _departureDate;
  String _returnDate;
  bool _isAccmodationRequired;
  String _accmodationStartDate;
  String _accmodationEndDate;
  String _travelPurpose;
  dynamic _assignmentType;
  String _applicableVisa;
  String _visaNumber;
  String _visaExpiryDate;
  String _hostHrName;
  dynamic _hostCountryHead;
  dynamic _hostAttorney;
  String _hostPhoneNo;
  bool _isClientLocation;
  String _clientName;
  String _clientAddress;
  dynamic _hotelCost;
  dynamic _perDiemCost;
  dynamic _airfareCost;
  dynamic _transportationCost;
  dynamic _totalCost;
  dynamic _travelRequestStatus;
  dynamic _travelRequestStatusNotes;
  bool _isDependent;

  Details(
      {dynamic id,
        String travelReqIdId,
        String travellingCountry,
        String travellingCountryTo,
        String officeLocation,
        String clientNumber,
        dynamic organization,
        String sourceCity,
        String destinationCity,
        String departureDate,
        String returnDate,
        bool isAccmodationRequired,
        String accmodationStartDate,
        String accmodationEndDate,
        String travelPurpose,
        dynamic assignmentType,
        String applicableVisa,
        String visaNumber,
        String visaExpiryDate,
        String hostHrName,
        dynamic hostCountryHead,
        dynamic hostAttorney,
        String hostPhoneNo,
        bool isClientLocation,
        String clientName,
        String clientAddress,
        dynamic hotelCost,
        dynamic perDiemCost,
        dynamic airfareCost,
        dynamic transportationCost,
        dynamic totalCost,
        dynamic travelRequestStatus,
        dynamic travelRequestStatusNotes,
        bool isDependent}) {
    this._id = id;
    this._travelReqIdId = travelReqIdId;
    this._travellingCountry = travellingCountry;
    this._travellingCountryTo = travellingCountryTo;
    this._officeLocation = officeLocation;
    this._clientNumber = clientNumber;
    this._organization = organization;
    this._sourceCity = sourceCity;
    this._destinationCity = destinationCity;
    this._departureDate = departureDate;
    this._returnDate = returnDate;
    this._isAccmodationRequired = isAccmodationRequired;
    this._accmodationStartDate = accmodationStartDate;
    this._accmodationEndDate = accmodationEndDate;
    this._travelPurpose = travelPurpose;
    this._assignmentType = assignmentType;
    this._applicableVisa = applicableVisa;
    this._visaNumber = visaNumber;
    this._visaExpiryDate = visaExpiryDate;
    this._hostHrName = hostHrName;
    this._hostCountryHead = hostCountryHead;
    this._hostAttorney = hostAttorney;
    this._hostPhoneNo = hostPhoneNo;
    this._isClientLocation = isClientLocation;
    this._clientName = clientName;
    this._clientAddress = clientAddress;
    this._hotelCost = hotelCost;
    this._perDiemCost = perDiemCost;
    this._airfareCost = airfareCost;
    this._transportationCost = transportationCost;
    this._totalCost = totalCost;
    this._travelRequestStatus = travelRequestStatus;
    this._travelRequestStatusNotes = travelRequestStatusNotes;
    this._isDependent = isDependent;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  String get travelReqIdId => _travelReqIdId;
  set travelReqIdId(String travelReqIdId) => _travelReqIdId = travelReqIdId;
  String get travellingCountry => _travellingCountry;
  set travellingCountry(String travellingCountry) =>
      _travellingCountry = travellingCountry;
  String get travellingCountryTo => _travellingCountryTo;
  set travellingCountryTo(String travellingCountryTo) =>
      _travellingCountryTo = travellingCountryTo;
  String get officeLocation => _officeLocation;
  set officeLocation(String officeLocation) => _officeLocation = officeLocation;
  String get clientNumber => _clientNumber;
  set clientNumber(String clientNumber) => _clientNumber = clientNumber;
  dynamic get organization => _organization;
  set organization(dynamic organization) => _organization = organization;
  String get sourceCity => _sourceCity;
  set sourceCity(String sourceCity) => _sourceCity = sourceCity;
  String get destinationCity => _destinationCity;
  set destinationCity(String destinationCity) =>
      _destinationCity = destinationCity;
  String get departureDate => _departureDate;
  set departureDate(String departureDate) => _departureDate = departureDate;
  String get returnDate => _returnDate;
  set returnDate(String returnDate) => _returnDate = returnDate;
  bool get isAccmodationRequired => _isAccmodationRequired;
  set isAccmodationRequired(bool isAccmodationRequired) =>
      _isAccmodationRequired = isAccmodationRequired;
  String get accmodationStartDate => _accmodationStartDate;
  set accmodationStartDate(String accmodationStartDate) =>
      _accmodationStartDate = accmodationStartDate;
  String get accmodationEndDate => _accmodationEndDate;
  set accmodationEndDate(String accmodationEndDate) =>
      _accmodationEndDate = accmodationEndDate;
  String get travelPurpose => _travelPurpose;
  set travelPurpose(String travelPurpose) => _travelPurpose = travelPurpose;
  dynamic get assignmentType => _assignmentType;
  set assignmentType(dynamic assignmentType) => _assignmentType = assignmentType;
  String get applicableVisa => _applicableVisa;
  set applicableVisa(String applicableVisa) => _applicableVisa = applicableVisa;
  String get visaNumber => _visaNumber;
  set visaNumber(String visaNumber) => _visaNumber = visaNumber;
  String get visaExpiryDate => _visaExpiryDate;
  set visaExpiryDate(String visaExpiryDate) => _visaExpiryDate = visaExpiryDate;
  String get hostHrName => _hostHrName;
  set hostHrName(String hostHrName) => _hostHrName = hostHrName;
  dynamic get hostCountryHead => _hostCountryHead;
  set hostCountryHead(dynamic hostCountryHead) =>
      _hostCountryHead = hostCountryHead;
  dynamic get hostAttorney => _hostAttorney;
  set hostAttorney(dynamic hostAttorney) => _hostAttorney = hostAttorney;
  String get hostPhoneNo => _hostPhoneNo;
  set hostPhoneNo(String hostPhoneNo) => _hostPhoneNo = hostPhoneNo;
  bool get isClientLocation => _isClientLocation;
  set isClientLocation(bool isClientLocation) =>
      _isClientLocation = isClientLocation;
  String get clientName => _clientName;
  set clientName(String clientName) => _clientName = clientName;
  String get clientAddress => _clientAddress;
  set clientAddress(String clientAddress) => _clientAddress = clientAddress;
  dynamic get hotelCost => _hotelCost;
  set hotelCost(dynamic hotelCost) => _hotelCost = hotelCost;
  dynamic get perDiemCost => _perDiemCost;
  set perDiemCost(dynamic perDiemCost) => _perDiemCost = perDiemCost;
  dynamic get airfareCost => _airfareCost;
  set airfareCost(dynamic airfareCost) => _airfareCost = airfareCost;
  dynamic get transportationCost => _transportationCost;
  set transportationCost(dynamic transportationCost) =>
      _transportationCost = transportationCost;
  dynamic get totalCost => _totalCost;
  set totalCost(dynamic totalCost) => _totalCost = totalCost;
  dynamic get travelRequestStatus => _travelRequestStatus;
  set travelRequestStatus(dynamic travelRequestStatus) =>
      _travelRequestStatus = travelRequestStatus;
  dynamic get travelRequestStatusNotes => _travelRequestStatusNotes;
  set travelRequestStatusNotes(dynamic travelRequestStatusNotes) =>
      _travelRequestStatusNotes = travelRequestStatusNotes;
  bool get isDependent => _isDependent;
  set isDependent(bool isDependent) => _isDependent = isDependent;

  Details.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _travelReqIdId = json['travel_req_id_id'];
    _travellingCountry = json['travelling_country'];
    _travellingCountryTo = json['travelling_country_to'];
    _officeLocation = json['office_location'];
    _clientNumber = json['client_number'];
    _organization = json['organization'];
    _sourceCity = json['source_city'];
    _destinationCity = json['destination_city'];
    _departureDate = json['departure_date'];
    _returnDate = json['return_date'];
    _isAccmodationRequired = json['is_accmodation_required'];
    _accmodationStartDate = json['accmodation_start_date'];
    _accmodationEndDate = json['accmodation_end_date'];
    _travelPurpose = json['travel_purpose'];
    _assignmentType = json['assignment_type'];
    _applicableVisa = json['applicable_visa'];
    _visaNumber = json['visa_number'];
    _visaExpiryDate = json['visa_expiry_date'];
    _hostHrName = json['host_hr_name'];
    _hostCountryHead = json['host_country_head'];
    _hostAttorney = json['host_attorney'];
    _hostPhoneNo = json['host_phone_no'];
    _isClientLocation = json['is_client_location'];
    _clientName = json['client_name'];
    _clientAddress = json['client_address'];
    _hotelCost = json['hotel_cost'];
    _perDiemCost = json['per_diem_cost'];
    _airfareCost = json['airfare_cost'];
    _transportationCost = json['transportation_cost'];
    _totalCost = json['total_cost'];
    _travelRequestStatus = json['travel_request_status'];
    _travelRequestStatusNotes = json['travel_request_status_notes'];
    _isDependent = json['is_dependent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['travel_req_id_id'] = this._travelReqIdId;
    data['travelling_country'] = this._travellingCountry;
    data['travelling_country_to'] = this._travellingCountryTo;
    data['office_location'] = this._officeLocation;
    data['client_number'] = this._clientNumber;
    data['organization'] = this._organization;
    data['source_city'] = this._sourceCity;
    data['destination_city'] = this._destinationCity;
    data['departure_date'] = this._departureDate;
    data['return_date'] = this._returnDate;
    data['is_accmodation_required'] = this._isAccmodationRequired;
    data['accmodation_start_date'] = this._accmodationStartDate;
    data['accmodation_end_date'] = this._accmodationEndDate;
    data['travel_purpose'] = this._travelPurpose;
    data['assignment_type'] = this._assignmentType;
    data['applicable_visa'] = this._applicableVisa;
    data['visa_number'] = this._visaNumber;
    data['visa_expiry_date'] = this._visaExpiryDate;
    data['host_hr_name'] = this._hostHrName;
    data['host_country_head'] = this._hostCountryHead;
    data['host_attorney'] = this._hostAttorney;
    data['host_phone_no'] = this._hostPhoneNo;
    data['is_client_location'] = this._isClientLocation;
    data['client_name'] = this._clientName;
    data['client_address'] = this._clientAddress;
    data['hotel_cost'] = this._hotelCost;
    data['per_diem_cost'] = this._perDiemCost;
    data['airfare_cost'] = this._airfareCost;
    data['transportation_cost'] = this._transportationCost;
    data['total_cost'] = this._totalCost;
    data['travel_request_status'] = this._travelRequestStatus;
    data['travel_request_status_notes'] = this._travelRequestStatusNotes;
    data['is_dependent'] = this._isDependent;
    return data;
  }
}

class Dependent {
  dynamic _id;
  String _dateCreated;
  String _dateModified;
  String _createdBy;
  String _modifiedBy;
  bool _status;
  String _reqId;
  String _dependentRelation;
  String _dependentName;
  dynamic _dependentPassport;
  dynamic _dependentVisa;
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
  String _travelReqId;
  dynamic _organization;

  Dependent(
      {dynamic id,
        String dateCreated,
        String dateModified,
        String createdBy,
        String modifiedBy,
        bool status,
        String reqId,
        String dependentRelation,
        String dependentName,
        dynamic dependentPassport,
        dynamic dependentVisa,
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
        String travelReqId,
        dynamic organization}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._reqId = reqId;
    this._dependentRelation = dependentRelation;
    this._dependentName = dependentName;
    this._dependentPassport = dependentPassport;
    this._dependentVisa = dependentVisa;
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
    this._travelReqId = travelReqId;
    this._organization = organization;
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
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
  String get reqId => _reqId;
  set reqId(String reqId) => _reqId = reqId;
  String get dependentRelation => _dependentRelation;
  set dependentRelation(String dependentRelation) =>
      _dependentRelation = dependentRelation;
  String get dependentName => _dependentName;
  set dependentName(String dependentName) => _dependentName = dependentName;
  dynamic get dependentPassport => _dependentPassport;
  set dependentPassport(dynamic dependentPassport) =>
      _dependentPassport = dependentPassport;
  dynamic get dependentVisa => _dependentVisa;
  set dependentVisa(dynamic dependentVisa) => _dependentVisa = dependentVisa;
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
  String get travelReqId => _travelReqId;
  set travelReqId(String travelReqId) => _travelReqId = travelReqId;
  dynamic get organization => _organization;
  set organization(dynamic organization) => _organization = organization;

  Dependent.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _reqId = json['req_id'];
    _dependentRelation = json['dependent_relation'];
    _dependentName = json['dependent_name'];
    _dependentPassport = json['dependent_passport'];
    _dependentVisa = json['dependent_visa'];
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
    _travelReqId = json['travel_req_id'];
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
    data['req_id'] = this._reqId;
    data['dependent_relation'] = this._dependentRelation;
    data['dependent_name'] = this._dependentName;
    data['dependent_passport'] = this._dependentPassport;
    data['dependent_visa'] = this._dependentVisa;
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
    data['travel_req_id'] = this._travelReqId;
    data['organization'] = this._organization;
    return data;
  }
}