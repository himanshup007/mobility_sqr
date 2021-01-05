class UserInfo {
  String _massage;
  bool _status;
  Data _data;

  UserInfo({String massage, bool status, Data data}) {
    this._massage = massage;
    this._status = status;
    this._data = data;
  }

  String get massage => _massage;
  set massage(String massage) => _massage = massage;
  bool get status => _status;
  set status(bool status) => _status = status;
  Data get data => _data;
  set data(Data data) => _data = data;

  UserInfo.fromJson(Map<String, dynamic> json) {
    _massage = json['massage'];
    _status = json['status'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this._massage;
    data['status'] = this._status;
    if (this._data != null) {
      data['data'] = this._data.toJson();
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
  String _empCode;
  String _personId;
  String _loginMethod;
  String _termandcondtion;
  dynamic _istemporary;
  String _userName;
  String _firstName;
  String _lastName;
  String _middleName;
  String _preferredFirstName;
  dynamic _preferredLastName;
  String _salutation;
  dynamic _initials;
  dynamic _title;
  String _suffix;
  dynamic _displayName;
  dynamic _formalName;
  dynamic _birthName;
  dynamic _namePrefix;
  String _gender;
  String _maritalStatus;
  dynamic _maritalStatusSince;
  String _countryOfBirth;
  String _nationality;
  String _secondNationality;
  dynamic _nativePreferredLang;
  dynamic _partnerName;
  dynamic _partnerNamePrefix;
  dynamic _note;
  String _dob;
  String _placeOfBirth;
  String _activeStartDate;
  String _activeEndDate;
  String _email;
  String _password;
  dynamic _department;
  String _role;
  String _photo;
  String _assignmentRole;
  String _organization;
  String _supervisor;
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
  String _orgId;
  String _home;
  String _approver;

  Data(
      {int id,
        String dateCreated,
        String dateModified,
        String createdBy,
        String modifiedBy,
        bool status,
        String empCode,
        String personId,
        String loginMethod,
        String termandcondtion,
        dynamic istemporary,
        String userName,
        String firstName,
        String lastName,
        String middleName,
        String preferredFirstName,
        dynamic preferredLastName,
        String salutation,
        dynamic initials,
        dynamic title,
        String suffix,
        dynamic displayName,
        dynamic formalName,
        dynamic birthName,
        dynamic namePrefix,
        String gender,
        String maritalStatus,
        dynamic maritalStatusSince,
        String countryOfBirth,
        String nationality,
        String secondNationality,
        dynamic nativePreferredLang,
        dynamic partnerName,
        dynamic partnerNamePrefix,
        dynamic note,
        String dob,
        String placeOfBirth,
        String activeStartDate,
        String activeEndDate,
        String email,
        String password,
        dynamic department,
        String role,
        String photo,
        String assignmentRole,
        String organization,
        String supervisor,
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
        String orgId,
        String home,
        String approver}) {
    this._id = id;
    this._dateCreated = dateCreated;
    this._dateModified = dateModified;
    this._createdBy = createdBy;
    this._modifiedBy = modifiedBy;
    this._status = status;
    this._empCode = empCode;
    this._personId = personId;
    this._loginMethod = loginMethod;
    this._termandcondtion = termandcondtion;
    this._istemporary = istemporary;
    this._userName = userName;
    this._firstName = firstName;
    this._lastName = lastName;
    this._middleName = middleName;
    this._preferredFirstName = preferredFirstName;
    this._preferredLastName = preferredLastName;
    this._salutation = salutation;
    this._initials = initials;
    this._title = title;
    this._suffix = suffix;
    this._displayName = displayName;
    this._formalName = formalName;
    this._birthName = birthName;
    this._namePrefix = namePrefix;
    this._gender = gender;
    this._maritalStatus = maritalStatus;
    this._maritalStatusSince = maritalStatusSince;
    this._countryOfBirth = countryOfBirth;
    this._nationality = nationality;
    this._secondNationality = secondNationality;
    this._nativePreferredLang = nativePreferredLang;
    this._partnerName = partnerName;
    this._partnerNamePrefix = partnerNamePrefix;
    this._note = note;
    this._dob = dob;
    this._placeOfBirth = placeOfBirth;
    this._activeStartDate = activeStartDate;
    this._activeEndDate = activeEndDate;
    this._email = email;
    this._password = password;
    this._department = department;
    this._role = role;
    this._photo = photo;
    this._assignmentRole = assignmentRole;
    this._organization = organization;
    this._supervisor = supervisor;
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
    this._orgId = orgId;
    this._home = home;
    this._approver = approver;
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
  String get empCode => _empCode;
  set empCode(String empCode) => _empCode = empCode;
  String get personId => _personId;
  set personId(String personId) => _personId = personId;
  String get loginMethod => _loginMethod;
  set loginMethod(String loginMethod) => _loginMethod = loginMethod;
  String get termandcondtion => _termandcondtion;
  set termandcondtion(String termandcondtion) =>
      _termandcondtion = termandcondtion;
  dynamic get istemporary => _istemporary;
  set istemporary(dynamic istemporary) => _istemporary = istemporary;
  String get userName => _userName;
  set userName(String userName) => _userName = userName;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  String get middleName => _middleName;
  set middleName(String middleName) => _middleName = middleName;
  String get preferredFirstName => _preferredFirstName;
  set preferredFirstName(String preferredFirstName) =>
      _preferredFirstName = preferredFirstName;
  dynamic get preferredLastName => _preferredLastName;
  set preferredLastName(dynamic preferredLastName) =>
      _preferredLastName = preferredLastName;
  String get salutation => _salutation;
  set salutation(String salutation) => _salutation = salutation;
  dynamic get initials => _initials;
  set initials(dynamic initials) => _initials = initials;
  dynamic get title => _title;
  set title(dynamic title) => _title = title;
  String get suffix => _suffix;
  set suffix(String suffix) => _suffix = suffix;
  dynamic get displayName => _displayName;
  set displayName(dynamic displayName) => _displayName = displayName;
  dynamic get formalName => _formalName;
  set formalName(dynamic formalName) => _formalName = formalName;
  dynamic get birthName => _birthName;
  set birthName(dynamic birthName) => _birthName = birthName;
  dynamic get namePrefix => _namePrefix;
  set namePrefix(dynamic namePrefix) => _namePrefix = namePrefix;
  String get gender => _gender;
  set gender(String gender) => _gender = gender;
  String get maritalStatus => _maritalStatus;
  set maritalStatus(String maritalStatus) => _maritalStatus = maritalStatus;
  dynamic get maritalStatusSince => _maritalStatusSince;
  set maritalStatusSince(dynamic maritalStatusSince) =>
      _maritalStatusSince = maritalStatusSince;
  String get countryOfBirth => _countryOfBirth;
  set countryOfBirth(String countryOfBirth) => _countryOfBirth = countryOfBirth;
  String get nationality => _nationality;
  set nationality(String nationality) => _nationality = nationality;
  String get secondNationality => _secondNationality;
  set secondNationality(String secondNationality) =>
      _secondNationality = secondNationality;
  dynamic get nativePreferredLang => _nativePreferredLang;
  set nativePreferredLang(dynamic nativePreferredLang) =>
      _nativePreferredLang = nativePreferredLang;
  dynamic get partnerName => _partnerName;
  set partnerName(dynamic partnerName) => _partnerName = partnerName;
  dynamic get partnerNamePrefix => _partnerNamePrefix;
  set partnerNamePrefix(dynamic partnerNamePrefix) =>
      _partnerNamePrefix = partnerNamePrefix;
  dynamic get note => _note;
  set note(dynamic note) => _note = note;
  String get dob => _dob;
  set dob(String dob) => _dob = dob;
  String get placeOfBirth => _placeOfBirth;
  set placeOfBirth(String placeOfBirth) => _placeOfBirth = placeOfBirth;
  String get activeStartDate => _activeStartDate;
  set activeStartDate(String activeStartDate) =>
      _activeStartDate = activeStartDate;
  String get activeEndDate => _activeEndDate;
  set activeEndDate(String activeEndDate) => _activeEndDate = activeEndDate;
  String get email => _email;
  set email(String email) => _email = email;
  String get password => _password;
  set password(String password) => _password = password;
  dynamic get department => _department;
  set department(dynamic department) => _department = department;
  String get role => _role;
  set role(String role) => _role = role;
  String get photo => _photo;
  set photo(String photo) => _photo = photo;
  String get assignmentRole => _assignmentRole;
  set assignmentRole(String assignmentRole) => _assignmentRole = assignmentRole;
  String get organization => _organization;
  set organization(String organization) => _organization = organization;
  String get supervisor => _supervisor;
  set supervisor(String supervisor) => _supervisor = supervisor;
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
  String get orgId => _orgId;
  set orgId(String orgId) => _orgId = orgId;
  String get home => _home;
  set home(String home) => _home = home;
  String get approver => _approver;
  set approver(String approver) => _approver = approver;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateModified = json['date_modified'];
    _createdBy = json['created_by'];
    _modifiedBy = json['modified_by'];
    _status = json['status'];
    _empCode = json['emp_code'];
    _personId = json['person_id'];
    _loginMethod = json['login_method'];
    _termandcondtion = json['termandcondtion'];
    _istemporary = json['istemporary'];
    _userName = json['user_name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _middleName = json['middle_name'];
    _preferredFirstName = json['preferred_first_name'];
    _preferredLastName = json['preferred_last_name'];
    _salutation = json['salutation'];
    _initials = json['initials'];
    _title = json['title'];
    _suffix = json['suffix'];
    _displayName = json['display_name'];
    _formalName = json['formal_name'];
    _birthName = json['birth_name'];
    _namePrefix = json['name_prefix'];
    _gender = json['gender'];
    _maritalStatus = json['marital_status'];
    _maritalStatusSince = json['marital_status_since'];
    _countryOfBirth = json['country_of_birth'];
    _nationality = json['nationality'];
    _secondNationality = json['second_nationality'];
    _nativePreferredLang = json['native_preferred_lang'];
    _partnerName = json['partner_name'];
    _partnerNamePrefix = json['partner_name_prefix'];
    _note = json['note'];
    _dob = json['dob'];
    _placeOfBirth = json['place_of_birth'];
    _activeStartDate = json['active_start_date'];
    _activeEndDate = json['active_end_date'];
    _email = json['email'];
    _password = json['password'];
    _department = json['department'];
    _role = json['role'];
    _photo = json['photo'];
    _assignmentRole = json['assignment_role'];
    _organization = json['organization'];
    _supervisor = json['supervisor'];
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
    _orgId = json['org_id'];
    _home = json['home'];
    _approver = json['approver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['date_created'] = this._dateCreated;
    data['date_modified'] = this._dateModified;
    data['created_by'] = this._createdBy;
    data['modified_by'] = this._modifiedBy;
    data['status'] = this._status;
    data['emp_code'] = this._empCode;
    data['person_id'] = this._personId;
    data['login_method'] = this._loginMethod;
    data['termandcondtion'] = this._termandcondtion;
    data['istemporary'] = this._istemporary;
    data['user_name'] = this._userName;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['middle_name'] = this._middleName;
    data['preferred_first_name'] = this._preferredFirstName;
    data['preferred_last_name'] = this._preferredLastName;
    data['salutation'] = this._salutation;
    data['initials'] = this._initials;
    data['title'] = this._title;
    data['suffix'] = this._suffix;
    data['display_name'] = this._displayName;
    data['formal_name'] = this._formalName;
    data['birth_name'] = this._birthName;
    data['name_prefix'] = this._namePrefix;
    data['gender'] = this._gender;
    data['marital_status'] = this._maritalStatus;
    data['marital_status_since'] = this._maritalStatusSince;
    data['country_of_birth'] = this._countryOfBirth;
    data['nationality'] = this._nationality;
    data['second_nationality'] = this._secondNationality;
    data['native_preferred_lang'] = this._nativePreferredLang;
    data['partner_name'] = this._partnerName;
    data['partner_name_prefix'] = this._partnerNamePrefix;
    data['note'] = this._note;
    data['dob'] = this._dob;
    data['place_of_birth'] = this._placeOfBirth;
    data['active_start_date'] = this._activeStartDate;
    data['active_end_date'] = this._activeEndDate;
    data['email'] = this._email;
    data['password'] = this._password;
    data['department'] = this._department;
    data['role'] = this._role;
    data['photo'] = this._photo;
    data['assignment_role'] = this._assignmentRole;
    data['organization'] = this._organization;
    data['supervisor'] = this._supervisor;
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
    data['org_id'] = this._orgId;
    data['home'] = this._home;
    data['approver'] = this._approver;
    return data;
  }
}