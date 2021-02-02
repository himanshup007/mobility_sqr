import 'package:country_pickers/country.dart';
import 'package:mobility_sqr/ModelClasses/DependentModel.dart';
import 'package:mobility_sqr/ModelClasses/Get_Post_Location.dart';
import 'package:mobility_sqr/ModelClasses/PurposeModelClass.dart';
import 'package:mobility_sqr/ModelClasses/SearchModelClass.dart';

class TravelReqPayLoad {
  String _travelReqId;
  String _project;
  String _projectName;
  bool _isBillable;
  bool _isTravelMultiCountry;
  bool _isTravelMultiCity;
  String _homeContactName;
  String _homePhoneNumber;
  String _homePhoneExt;
  String _empEmail;
  String _remark;
  bool _isLaptopRequired;
  bool _haveLaptop;
  String _organization;
  String _travelReqStatus;
  List<TravelCity> _travelCity;
  List<TravelVisa> _travelVisa;
  String _createdBy;
  String _expenceFromCountry;
  String _expenceToCountry;
  String _expenceDepartureDate;
  String _expenceReturnDate;
  String _expenceEstimatedCost;
  String _expenceCureency;
  Country _homeCountry;


  TravelReqPayLoad(
      {String travelReqId,
      String project,
      String projectName,
      bool isBillable,
      bool isTravelMultiCountry,
      bool isTravelMultiCity,
      String homeContactName,
      String homePhoneNumber,
      String homePhoneExt,
      String empEmail,
      String remark,
      bool isLaptopRequired,
      bool haveLaptop,
      String organization,
      String travelReqStatus,
      List<TravelCity> travelCity,
      List<TravelVisa> travelVisa,
      String createdBy,
      String expenceFromCountry,
      String expenceToCountry,
      String expenceDepartureDate,
      String expenceReturnDate,
      String expenceEstimatedCost,
      String expenceCureency,
      Country homeCountry}) {
    this._homeCountry = homeCountry;
    this._travelReqId = travelReqId;
    this._project = project;
    this._projectName = projectName;
    this._isBillable = isBillable;
    this._isTravelMultiCountry = isTravelMultiCountry;
    this._isTravelMultiCity = isTravelMultiCity;
    this._homeContactName = homeContactName;
    this._homePhoneNumber = homePhoneNumber;
    this._homePhoneExt = homePhoneExt;
    this._empEmail = empEmail;
    this._remark = remark;
    this._isLaptopRequired = isLaptopRequired;
    this._haveLaptop = haveLaptop;
    this._organization = organization;
    this._travelReqStatus = travelReqStatus;
    this._travelCity = travelCity;
    this._travelVisa = travelVisa;
    this._createdBy = createdBy;
    this._expenceFromCountry = expenceFromCountry;
    this._expenceToCountry = expenceToCountry;
    this._expenceDepartureDate = expenceDepartureDate;
    this._expenceReturnDate = expenceReturnDate;
    this._expenceEstimatedCost = expenceEstimatedCost;
    this._expenceCureency = expenceCureency;

  }

  Country get homeCountry => _homeCountry;

  set homeCountry(Country value) {
    _homeCountry = value;
  }

  String get travelReqId => _travelReqId;

  set travelReqId(String travelReqId) => _travelReqId = travelReqId;

  String get project => _project;

  set project(String project) => _project = project;

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

  String get homeContactName => _homeContactName;

  set homeContactName(String homeContactName) =>
      _homeContactName = homeContactName;

  String get homePhoneNumber => _homePhoneNumber;

  set homePhoneNumber(String homePhoneNumber) =>
      _homePhoneNumber = homePhoneNumber;

  String get homePhoneExt => _homePhoneExt;

  set homePhoneExt(String homePhoneExt) => _homePhoneExt = homePhoneExt;

  String get empEmail => _empEmail;

  set empEmail(String empEmail) => _empEmail = empEmail;

  String get remark => _remark;

  set remark(String remark) => _remark = remark;

  bool get isLaptopRequired => _isLaptopRequired;

