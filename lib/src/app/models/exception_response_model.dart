class ExceptionResponseModel {
  late String _statusCode;
  late String _error;
  late String _message;

  ExceptionResponseModel.fromJson(Map<String, dynamic> data)
      : _statusCode = data["statusCode"],
        _error = data["error"],
        _message = data["message"];

  //  get String Name{return _name;}

  String? get statusCode {
    return _statusCode;
  }

  set statusCode(String? value) {
    _statusCode = value!;
  }

  String? get error {
    return _error;
  }

  set error(String? value) {
    _error = value!;
  }

  String? get message {
    return _message;
  }

  set message(String? value) {
    _error = _message;
  }
}
