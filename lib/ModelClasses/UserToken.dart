class UserToken {
  String _refresh;
  String _access;
  String _detail;

  UserToken({String refresh, String access, String detail}) {
    this._refresh = refresh;
    this._access = access;
    this._detail = detail;
  }

  String get refresh => _refresh;
  set refresh(String refresh) => _refresh = refresh;
  String get access => _access;
  set access(String access) => _access = access;
  String get detail => _detail;
  set detail(String detail) => _detail = detail;

  UserToken.fromJson(Map<String, dynamic> json) {
    _refresh = json['refresh'];
    _access = json['access'];
    _detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this._refresh;
    data['access'] = this._access;
    data['detail'] = this._detail;
    return data;
  }
}