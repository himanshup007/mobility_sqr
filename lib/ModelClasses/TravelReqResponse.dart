class TravelReqResponseModel {
  String _massageCode;
  String _massage;
  bool _status;
  List<String> _data;

  TravelReqResponseModel(
      {String massageCode, String massage, bool status, List<String> data}) {
    this._massageCode = massageCode;
    this._massage = massage;
    this._status = status;
    this._data = data;
  }

  String get massageCode => _massageCode;
  set massageCode(String massageCode) => _massageCode = massageCode;
  String get massage => _massage;
  set massage(String massage) => _massage = massage;
  bool get status => _status;
  set status(bool status) => _status = status;
  List<String> get data => _data;
  set data(List<String> data) => _data = data;

  TravelReqResponseModel.fromJson(Map<String, dynamic> json) {
    _massageCode = json['massage code'];
    _massage = json['massage'];
    _status = json['status'];
    _data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage code'] = this._massageCode;
    data['massage'] = this._massage;
    data['status'] = this._status;
    data['data'] = this._data;
    return data;
  }
}
