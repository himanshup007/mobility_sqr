class ModelClass {
  String _name, _location;
  int _formNumber;

  ModelClass(this._name, this._location, this._formNumber);

  int get formNumber => _formNumber;

  set formNumber(int value) {
    _formNumber = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  get location => _location;

  set location(value) {
    _location = value;
  }
}
