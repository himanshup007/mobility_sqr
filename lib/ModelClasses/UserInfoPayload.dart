class UserInfoPayload {
  String _userName;
  String _loginMethod;
  String _firstName;
  String _lastName;
  String _middleName;
  String _preferredFirstName;
  Null _preferredLastName;
  String _salutation;
  String _suffix;
  String _gender;
  String _countryOfBirth;
  String _maritalStatus;
  String _maritalStatusSince;
  String _nationality;
  String _secondNationality;
  String _dob;
  String _placeOfBirth;
  String _empCode;
  int _updateId;
  String _email;
  String _supervisor;
  String _photo;
  String _personId;

  UserInfoPayload(
      {String userName,
        String loginMethod,
        String firstName,
        String lastName,
        String middleName,
        String preferredFirstName,
        dynamic preferredLastName,
        String salutation,
        String suffix,
        String gender,
        String countryOfBirth,
        String maritalStatus,
        String maritalStatusSince,
        String nationality,
        String secondNationality,
        String dob,
        String placeOfBirth,
        String empCode,
        int updateId,
        String email,
        String supervisor,
        String photo,
        String personId}) {
    this._userName = userName;
    this._loginMethod = loginMethod;
    this._firstName = firstName;
    this._lastName = lastName;
    this._middleName = middleName;
    this._preferredFirstName = preferredFirstName;
    this._preferredLastName = preferredLastName;
    this._salutation = salutation;
    this._suffix = suffix;
    this._gender = gender;
    this._countryOfBirth = countryOfBirth;
    this._maritalStatus = maritalStatus;
    this._maritalStatusSince = maritalStatusSince;
    this._nationality = nationality;
    this._secondNationality = secondNationality;
    this._dob = dob;
    this._placeOfBirth = placeOfBirth;
    this._empCode = empCode;
    this._updateId = updateId;
    this._email = email;
    this._supervisor = supervisor;
    this._photo = photo;
    this._personId = personId;
  }

  String get userName => _userName;
  set userName(String userName) => _userName = userName;
  String get loginMethod => _loginMethod;
  set loginMethod(String loginMethod) => _loginMethod = loginMethod;
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
  String get suffix => _suffix;
  set suffix(String suffix) => _suffix = suffix;
  String get gender => _gender;
  set gender(String gender) => _gender = gender;
  String get countryOfBirth => _countryOfBirth;
  set countryOfBirth(String countryOfBirth) => _countryOfBirth = countryOfBirth;
  String get maritalStatus => _maritalStatus;
  set maritalStatus(String maritalStatus) => _maritalStatus = maritalStatus;
  String get maritalStatusSince => _maritalStatusSince;
  set maritalStatusSince(String maritalStatusSince) =>
      _maritalStatusSince = maritalStatusSince;
  String get nationality => _nationality;
  set nationality(String nationality) => _nationality = nationality;
  String get secondNationality => _secondNationality;
  set secondNationality(String secondNationality) =>
      _secondNationality = secondNationality;
  String get dob => _dob;
  set dob(String dob) => _dob = dob;
  String get placeOfBirth => _placeOfBirth;
  set placeOfBirth(String placeOfBirth) => _placeOfBirth = placeOfBirth;
  String get empCode => _empCode;
  set empCode(String empCode) => _empCode = empCode;
  int get updateId => _updateId;
  set updateId(int updateId) => _updateId = updateId;
  String get email => _email;
  set email(String email) => _email = email;
  String get supervisor => _supervisor;
  set supervisor(String supervisor) => _supervisor = supervisor;
  String get photo => _photo;
  set photo(String photo) => _photo = photo;
  String get personId => _personId;
  set personId(String personId) => _personId = personId;

  UserInfoPayload.fromJson(Map<String, dynamic> json) {
    _userName = json['user_name'];
    _loginMethod = json['login_method'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _middleName = json['middle_name'];
    _preferredFirstName = json['preferred_first_name'];
    _preferredLastName = json['preferred_last_name'];
    _salutation = json['salutation'];
    _suffix = json['suffix'];
    _gender = json['gender'];
    _countryOfBirth = json['country_of_birth'];
    _maritalStatus = json['marital_status'];
    _maritalStatusSince = json['marital_status_since'];
    _nationality = json['nationality'];
    _secondNationality = json['second_nationality'];
    _dob = json['dob'];
    _placeOfBirth = json['place_of_birth'];
    _empCode = json['emp_code'];
    _updateId = json['update_id'];
    _email = json['email'];
    _supervisor = json['supervisor'];
    _photo = json['photo'];
    _personId = json['person_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this._userName;
    data['login_method'] = this._loginMethod;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['middle_name'] = this._middleName;
    data['preferred_first_name'] = this._preferredFirstName;
    data['preferred_last_name'] = this._preferredLastName;
    data['salutation'] = this._salutation;
    data['suffix'] = this._suffix;
    data['gender'] = this._gender;
    data['country_of_birth'] = this._countryOfBirth;
    data['marital_status'] = this._maritalStatus;
    data['marital_status_since'] = this._maritalStatusSince;
    data['nationality'] = this._nationality;
    data['second_nationality'] = this._secondNationality;
    data['dob'] = this._dob;
    data['place_of_birth'] = this._placeOfBirth;
    data['emp_code'] = this._empCode;
    data['update_id'] = this._updateId;
    data['email'] = this._email;
    data['supervisor'] = this._supervisor;
    data['photo'] = this._photo;
    data['person_id'] = this._personId;
    return data;
  }
}