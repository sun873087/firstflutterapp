class LoginModel {
  String? _name;
  String? _password;

  LoginModel() {
    _name = "";
    _password = "";
  }

  String? get Name {
    return _name;
  }

  set Name(String? value) {
    _name = value;
  }

  String? get Password {
    return _password;
  }

  set Password(String? value) {
    _password = value;
  }
}