  set isLaptopRequired(bool isLaptopRequired) =>
      _isLaptopRequired = isLaptopRequired;

  bool get haveLaptop => _haveLaptop;

  set haveLaptop(bool haveLaptop) => _haveLaptop = haveLaptop;

  String get organization => _organization;

  set organization(String organization) => _organization = organization;

  String get travelReqStatus => _travelReqStatus;

  set travelReqStatus(String travelReqStatus) =>
      _travelReqStatus = travelReqStatus;

  List<TravelCity> get travelCity => _travelCity;

  set travelCity(List<TravelCity> travelCity) => _travelCity = travelCity;

  List<TravelVisa> get travelVisa => _travelVisa;

  set travelVisa(List<TravelVisa> travelVisa) => _travelVisa = travelVisa;

  String get createdBy => _createdBy;

  set createdBy(String createdBy) => _createdBy = createdBy;

  String get expenceFromCountry => _expenceFromCountry;

  set expenceFromCountry(String expenceFromCountry) =>
      _expenceFromCountry = expenceFromCountry;

  String get expenceToCountry => _expenceToCountry;

  set expenceToCountry(String expenceToCountry) =>
      _expenceToCountry = expenceToCountry;

  String get expenceDepartureDate => _expenceDepartureDate;

  set expenceDepartureDate(String expenceDepartureDate) =>
      _expenceDepartureDate = expenceDepartureDate;

  String get expenceReturnDate => _expenceReturnDate;

  set expenceReturnDate(String expenceReturnDate) =>
      _expenceReturnDate = expenceReturnDate;

  String get expenceEstimatedCost => _expenceEstimatedCost;

  set expenceEstimatedCost(String expenceEstimatedCost) =>
      _expenceEstimatedCost = expenceEstimatedCost;

  String get expenceCureency => _expenceCureency;

  set expenceCureency(String expenceCureency) =>
      _expenceCureency = expenceCureency;

  TravelReqPayLoad.fromJson(Map<String, dynamic> json) {
    _travelReqId = json['travel_req_id'];
    _project = json['project'];
    _projectName = json['project_name'];
    _isBillable = json['is_billable'];
    _isTravelMultiCountry = json['is_travel_multi_country'];
    _isTravelMultiCity = json['is_travel_multi_city'];
    _homeContactName = json['home_contact_name'];
    _homePhoneNumber = json['home_phone_number'];
    _homePhoneExt = json['home_phone_ext'];
    _empEmail = json['emp_email'];
    _remark = json['remark'];
    _isLaptopRequired = json['is_laptop_required'];
    _haveLaptop = json['have_laptop'];
    _organization = json['organization'];
    _travelReqStatus = json['travel_req_status'];
    if (json['travel_city'] != null) {
      _travelCity = new List<TravelCity>();
      json['travel_city'].forEach((v) {
        _travelCity.add(new TravelCity.fromJson(v));
      });
    }
    if (json['travel_visa'] != null) {
      _travelVisa = new List<TravelVisa>();
      json['travel_visa'].forEach((v) {
        _travelVisa.add(new TravelVisa.fromJson(v));
      });
    }
    _createdBy = json['created_by'];
    _expenceFromCountry = json['expence_fromCountry'];
    _expenceToCountry = json['expence_toCountry'];
    _expenceDepartureDate = json['expence_departureDate'];
    _expenceReturnDate = json['expence_returnDate'];
    _expenceEstimatedCost = json['expence_estimatedCost'];
    _expenceCureency = json['expence_cureency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['travel_req_id'] = this._travelReqId;
    data['project'] = this._project;
    data['project_name'] = this._projectName;
    data['is_billable'] = this._isBillable;
    data['is_travel_multi_country'] = this._isTravelMultiCountry;
    data['is_travel_multi_city'] = this._isTravelMultiCity;
    data['home_contact_name'] = this._homeContactName;
    data['home_phone_number'] = this._homePhoneNumber;
    data['home_phone_ext'] = this._homePhoneExt;
    data['emp_email'] = this._empEmail;
    data['remark'] = this._remark;
    data['is_laptop_required'] = this._isLaptopRequired;
    data['have_laptop'] = this._haveLaptop;
    data['organization'] = this._organization;
    data['travel_req_status'] = this._travelReqStatus;
    if (this._travelCity != null) {
      data['travel_city'] = this._travelCity.map((v) => v.toJson()).toList();
    }
    if (this._travelVisa != null) {
      data['travel_visa'] = this._travelVisa.map((v) => v.toJson()).toList();
    }
    data['created_by'] = this._createdBy;
    data['expence_fromCountry'] = this._expenceFromCountry;
    data['expence_toCountry'] = this._expenceToCountry;
    data['expence_departureDate'] = this._expenceDepartureDate;
    data['expence_returnDate'] = this._expenceReturnDate;
    data['expence_estimatedCost'] = this._expenceEstimatedCost;
    data['expence_cureency'] = this._expenceCureency;
    return data;
  }
}

class TravelCity {
  int _hide;
  String _sourceCity;
  String _perDiamValue;
  String _transportCost;
  double _myTotalCost=0.0;
  double _myAirFare=0.0;
  double get myTotalCost => _myTotalCost;

