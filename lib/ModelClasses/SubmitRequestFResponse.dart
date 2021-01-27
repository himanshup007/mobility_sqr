class SubmitRequestFResponse {
  String _massageCode;
  String _massage;
  bool _status;

  SubmitRequestFResponse({String massageCode, String massage, bool status}) {
    this._massageCode = massageCode;
    this._massage = massage;
    this._status = status;
  }

  String get massageCode => _massageCode;
  set massageCode(String massageCode) => _massageCode = massageCode;
  String get massage => _massage;
  set massage(String massage) => _massage = massage;
  bool get status => _status;
  set status(bool status) => _status = status;

  SubmitRequestFResponse.fromJson(Map<String, dynamic> json) {
    _massageCode = json['massage code'];
    _massage = json['massage'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage code'] = this._massageCode;
    data['massage'] = this._massage;
    data['status'] = this._status;
    return data;
  }
}