class ApprovalModal {
  String massage;
  bool status;
  List<Data> data;

  ApprovalModal({this.massage, this.status, this.data});

  ApprovalModal.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this.massage;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  bool isSelected = false;
  String dateCreated;
  String dateModified;
  String createdBy;
  String modifiedBy;
  bool status;
  String travelReqId;
  String projectName;
  Null policyViolations;
  bool isBillable;
  bool isTravelMultiCountry;
  bool isTravelMultiCity;
  Null requestNotes;
  String remark;
  String homeContactName;
  String homePhoneExt;
  String homePhoneNumber;
  bool isLaptopRequired;
  String travelReqStatus;
  Null travelReqStatusNotes;
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
  Null column1;
  Null column2;
  Null column3;
  Null column4;
  Null column5;
  Null column6;
  Null column7;
  Null column8;
  Null column9;
  Null column10;
  Null column11;
  Null column12;
  String empEmail;
  String project;
  String organization;
  String empCode;
  String firstName;
  String lastName;
  List<Details> details;
  List<Dependent> dependent;

  Data(
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
        this.dependent});

  Data.fromJson(Map<String, dynamic> json) {
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
    homePhoneNumber = json['home_phone_number'];
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
    if (json['dependent'] != null) {
      dependent = new List<Dependent>();
      json['dependent'].forEach((v) {
        dependent.add(new Dependent.fromJson(v));
      });
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
      data['dependent'] = this.dependent.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int id;
  String travelReqIdId;
  String travellingCountry;
  String travellingCountryTo;
  String officeLocation;
  String clientNumber;
  Null organization;
  String sourceCity;
  String destinationCity;
  String departureDate;
  String returnDate;
  bool isAccmodationRequired;
  String accmodationStartDate;
  String accmodationEndDate;
  String travelPurpose;
  Null assignmentType;
  String applicableVisa;
  String visaNumber;
  String visaExpiryDate;
  String hostHrName;
  Null hostCountryHead;
  Null hostAttorney;
  String hostPhoneNo;
  bool isClientLocation;
  String clientName;
  String clientAddress;
  int hotelCost;
  int perDiemCost;
  int airfareCost;
  int transportationCost;
  int totalCost;
  Null travelRequestStatus;
  Null travelRequestStatusNotes;
  bool isDependent;

  Details(
      {this.id,
        this.travelReqIdId,
        this.travellingCountry,
        this.travellingCountryTo,
        this.officeLocation,
        this.clientNumber,
        this.organization,
        this.sourceCity,
        this.destinationCity,
        this.departureDate,
        this.returnDate,
        this.isAccmodationRequired,
        this.accmodationStartDate,
        this.accmodationEndDate,
        this.travelPurpose,
        this.assignmentType,
        this.applicableVisa,
        this.visaNumber,
        this.visaExpiryDate,
        this.hostHrName,
        this.hostCountryHead,
        this.hostAttorney,
        this.hostPhoneNo,
        this.isClientLocation,
        this.clientName,
        this.clientAddress,
        this.hotelCost,
        this.perDiemCost,
        this.airfareCost,
        this.transportationCost,
        this.totalCost,
        this.travelRequestStatus,
        this.travelRequestStatusNotes,
        this.isDependent});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    travelReqIdId = json['travel_req_id_id'];
    travellingCountry = json['travelling_country'];
    travellingCountryTo = json['travelling_country_to'];
    officeLocation = json['office_location'];
    clientNumber = json['client_number'];
    organization = json['organization'];
    sourceCity = json['source_city'];
    destinationCity = json['destination_city'];
    departureDate = json['departure_date'];
    returnDate = json['return_date'];
    isAccmodationRequired = json['is_accmodation_required'];
    accmodationStartDate = json['accmodation_start_date'];
    accmodationEndDate = json['accmodation_end_date'];
    travelPurpose = json['travel_purpose'];
    assignmentType = json['assignment_type'];
    applicableVisa = json['applicable_visa'];
    visaNumber = json['visa_number'];
    visaExpiryDate = json['visa_expiry_date'];
    hostHrName = json['host_hr_name'];
    hostCountryHead = json['host_country_head'];
    hostAttorney = json['host_attorney'];
    hostPhoneNo = json['host_phone_no'];
    isClientLocation = json['is_client_location'];
    clientName = json['client_name'];
    clientAddress = json['client_address'];
    hotelCost = json['hotel_cost'];
    perDiemCost = json['per_diem_cost'];
    airfareCost = json['airfare_cost'];
    transportationCost = json['transportation_cost'];
    totalCost = json['total_cost'];
    travelRequestStatus = json['travel_request_status'];
    travelRequestStatusNotes = json['travel_request_status_notes'];
    isDependent = json['is_dependent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['travel_req_id_id'] = this.travelReqIdId;
    data['travelling_country'] = this.travellingCountry;
    data['travelling_country_to'] = this.travellingCountryTo;
    data['office_location'] = this.officeLocation;
    data['client_number'] = this.clientNumber;
    data['organization'] = this.organization;
    data['source_city'] = this.sourceCity;
    data['destination_city'] = this.destinationCity;
    data['departure_date'] = this.departureDate;
    data['return_date'] = this.returnDate;
    data['is_accmodation_required'] = this.isAccmodationRequired;
    data['accmodation_start_date'] = this.accmodationStartDate;
    data['accmodation_end_date'] = this.accmodationEndDate;
    data['travel_purpose'] = this.travelPurpose;
    data['assignment_type'] = this.assignmentType;
    data['applicable_visa'] = this.applicableVisa;
    data['visa_number'] = this.visaNumber;
    data['visa_expiry_date'] = this.visaExpiryDate;
    data['host_hr_name'] = this.hostHrName;
    data['host_country_head'] = this.hostCountryHead;
    data['host_attorney'] = this.hostAttorney;
    data['host_phone_no'] = this.hostPhoneNo;
    data['is_client_location'] = this.isClientLocation;
    data['client_name'] = this.clientName;
    data['client_address'] = this.clientAddress;
    data['hotel_cost'] = this.hotelCost;
    data['per_diem_cost'] = this.perDiemCost;
    data['airfare_cost'] = this.airfareCost;
    data['transportation_cost'] = this.transportationCost;
    data['total_cost'] = this.totalCost;
    data['travel_request_status'] = this.travelRequestStatus;
    data['travel_request_status_notes'] = this.travelRequestStatusNotes;
    data['is_dependent'] = this.isDependent;
    return data;
  }
}

class Dependent {
  int id;
  String dateCreated;
  String dateModified;
  String createdBy;
  String modifiedBy;
  bool status;
  String reqId;
  String dependentRelation;
  String dependentName;
  String dependentPassport;
  String dependentVisa;
  Null column1;
  Null column2;
  Null column3;
  Null column4;
  Null column5;
  Null column6;
  Null column7;
  Null column8;
  Null column9;
  Null column10;
  Null column11;
  Null column12;
  String travelReqId;
  Null organization;

  Dependent(
      {this.id,
        this.dateCreated,
        this.dateModified,
        this.createdBy,
        this.modifiedBy,
        this.status,
        this.reqId,
        this.dependentRelation,
        this.dependentName,
        this.dependentPassport,
        this.dependentVisa,
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
        this.organization});

  Dependent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    reqId = json['req_id'];
    dependentRelation = json['dependent_relation'];
    dependentName = json['dependent_name'];
    dependentPassport = json['dependent_passport'];
    dependentVisa = json['dependent_visa'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['status'] = this.status;
    data['req_id'] = this.reqId;
    data['dependent_relation'] = this.dependentRelation;
    data['dependent_name'] = this.dependentName;
    data['dependent_passport'] = this.dependentPassport;
    data['dependent_visa'] = this.dependentVisa;
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
    return data;
  }
}