  set myTotalCost(double value) {
    _myTotalCost = value;
  }

  int get hide => _hide;

  set hide(int value) {
    _hide = value;
  }

  List<PurposeData> get purposeList => _purposeList;

  set purposeList(List<PurposeData> value) {
    _purposeList = value;
  }

  PostLocationData _postLocationData;
  List<PurposeData> _purposeList;
  String _destinationCity;

  PostLocationData get postLocationData => _postLocationData;

  set postLocationData(PostLocationData value) {
    _postLocationData = value;
  }

  String _travellingCountry;
  String _travellingCountryTo;
  String _departureDate;
  String _returnDate;
  bool _isAccmodationRequired;
  String _accmodationStartDate;
  String _accmodationEndDate;
  dynamic _hotelCost;
  dynamic _perDiemCost;
  dynamic _transportationCost;
  dynamic _totalCost;
  dynamic _accomodationLimit;
  String _reportingCurrency;
  String _currency;
  String _agenda;
  String _travelPurpose;
  String _applicableVisa;
  String _visaNumber;
  String _visaExpiryDate;
  String _isClientLocation;
  String _clientName;
  String _clientNumber;
  String _clientNumberExt;
  String _clientAddress;
  String _officeLocation;
  String _hostHrName;
  String _hostPhoneNo;
  String _hostPhoneExt;
  bool _isDependent;
  List<DependentData> _dependentData;
  List<PostLocationData> _postLocationList;
  List<SecondDependentData> _myDependentList;
  SearchList _toCountryData ;
  bool _hasVisa;

  double get myAirFare => _myAirFare;

  set myAirFare(double value) {
    _myAirFare = value;
  }

  dynamic get accomodationLimit => _accomodationLimit;

  set accomodationLimit(dynamic value) {
    _accomodationLimit = value;
  }

  bool get hasVisa => _hasVisa;

  set hasVisa(bool value) {
    _hasVisa = value;
  }

  SearchList get toCountryData => _toCountryData;

  set toCountryData(SearchList value) {
    _toCountryData = value;
  }

  List<SecondDependentData> get myDependentList => _myDependentList;

  set myDependentList(List<SecondDependentData> value) {
    _myDependentList = value;
  }

  List<PostLocationData> get postLocationList => _postLocationList;

  set postLocationList(List<PostLocationData> value) {
    _postLocationList = value;
  }

  String get perDiamValue => _perDiamValue;

  set perDiamValue(String value) {
    _perDiamValue = value;
  }

  String get transportCost => _transportCost;

  set transportCost(String value) {
    _transportCost = value;
  }

