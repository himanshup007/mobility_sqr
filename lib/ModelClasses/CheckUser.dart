class CheckUser {
  String _massage;
  bool _status;
  int _isUser;

  CheckUser({String massage, bool status, int isUser}) {
    this._massage = massage;
    this._status = status;
    this._isUser = isUser;
  }

  String get massage => _massage;
  set massage(String massage) => _massage = massage;
  bool get status => _status;
  set status(bool status) => _status = status;
  int get isUser => _isUser;
  set isUser(int isUser) => _isUser = isUser;

  CheckUser.fromJson(Map<String, dynamic> json) {
    _massage = json['massage'];
    _status = json['status'];
    _isUser = json['isUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this._massage;
    data['status'] = this._status;
    data['isUser'] = this._isUser;
    return data;
  }
}