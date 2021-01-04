class showHide {
  bool _hide; // normal field (getter/setter)
  String _name; // name field (getter/setter)

  set hide(bool value) {
    _hide = value;
  }

  bool get hide => _hide;

  set name(String value) {
    _name = value;
  }

  String get name => _name;
}