  TravelCity(
      {String TransportCost,
        SearchList toCountryData,
      List<SecondDependentData> myDependentList,
        bool hasVisa,
      PostLocationData postLocationData,
      List<PostLocationData> postLocationList,
      List<PurposeData> purposeList,
      int hide,
      String sourceCity,
      String destinationCity,
      String travellingCountry,
      String travellingCountryTo,
      String departureDate,
      String returnDate,
      bool isAccmodationRequired,
      String accmodationStartDate,
      String accmodationEndDate,
      dynamic hotelCost,
      dynamic perDiemCost,
      dynamic transportationCost,
      dynamic totalCost,
        dynamic accomodationLimit,
      String reportingCurrency,
      String currency,
      String agenda,
      String travelPurpose,
      String applicableVisa,
      String visaNumber,
      String visaExpiryDate,
      String isClientLocation,
      String clientName,
      String clientNumber,
      String clientNumberExt,
      String clientAddress,
      String officeLocation,
      String hostHrName,
      String hostPhoneNo,
      String hostPhoneExt,
      bool isDependent,
      String perDiemValue,
        double myTotalCost,
        double airFare,

      List<DependentData> dependentData}) {
    this._accomodationLimit=accomodationLimit;
    this._myAirFare=airFare;
    this._hasVisa=hasVisa;
    this._toCountryData=toCountryData;
    this._transportCost = TransportCost;
    this._perDiamValue = perDiemValue;
    this._myDependentList = myDependentList;
    this._postLocationData = postLocationData;
    this._purposeList = purposeList;
    this._sourceCity = sourceCity;
    this._hide = hide;
    this._destinationCity = destinationCity;
    this._travellingCountry = travellingCountry;
    this._travellingCountryTo = travellingCountryTo;
    this._departureDate = departureDate;
    this._returnDate = returnDate;
    this._isAccmodationRequired = isAccmodationRequired;
    this._accmodationStartDate = accmodationStartDate;
    this._accmodationEndDate = accmodationEndDate;
    this._hotelCost = hotelCost;
    this._perDiemCost = perDiemCost;
    this._transportationCost = transportationCost;
    this._totalCost = totalCost;
    this._reportingCurrency = reportingCurrency;
    this._currency = currency;
    this._agenda = agenda;
    this._travelPurpose = travelPurpose;
    this._applicableVisa = applicableVisa;
    this._visaNumber = visaNumber;
    this._visaExpiryDate = visaExpiryDate;
    this._isClientLocation = isClientLocation;
    this._clientName = clientName;
    this._clientNumber = clientNumber;
    this._clientNumberExt = clientNumberExt;
    this._clientAddress = clientAddress;
    this._officeLocation = officeLocation;
    this._hostHrName = hostHrName;
    this._hostPhoneNo = hostPhoneNo;
    this._hostPhoneExt = hostPhoneExt;
    this._isDependent = isDependent;
    this._dependentData = dependentData;
    this._postLocationList = postLocationList;
    this._myTotalCost=myTotalCost;

  }

  String get sourceCity => _sourceCity;

  set sourceCity(String sourceCity) => _sourceCity = sourceCity;

  String get destinationCity => _destinationCity;

  set destinationCity(String destinationCity) =>
      _destinationCity = destinationCity;

  String get travellingCountry => _travellingCountry;

  set travellingCountry(String travellingCountry) =>
      _travellingCountry = travellingCountry;

  String get travellingCountryTo => _travellingCountryTo;

  set travellingCountryTo(String travellingCountryTo) =>
      _travellingCountryTo = travellingCountryTo;

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

  dynamic get hotelCost => _hotelCost;

  set hotelCost(dynamic hotelCost) => _hotelCost = hotelCost;

  dynamic get perDiemCost => _perDiemCost;

  set perDiemCost(dynamic perDiemCost) => _perDiemCost = perDiemCost;

  dynamic get transportationCost => _transportationCost;

  set transportationCost(dynamic transportationCost) =>
      _transportationCost = transportationCost;

  dynamic get totalCost => _totalCost;

  set totalCost(dynamic totalCost) => _totalCost = totalCost;

  String get reportingCurrency => _reportingCurrency;

  set reportingCurrency(String reportingCurrency) =>
      _reportingCurrency = reportingCurrency;

