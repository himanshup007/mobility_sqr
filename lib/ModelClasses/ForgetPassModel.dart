class ForgetPassModel {
  String _massage;
  bool _status;
  String _code;

  ForgetPassModel({String massage, bool status, String code}) {
    this._massage = massage;
    this._status = status;
    this._code = code;
  }

  String get massage => _massage;
  set massage(String massage) => _massage = massage;
  bool get status => _status;
  set status(bool status) => _status = status;
  String get code => _code;
  set code(String code) => _code = code;

  ForgetPassModel.fromJson(Map<String, dynamic> json) {
    _massage = json['massage'];
    _status = json['status'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this._massage;
    data['status'] = this._status;
    data['code'] = this._code;
    return data;
  }
}