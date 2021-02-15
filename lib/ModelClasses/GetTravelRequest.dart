import 'CurrencyConversionModel.dart';

class GetTravelRequest {
  String massage;
  bool status;
  MyModelData data;

  GetTravelRequest({this.massage, this.status, this.data});

  GetTravelRequest.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    status = json['status'];
    data = json['data'] != null ? new MyModelData.fromJson(json['data']) : null;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this.massage;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}


class MyModelData {
  dynamic id;
  bool isSelected = false;
  String dateCreated;
  String dateModified;
  String createdBy;
  String modifiedBy;
  bool status;
  String travelReqId;
  String projectName;
  dynamic policyViolations;
  bool isBillable;
  bool isTravelMultiCountry;
  bool isTravelMultiCity;
  dynamic requestNotes;
  String remark;
  String homeContactName;
  String homePhoneExt;
  String homePhoneNumber;
  bool isLaptopRequired;
  String travelReqStatus;
  dynamic travelReqStatusNotes;
  String currentTicketOwner;
  String supervisor;
  String expenseApprover;
  String projectManager;
  String businessLead;
  String clientExecutiveLead;
  bool haveLaptop;
  String approvalLevel;
  String expenceCureency;
  String expenceDepartureDate;
  String expenceEstimatedCost;
  String expenceFromCountry;
  String expenceReturnDate;
  String expenceToCountry;
  dynamic column1;
  dynamic column2;
  dynamic column3;
  dynamic column4;
  dynamic column5;
  dynamic column6;
  dynamic column7;
  dynamic column8;
  dynamic column9;
  dynamic column10;
  dynamic column11;
  dynamic column12;
  String empEmail;
  String project;
  String organization;
  String empCode;
  String firstName;
  String lastName;
  List<Details> details;
  List<Dependent> dependent;
  List<VisaRequests> visaRequests;

  MyModelData(
      {this.id,
        this.isSelected,
        this.dateCreated,
        this.dateModified,
        this.createdBy,
        this.modifiedBy,
        this.status,
        this.travelReqId,
        this.projectName,
        this.policyViolations,
        this.isBillable,
        this.isTravelMultiCountry,
        this.isTravelMultiCity,
        this.requestNotes,
        this.remark,
        this.homeContactName,
        this.homePhoneExt,
        this.homePhoneNumber,
        this.isLaptopRequired,
        this.travelReqStatus,
        this.travelReqStatusNotes,
        this.currentTicketOwner,
        this.supervisor,
        this.expenseApprover,
        this.projectManager,
        this.businessLead,
        this.clientExecutiveLead,
        this.haveLaptop,
        this.approvalLevel,
        this.expenceCureency,
        this.expenceDepartureDate,
        this.expenceEstimatedCost,
        this.expenceFromCountry,
        this.expenceReturnDate,
        this.expenceToCountry,
        this.column1,
        this.column2,
        this.column3,
        this.column4,
        this.column5,
        this.column6,
        this.column7,
        this.column8,
        this.column9,
        this.column10,
        this.column11,
        this.column12,
        this.empEmail,
        this.project,
        this.organization,
        this.empCode,
        this.firstName,
        this.lastName,
        this.details,
        this.visaRequests,
        this.dependent});

  MyModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    travelReqId = json['travel_req_id'];
    projectName = json['project_name'];
    policyViolations = json['policy_violations'];
    isBillable = json['is_billable'];
    isTravelMultiCountry = json['is_travel_multi_country'];
    isTravelMultiCity = json['is_travel_multi_city'];
    requestNotes = json['request_notes'];
    remark = json['remark'];
    homeContactName = json['home_contact_name'];
    homePhoneExt = json['home_phone_ext'];
    homePhoneNumber = json['home_phone_number']??"";
    isLaptopRequired = json['is_laptop_required'];
    travelReqStatus = json['travel_req_status'];
    travelReqStatusNotes = json['travel_req_status_notes'];
    currentTicketOwner = json['current_ticket_owner'];
    supervisor = json['supervisor'];
    expenseApprover = json['expense_approver'];
    projectManager = json['project_manager'];
    businessLead = json['business_lead'];
    clientExecutiveLead = json['client_executive_lead'];
    haveLaptop = json['have_laptop'];
    approvalLevel = json['approval_level'];
    expenceCureency = json['expence_cureency'];
    expenceDepartureDate = json['expence_departureDate'];
    expenceEstimatedCost = json['expence_estimatedCost'];
    expenceFromCountry = json['expence_fromCountry'];
    expenceReturnDate = json['expence_returnDate'];
    expenceToCountry = json['expence_toCountry'];
    column1 = json['column1'];
    column2 = json['column2'];
    column3 = json['column3'];
    column4 = json['column4'];
    column5 = json['column5'];
    column6 = json['column6'];
    column7 = json['column7'];
    column8 = json['column8'];
    column9 = json['column9'];
    column10 = json['column10'];
    column11 = json['column11'];
    column12 = json['column12'];
    empEmail = json['emp_email'];
    project = json['project'];
    organization = json['organization'];
    empCode = json['emp_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    if (json['details'] != null) {
      details = new List<Details>();
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
    if (json['dependents'] != null) {
      dependent = new List<Dependent>();
      json['dependents'].forEach((v) {
        dependent.add(new Dependent.fromJson(v));
      });
    }
    if (json['visa_requests'] != null) {
      if(json['visa_requests']==""){
        visaRequests =[];


      }else{
        visaRequests = new List<VisaRequests>();
        json['visa_requests'].forEach((v) {
          visaRequests.add(new VisaRequests.fromJson(v));
        });
      }

    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['status'] = this.status;
    data['travel_req_id'] = this.travelReqId;
    data['project_name'] = this.projectName;
    data['policy_violations'] = this.policyViolations;
    data['is_billable'] = this.isBillable;
    data['is_travel_multi_country'] = this.isTravelMultiCountry;
    data['is_travel_multi_city'] = this.isTravelMultiCity;
    data['request_notes'] = this.requestNotes;
    data['remark'] = this.remark;
    data['home_contact_name'] = this.homeContactName;
    data['home_phone_ext'] = this.homePhoneExt;
    data['home_phone_number'] = this.homePhoneNumber;
    data['is_laptop_required'] = this.isLaptopRequired;
    data['travel_req_status'] = this.travelReqStatus;
    data['travel_req_status_notes'] = this.travelReqStatusNotes;
    data['current_ticket_owner'] = this.currentTicketOwner;
    data['supervisor'] = this.supervisor;
    data['expense_approver'] = this.expenseApprover;
    data['project_manager'] = this.projectManager;
    data['business_lead'] = this.businessLead;
    data['client_executive_lead'] = this.clientExecutiveLead;
    data['have_laptop'] = this.haveLaptop;
    data['approval_level'] = this.approvalLevel;
    data['expence_cureency'] = this.expenceCureency;
    data['expence_departureDate'] = this.expenceDepartureDate;
    data['expence_estimatedCost'] = this.expenceEstimatedCost;
    data['expence_fromCountry'] = this.expenceFromCountry;
    data['expence_returnDate'] = this.expenceReturnDate;
    data['expence_toCountry'] = this.expenceToCountry;
    data['column1'] = this.column1;
    data['column2'] = this.column2;
    data['column3'] = this.column3;
    data['column4'] = this.column4;
    data['column5'] = this.column5;
    data['column6'] = this.column6;
    data['column7'] = this.column7;
    data['column8'] = this.column8;
    data['column9'] = this.column9;
    data['column10'] = this.column10;
    data['column11'] = this.column11;
    data['column12'] = this.column12;
    data['emp_email'] = this.empEmail;
    data['project'] = this.project;
    data['organization'] = this.organization;
    data['emp_code'] = this.empCode;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    if (this.dependent != null) {
      data['dependents'] = this.dependent.map((v) => v.toJson()).toList();
    }
    if (this.visaRequests != null) {
      data['visa_requests'] = this.visaRequests.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class VisaRequests {
  String visaReqId;

  VisaRequests({this.visaReqId});

  VisaRequests.fromJson(Map<String, dynamic> json) {
    visaReqId = json['visa_req_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visa_req_id'] = this.visaReqId;
    return data;
  }
}
class Details {
  Currency_Data currency_data;
  double currencyTotal=0.0;
  int id;
  String dateCreated;
  String dateModified;
  String createdBy;
  String modifiedBy;
  bool status;
  String travellingCountry;
  String travellingCountryTo;
  String officeLocation;
  String clientNumberExt;
  dynamic clientNumber;
  String sourceCity;
  String destinationCity;
  String departureDate;
  String returnDate;
  bool isAccmodationRequired;
  String accmodationStartDate;
  String accmodationEndDate;
  String travelPurpose;
  dynamic applicableVisa;
  String visaNumber;
  String visaExpiryDate;
  String hostHrName;
  dynamic hostCountryHead;
  dynamic hostAttorney;
  String hostPhoneExt;
  String hostPhoneNo;
  bool isClientLocation;
  dynamic clientName;
  dynamic clientAddress;
  dynamic hotelCost;
  dynamic perDiemCost;
  dynamic airfareCost;
  dynamic transportationCost;
  dynamic totalCost;
  String currency;
  dynamic reportingCurrency;
  dynamic travelRequestStatus;
  dynamic travelRequestStatusNotes;
  bool isDependent;
  dynamic agenda;
  dynamic column1;
  dynamic column2;
  dynamic column3;
  dynamic column4;
  dynamic column5;
  dynamic column6;
  dynamic column7;
  dynamic column8;
  dynamic column9;
  dynamic column10;
  dynamic column11;
  dynamic column12;
  String travelReqId;
  dynamic organization;
  dynamic assignmentType;


  double get currencyTotalData => currencyTotal;

  set currencyTotalData(double value) {
    currencyTotal = value;
  }

  Currency_Data get currency_dataset=> currency_data;

  set currency_dataset(Currency_Data value) {
    currency_data = value;
  }

  Details(
      {this.id,
        this.dateCreated,
        this.dateModified,
        this.createdBy,
        this.modifiedBy,
        this.status,
        this.travellingCountry,
        this.travellingCountryTo,
        this.officeLocation,
        this.clientNumberExt,
        this.clientNumber,
        this.sourceCity,
        this.destinationCity,
        this.departureDate,
        this.returnDate,
        this.isAccmodationRequired,
        this.accmodationStartDate,
        this.accmodationEndDate,
        this.travelPurpose,
        this.applicableVisa,
        this.visaNumber,
        this.visaExpiryDate,
        this.hostHrName,
        this.hostCountryHead,
        this.hostAttorney,
        this.hostPhoneExt,
        this.hostPhoneNo,
        this.isClientLocation,
        this.clientName,
        this.clientAddress,
        this.hotelCost,
        this.perDiemCost,
        this.airfareCost,
        this.transportationCost,
        this.totalCost,
        this.currency,
        this.reportingCurrency,
        this.travelRequestStatus,
        this.travelRequestStatusNotes,
        this.isDependent,
        this.agenda,
        this.column1,
        this.column2,
        this.column3,
        this.column4,
        this.column5,
        this.column6,
        this.column7,
        this.column8,
        this.column9,
        this.column10,
        this.column11,
        this.column12,
        this.travelReqId,
        this.organization,
        this.currency_data,
        this.currencyTotal,
        this.assignmentType});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    travellingCountry = json['travelling_country'];
    travellingCountryTo = json['travelling_country_to'];
    officeLocation = json['office_location'];
    clientNumberExt = json['client_number_ext'];
    clientNumber = json['client_number'];
    sourceCity = json['source_city'];
    destinationCity = json['destination_city'];
    departureDate = json['departure_date'];
    returnDate = json['return_date'];
    isAccmodationRequired = json['is_accmodation_required'];
    accmodationStartDate = json['accmodation_start_date'];
    accmodationEndDate = json['accmodation_end_date'];
    travelPurpose = json['travel_purpose'];
    applicableVisa = json['applicable_visa'];
    visaNumber = json['visa_number'];
    visaExpiryDate = json['visa_expiry_date'];
    hostHrName = json['host_hr_name'];
    hostCountryHead = json['host_country_head'];
    hostAttorney = json['host_attorney'];
    hostPhoneExt = json['host_phone_ext'];
    hostPhoneNo = json['host_phone_no'];
    isClientLocation = json['is_client_location'];
    clientName = json['client_name'];
    clientAddress = json['client_address'];
    hotelCost = json['hotel_cost'];
    perDiemCost = json['per_diem_cost'];
    airfareCost = json['airfare_cost'];
    transportationCost = json['transportation_cost'];
    totalCost = json['total_cost'];
    currency = json['currency'];
    reportingCurrency = json['reporting_currency'];
    travelRequestStatus = json['travel_request_status'];
    travelRequestStatusNotes = json['travel_request_status_notes'];
    isDependent = json['is_dependent'];
    agenda = json['agenda'];
    column1 = json['column1'];
    column2 = json['column2'];
    column3 = json['column3'];
    column4 = json['column4'];
    column5 = json['column5'];
    column6 = json['column6'];
    column7 = json['column7'];
    column8 = json['column8'];
    column9 = json['column9'];
    column10 = json['column10'];
    column11 = json['column11'];
    column12 = json['column12'];
    travelReqId = json['travel_req_id'];
    organization = json['organization'];
    assignmentType = json['assignment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['status'] = this.status;
    data['travelling_country'] = this.travellingCountry;
    data['travelling_country_to'] = this.travellingCountryTo;
    data['office_location'] = this.officeLocation;
    data['client_number_ext'] = this.clientNumberExt;
    data['client_number'] = this.clientNumber;
    data['source_city'] = this.sourceCity;
    data['destination_city'] = this.destinationCity;
    data['departure_date'] = this.departureDate;
    data['return_date'] = this.returnDate;
    data['is_accmodation_required'] = this.isAccmodationRequired;
    data['accmodation_start_date'] = this.accmodationStartDate;
    data['accmodation_end_date'] = this.accmodationEndDate;
    data['travel_purpose'] = this.travelPurpose;
    data['applicable_visa'] = this.applicableVisa;
    data['visa_number'] = this.visaNumber;
    data['visa_expiry_date'] = this.visaExpiryDate;
    data['host_hr_name'] = this.hostHrName;
    data['host_country_head'] = this.hostCountryHead;
    data['host_attorney'] = this.hostAttorney;
    data['host_phone_ext'] = this.hostPhoneExt;
    data['host_phone_no'] = this.hostPhoneNo;
    data['is_client_location'] = this.isClientLocation;
    data['client_name'] = this.clientName;
    data['client_address'] = this.clientAddress;
    data['hotel_cost'] = this.hotelCost;
    data['per_diem_cost'] = this.perDiemCost;
    data['airfare_cost'] = this.airfareCost;
    data['transportation_cost'] = this.transportationCost;
    data['total_cost'] = this.totalCost;
    data['currency'] = this.currency;
    data['reporting_currency'] = this.reportingCurrency;
    data['travel_request_status'] = this.travelRequestStatus;
    data['travel_request_status_notes'] = this.travelRequestStatusNotes;
    data['is_dependent'] = this.isDependent;
    data['agenda'] = this.agenda;
    data['column1'] = this.column1;
    data['column2'] = this.column2;
    data['column3'] = this.column3;
    data['column4'] = this.column4;
    data['column5'] = this.column5;
    data['column6'] = this.column6;
    data['column7'] = this.column7;
    data['column8'] = this.column8;
    data['column9'] = this.column9;
    data['column10'] = this.column10;
    data['column11'] = this.column11;
    data['column12'] = this.column12;
    data['travel_req_id'] = this.travelReqId;
    data['organization'] = this.organization;
    data['assignment_type'] = this.assignmentType;
    return data;
  }
}
class Dependent {
  int _id;
  String _dateCreated;
  String _dateModified;
  String _createdBy;
  String _modifiedBy;
  bool _status;
  String _reqId;
  String _dependentRelation;
  String _dependentName;
  String _dependentPassport;
  String _dependentVisa;
  Null _column1;
  Null _column2;
  Null _column3;
  Null _column4;
  Null _column5;
  Null _column6;
  Null _column7;
  Null _column8;
  Null _column9;
  Null _column10;
  Null _column11;
  Null _column12;
  String _travelReqId;
  Null _organization;

  Dependent(
      {int id,
        String dateCreated,
        String dateModified,
        String createdBy,
        String modifiedBy,
        bool status,
        String reqId,
        String dependentRelation,
        String dependentName,
        String dependentPassport,
        String dependentVisa,
        Null column1,
        Null column2,
        Null column3,
        Null column4,
        Null column5,
        Null column6,
        Null column7,
        Null column8,
        Null column9,
        Null column10,
        Null column11,
        Null column12,
        String travelReqId,
        Null organization}) {
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
  String get reqId => _reqId;
  set reqId(String reqId) => _reqId = reqId;
  String get dependentRelation => _dependentRelation;
  set dependentRelation(String dependentRelation) =>
      _dependentRelation = dependentRelation;
  String get dependentName => _dependentName;
  set dependentName(String dependentName) => _dependentName = dependentName;
  String get dependentPassport => _dependentPassport;
  set dependentPassport(String dependentPassport) =>
      _dependentPassport = dependentPassport;
  String get dependentVisa => _dependentVisa;
  set dependentVisa(String dependentVisa) => _dependentVisa = dependentVisa;
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