  String get currency => _currency;

  set currency(String currency) => _currency = currency;

  String get agenda => _agenda;

  set agenda(String agenda) => _agenda = agenda;

  String get travelPurpose => _travelPurpose;

  set travelPurpose(String travelPurpose) => _travelPurpose = travelPurpose;

  String get applicableVisa => _applicableVisa;

  set applicableVisa(String applicableVisa) => _applicableVisa = applicableVisa;

  String get visaNumber => _visaNumber;

  set visaNumber(String visaNumber) => _visaNumber = visaNumber;

  String get visaExpiryDate => _visaExpiryDate;

  set visaExpiryDate(String visaExpiryDate) => _visaExpiryDate = visaExpiryDate;

  String get isClientLocation => _isClientLocation;

  set isClientLocation(String isClientLocation) =>
      _isClientLocation = isClientLocation;

  String get clientName => _clientName;

  set clientName(String clientName) => _clientName = clientName;

  String get clientNumber => _clientNumber;

  set clientNumber(String clientNumber) => _clientNumber = clientNumber;

  String get clientNumberExt => _clientNumberExt;

  set clientNumberExt(String clientNumberExt) =>
      _clientNumberExt = clientNumberExt;

  String get clientAddress => _clientAddress;

  set clientAddress(String clientAddress) => _clientAddress = clientAddress;

  String get officeLocation => _officeLocation;

  set officeLocation(String officeLocation) => _officeLocation = officeLocation;

  String get hostHrName => _hostHrName;

  set hostHrName(String hostHrName) => _hostHrName = hostHrName;

  String get hostPhoneNo => _hostPhoneNo;

  set hostPhoneNo(String hostPhoneNo) => _hostPhoneNo = hostPhoneNo;

  String get hostPhoneExt => _hostPhoneExt;

  set hostPhoneExt(String hostPhoneExt) => _hostPhoneExt = hostPhoneExt;

  bool get isDependent => _isDependent;

  set isDependent(bool isDependent) => _isDependent = isDependent;

  List<DependentData> get dependentData => _dependentData;

  set dependentData(List<DependentData> dependentData) =>
      _dependentData = dependentData;

