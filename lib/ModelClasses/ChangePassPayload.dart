class ChangePassPayload {
  String _email;
  String _password;
  String _istemporary;
  String _oldPassword;

  ChangePassPayload(
      {String email, String password, String istemporary, String oldPassword}) {
    this._email = email;
    this._password = password;
    this._istemporary = istemporary;
    this._oldPassword = oldPassword;
  }

  String get email => _email;
  set email(String email) => _email = email;
  String get password => _password;
  set password(String password) => _password = password;
  String get istemporary => _istemporary;
  set istemporary(String istemporary) => _istemporary = istemporary;
  String get oldPassword => _oldPassword;
  set oldPassword(String oldPassword) => _oldPassword = oldPassword;

  ChangePassPayload.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _password = json['password'];
    _istemporary = json['istemporary'];
    _oldPassword = json['old_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['password'] = this._password;
    data['istemporary'] = this._istemporary;
    data['old_password'] = this._oldPassword;
    return data;
  }
}