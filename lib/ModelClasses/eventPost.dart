class eventPost {
  String _empCode;
  String _fromDate;
  String _toDate;
  String _countryCode;
  String _countryName;
  String _cityCode;
  String _cityName;
  String _activity;

  eventPost(
      {String empCode,
        String fromDate,
        String toDate,
        String countryCode,
        String countryName,
        String cityCode,
        String cityName,
        String activity}) {
    this._empCode = empCode;
    this._fromDate = fromDate;
    this._toDate = toDate;
    this._countryCode = countryCode;
    this._countryName = countryName;
    this._cityCode = cityCode;
    this._cityName = cityName;
    this._activity = activity;
  }

  String get empCode => _empCode;
  set empCode(String empCode) => _empCode = empCode;
  String get fromDate => _fromDate;
  set fromDate(String fromDate) => _fromDate = fromDate;
  String get toDate => _toDate;
  set toDate(String toDate) => _toDate = toDate;
  String get countryCode => _countryCode;
  set countryCode(String countryCode) => _countryCode = countryCode;
  String get countryName => _countryName;
  set countryName(String countryName) => _countryName = countryName;
  String get cityCode => _cityCode;
  set cityCode(String cityCode) => _cityCode = cityCode;
  String get cityName => _cityName;
  set cityName(String cityName) => _cityName = cityName;
  String get activity => _activity;
  set activity(String activity) => _activity = activity;

  eventPost.fromJson(Map<String, dynamic> json) {
    _empCode = json['emp_code'];
    _fromDate = json['from_date'];
    _toDate = json['to_date'];
    _countryCode = json['country_code'];
    _countryName = json['country_name'];
    _cityCode = json['city_code'];
    _cityName = json['city_name'];
    _activity = json['activity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_code'] = this._empCode;
    data['from_date'] = this._fromDate;
    data['to_date'] = this._toDate;
    data['country_code'] = this._countryCode;
    data['country_name'] = this._countryName;
    data['city_code'] = this._cityCode;
    data['city_name'] = this._cityName;
    data['activity'] = this._activity;
    return data;
  }
}