  TravelCity.fromJson(Map<String, dynamic> json) {
    _sourceCity = json['source_city'];
    _destinationCity = json['destination_city'];
    _travellingCountry = json['travelling_country'];
    _travellingCountryTo = json['travelling_country_to'];
    _departureDate = json['departure_date'];
    _returnDate = json['return_date'];
    _isAccmodationRequired = json['is_accmodation_required'];
    _accmodationStartDate = json['accmodation_start_date'];
    _accmodationEndDate = json['accmodation_end_date'];
    _hotelCost = json['hotel_cost'];
    _perDiemCost = json['per_diem_cost'];
    _transportationCost = json['transportation_cost'];
    _totalCost = json['total_cost'];
    _reportingCurrency = json['reporting_currency'];
    _currency = json['currency'];
    _agenda = json['agenda'];
    _travelPurpose = json['travel_purpose'];
    _applicableVisa = json['applicable_visa'];
    _visaNumber = json['visa_number'];
    _visaExpiryDate = json['visa_expiry_date'];
    _isClientLocation = json['is_client_location'];
    _clientName = json['client_name'];
    _clientNumber = json['client_number'];
    _clientNumberExt = json['client_number_ext'];
    _clientAddress = json['client_address'];
    _officeLocation = json['office_location'];
    _hostHrName = json['host_hr_name'];
    _hostPhoneNo = json['host_phone_no'];
    _hostPhoneExt = json['host_phone_ext'];
    _isDependent = json['is_dependent'];
    if (json['dependentData'] != null) {
      _dependentData = new List<DependentData>();
      json['dependentData'].forEach((v) {
        _dependentData.add(new DependentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source_city'] = this._sourceCity;
    data['destination_city'] = this._destinationCity;
    data['travelling_country'] = this._travellingCountry;
    data['travelling_country_to'] = this._travellingCountryTo;
    data['departure_date'] = this._departureDate;
    data['return_date'] = this._returnDate;
    data['is_accmodation_required'] = this._isAccmodationRequired;
    data['accmodation_start_date'] = this._accmodationStartDate;
    data['accmodation_end_date'] = this._accmodationEndDate;
    data['hotel_cost'] = this._hotelCost;
    data['per_diem_cost'] = this._perDiemCost;
    data['transportation_cost'] = this._transportationCost;
    data['total_cost'] = this._totalCost;
    data['reporting_currency'] = this._reportingCurrency;
    data['currency'] = this._currency;
    data['agenda'] = this._agenda;
    data['travel_purpose'] = this._travelPurpose;
    data['applicable_visa'] = this._applicableVisa;
    data['visa_number'] = this._visaNumber;
    data['visa_expiry_date'] = this._visaExpiryDate;
    data['is_client_location'] = this._isClientLocation;
    data['client_name'] = this._clientName;
    data['client_number'] = this._clientNumber;
    data['client_number_ext'] = this._clientNumberExt;
    data['client_address'] = this._clientAddress;
    data['office_location'] = this._officeLocation;
    data['host_hr_name'] = this._hostHrName;
    data['host_phone_no'] = this._hostPhoneNo;
    data['host_phone_ext'] = this._hostPhoneExt;
    data['is_dependent'] = this._isDependent;
    if (this._dependentData != null) {
      data['dependentData'] =
          this._dependentData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DependentData {
  String _dependentRelation;
  String _dependentName;
  String _reqId;

  DependentData(
      {String dependentRelation, String dependentName, String reqId}) {
    this._dependentRelation = dependentRelation;
    this._dependentName = dependentName;
    this._reqId = reqId;
  }

  String get dependentRelation => _dependentRelation;

  set dependentRelation(String dependentRelation) =>
      _dependentRelation = dependentRelation;

  String get dependentName => _dependentName;

  set dependentName(String dependentName) => _dependentName = dependentName;

  String get reqId => _reqId;

  set reqId(String reqId) => _reqId = reqId;

  DependentData.fromJson(Map<String, dynamic> json) {
    _dependentRelation = json['dependent_relation'];
    _dependentName = json['dependent_name'];
    _reqId = json['req_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dependent_relation'] = this._dependentRelation;
    data['dependent_name'] = this._dependentName;
    data['req_id'] = this._reqId;
    return data;
  }
}

class TravelVisa {
  String _reqId;
  String _projectId;
  String _projectName;
  bool _isBillable;
  String _fromCity;
  String _toCity;
  String _travelStartDate;
  String _travelEndDate;
  String _visaPurpose;
  String _appliedVisa;
  String _requestNotes;
  String _visaStatus;
  String _empEmail;
  String _organization;
  String _visaReqId;
  bool _isDependent;
  String _dependentRelation;
  String _dependentName;
  String _country;
  String _createdBy;

  TravelVisa(
      {String reqId,
      String projectId,
      String projectName,
      bool isBillable,
      String fromCity,
      String toCity,
      String travelStartDate,
      String travelEndDate,
      String visaPurpose,
      String appliedVisa,
      String requestNotes,
      String visaStatus,
      String empEmail,
      String organization,
      String visaReqId,
      bool isDependent,
      String dependentRelation,
      String dependentName,
      String country,
      String createdBy}) {
    this._reqId = reqId;
    this._projectId = projectId;
    this._projectName = projectName;
    this._isBillable = isBillable;
    this._fromCity = fromCity;
    this._toCity = toCity;
    this._travelStartDate = travelStartDate;
    this._travelEndDate = travelEndDate;
    this._visaPurpose = visaPurpose;
    this._appliedVisa = appliedVisa;
    this._requestNotes = requestNotes;
    this._visaStatus = visaStatus;
    this._empEmail = empEmail;
    this._organization = organization;
    this._visaReqId = visaReqId;
    this._isDependent = isDependent;
    this._dependentRelation = dependentRelation;
    this._dependentName = dependentName;
    this._country = country;
    this._createdBy = createdBy;
  }

  String get reqId => _reqId;

  set reqId(String reqId) => _reqId = reqId;

  String get projectId => _projectId;

  set projectId(String projectId) => _projectId = projectId;

  String get projectName => _projectName;

  set projectName(String projectName) => _projectName = projectName;

  bool get isBillable => _isBillable;

  set isBillable(bool isBillable) => _isBillable = isBillable;

  String get fromCity => _fromCity;

  set fromCity(String fromCity) => _fromCity = fromCity;

  String get toCity => _toCity;

  set toCity(String toCity) => _toCity = toCity;

  String get travelStartDate => _travelStartDate;

  set travelStartDate(String travelStartDate) =>
      _travelStartDate = travelStartDate;

  String get travelEndDate => _travelEndDate;

  set travelEndDate(String travelEndDate) => _travelEndDate = travelEndDate;

  String get visaPurpose => _visaPurpose;

  set visaPurpose(String visaPurpose) => _visaPurpose = visaPurpose;

  String get appliedVisa => _appliedVisa;

  set appliedVisa(String appliedVisa) => _appliedVisa = appliedVisa;

  String get requestNotes => _requestNotes;

  set requestNotes(String requestNotes) => _requestNotes = requestNotes;

  String get visaStatus => _visaStatus;

  set visaStatus(String visaStatus) => _visaStatus = visaStatus;

  String get empEmail => _empEmail;

  set empEmail(String empEmail) => _empEmail = empEmail;

  String get organization => _organization;

  set organization(String organization) => _organization = organization;

  String get visaReqId => _visaReqId;

  set visaReqId(String visaReqId) => _visaReqId = visaReqId;

  bool get isDependent => _isDependent;

  set isDependent(bool isDependent) => _isDependent = isDependent;

  String get dependentRelation => _dependentRelation;

  set dependentRelation(String dependentRelation) =>
      _dependentRelation = dependentRelation;

  String get dependentName => _dependentName;

  set dependentName(String dependentName) => _dependentName = dependentName;

  String get country => _country;

  set country(String country) => _country = country;

  String get createdBy => _createdBy;

  set createdBy(String createdBy) => _createdBy = createdBy;

  TravelVisa.fromJson(Map<String, dynamic> json) {
    _reqId = json['req_id'];
    _projectId = json['project_id'];
    _projectName = json['project_name'];
    _isBillable = json['is_billable'];
    _fromCity = json['from_city'];
    _toCity = json['to_city'];
    _travelStartDate = json['travel_start_date'];
    _travelEndDate = json['travel_end_date'];
    _visaPurpose = json['visa_purpose'];
    _appliedVisa = json['applied_visa'];
    _requestNotes = json['request_notes'];
    _visaStatus = json['visa_status'];
    _empEmail = json['emp_email'];
    _organization = json['organization'];
    _visaReqId = json['visa_req_id'];
    _isDependent = json['is_dependent'];
    _dependentRelation = json['dependent_relation'];
    _dependentName = json['dependent_name'];
    _country = json['country'];
    _createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req_id'] = this._reqId;
    data['project_id'] = this._projectId;
    data['project_name'] = this._projectName;
    data['is_billable'] = this._isBillable;
    data['from_city'] = this._fromCity;
    data['to_city'] = this._toCity;
    data['travel_start_date'] = this._travelStartDate;
    data['travel_end_date'] = this._travelEndDate;
    data['visa_purpose'] = this._visaPurpose;
    data['applied_visa'] = this._appliedVisa;
    data['request_notes'] = this._requestNotes;
    data['visa_status'] = this._visaStatus;
    data['emp_email'] = this._empEmail;
    data['organization'] = this._organization;
    data['visa_req_id'] = this._visaReqId;
    data['is_dependent'] = this._isDependent;
    data['dependent_relation'] = this._dependentRelation;
    data['dependent_name'] = this._dependentName;
    data['country'] = this._country;
    data['created_by'] = this._createdBy;
    return data;
  }
}
