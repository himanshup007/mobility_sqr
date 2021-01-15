class Depend {
  String massage;
  bool status;
  List<Data> data;

  Depend({this.massage, this.status, this.data});

  Depend.fromJson(Map<String, dynamic> json) {
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
  String name;
  String relationship;
  bool primaryFlag;
  String countryCode;
  String secondCountryCode;
  String phone;
  String secondPhone;
  bool isDependent;
  bool isEmergencyContact;
  String gender;
  String email;
  bool isAddSameAsEmployee;
  String address1;
  String address2;
  String address3;
  String city;
  String state;
  dynamic addressType;
  String country;
  String zip;
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
  String empCode;
  dynamic organization;
  String empPassport;
  String empVisa;

  Data(
      {this.id,
        this.isSelected,
        this.dateCreated,
        this.dateModified,
        this.createdBy,
        this.modifiedBy,
        this.status,
        this.name,
        this.relationship,
        this.primaryFlag,
        this.countryCode,
        this.secondCountryCode,
        this.phone,
        this.secondPhone,
        this.isDependent,
        this.isEmergencyContact,
        this.gender,
        this.email,
        this.isAddSameAsEmployee,
        this.address1,
        this.address2,
        this.address3,
        this.city,
        this.state,
        this.addressType,
        this.country,
        this.zip,
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
        this.empCode,
        this.organization,
        this.empPassport,
        this.empVisa});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    //isSelected: false;
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    createdBy = json['created_by'];
    modifiedBy = json['modified_by'];
    status = json['status'];
    name = json['name'];
    relationship = json['relationship'];
    primaryFlag = json['primary_flag'];
    countryCode = json['country_code'];
    secondCountryCode = json['second_country_code'];
    phone = json['phone'];
    secondPhone = json['second_phone'];
    isDependent = json['isDependent'];
    isEmergencyContact = json['isEmergencyContact'];
    gender = json['gender'];
    email = json['email'];
    isAddSameAsEmployee = json['isAddSameAsEmployee'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    city = json['city'];
    state = json['state'];
    addressType = json['address_type'];
    country = json['country'];
    zip = json['zip'];
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
    empCode = json['emp_code'];
    organization = json['organization'];
    empPassport = json['emp_passport'];
    empVisa = json['emp_visa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_modified'] = this.dateModified;
    data['created_by'] = this.createdBy;
    data['modified_by'] = this.modifiedBy;
    data['status'] = this.status;
    data['name'] = this.name;
    data['relationship'] = this.relationship;
    data['primary_flag'] = this.primaryFlag;
    data['country_code'] = this.countryCode;
    data['second_country_code'] = this.secondCountryCode;
    data['phone'] = this.phone;
    data['second_phone'] = this.secondPhone;
    data['isDependent'] = this.isDependent;
    data['isEmergencyContact'] = this.isEmergencyContact;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['isAddSameAsEmployee'] = this.isAddSameAsEmployee;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address_type'] = this.addressType;
    data['country'] = this.country;
    data['zip'] = this.zip;
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
    data['emp_code'] = this.empCode;
    data['organization'] = this.organization;
    data['emp_passport'] = this.empPassport;
    data['emp_visa'] = this.empVisa;
    return data;
  }
}