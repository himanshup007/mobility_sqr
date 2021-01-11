class SearchModel {
bool _status;
String _message;
List<Data> _data;

SearchModel({bool status, String message, List<Data> data}) {
this._status = status;
this._message = message;
this._data = data;
}

bool get status => _status;
set status(bool status) => _status = status;
String get message => _message;
set message(String message) => _message = message;
List<Data> get data => _data;
set data(List<Data> data) => _data = data;

SearchModel.fromJson(Map<String, dynamic> json) {
_status = json['status'];
_message = json['Message'];
if (json['data'] != null) {
_data = new List<Data>();
json['data'].forEach((v) {
_data.add(new Data.fromJson(v));
});
}
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['status'] = this._status;
data['Message'] = this._message;
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
Null _createdBy;
Null _modifiedBy;
bool _status;
String _airportId;
String _city;
String _airportName;
String _iataCode;
String _icaoCode;
String _country;
String _column3;
Null _column4;
Null _column5;
Null _column6;
Null _column7;
Null _column8;
Null _column9;
Null _column10;
Null _column11;
Null _column12;
String _countryName;

Data(
{int id,
String dateCreated,
String dateModified,
Null createdBy,
Null modifiedBy,
bool status,
String airportId,
String city,
String airportName,
String iataCode,
String icaoCode,
String country,
String column3,
Null column4,
Null column5,
Null column6,
Null column7,
Null column8,
Null column9,
Null column10,
Null column11,
Null column12,
String countryName}) {
this._id = id;
this._dateCreated = dateCreated;
this._dateModified = dateModified;
this._createdBy = createdBy;
this._modifiedBy = modifiedBy;
this._status = status;
this._airportId = airportId;
this._city = city;
this._airportName = airportName;
this._iataCode = iataCode;
this._icaoCode = icaoCode;
this._country = country;
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
this._countryName = countryName;
}

int get id => _id;
set id(int id) => _id = id;
String get dateCreated => _dateCreated;
set dateCreated(String dateCreated) => _dateCreated = dateCreated;
String get dateModified => _dateModified;
set dateModified(String dateModified) => _dateModified = dateModified;
Null get createdBy => _createdBy;
set createdBy(Null createdBy) => _createdBy = createdBy;
Null get modifiedBy => _modifiedBy;
set modifiedBy(Null modifiedBy) => _modifiedBy = modifiedBy;
bool get status => _status;
set status(bool status) => _status = status;
String get airportId => _airportId;
set airportId(String airportId) => _airportId = airportId;
String get city => _city;
set city(String city) => _city = city;
String get airportName => _airportName;
set airportName(String airportName) => _airportName = airportName;
String get iataCode => _iataCode;
set iataCode(String iataCode) => _iataCode = iataCode;
String get icaoCode => _icaoCode;
set icaoCode(String icaoCode) => _icaoCode = icaoCode;
String get country => _country;
set country(String country) => _country = country;
String get column3 => _column3;
set column3(String column3) => _column3 = column3;
Null get column4 => _column4;
set column4(Null column4) => _column4 = column4;
Null get column5 => _column5;
set column5(Null column5) => _column5 = column5;
Null get column6 => _column6;
set column6(Null column6) => _column6 = column6;
Null get column7 => _column7;
set column7(Null column7) => _column7 = column7;
Null get column8 => _column8;
set column8(Null column8) => _column8 = column8;
Null get column9 => _column9;
set column9(Null column9) => _column9 = column9;
Null get column10 => _column10;
set column10(Null column10) => _column10 = column10;
Null get column11 => _column11;
set column11(Null column11) => _column11 = column11;
Null get column12 => _column12;
set column12(Null column12) => _column12 = column12;
String get countryName => _countryName;
set countryName(String countryName) => _countryName = countryName;

Data.fromJson(Map<String, dynamic> json) {
_id = json['id'];
_dateCreated = json['date_created'];
_dateModified = json['date_modified'];
_createdBy = json['created_by'];
_modifiedBy = json['modified_by'];
_status = json['status'];
_airportId = json['airport_id'];
_city = json['city'];
_airportName = json['airport_name'];
_iataCode = json['iata_code'];
_icaoCode = json['icao_code'];
_country = json['country'];
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
_countryName = json['country_name'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this._id;
data['date_created'] = this._dateCreated;
data['date_modified'] = this._dateModified;
data['created_by'] = this._createdBy;
data['modified_by'] = this._modifiedBy;
data['status'] = this._status;
data['airport_id'] = this._airportId;
data['city'] = this._city;
data['airport_name'] = this._airportName;
data['iata_code'] = this._iataCode;
data['icao_code'] = this._icaoCode;
data['country'] = this._country;
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
data['country_name'] = this._countryName;
return data;
}
}
