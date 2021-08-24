import 'dart:async';
import 'dart:convert';

import 'package:firstapp/src/app/models/exception_response_model.dart';
import 'package:firstapp/src/app/models/user_model.dart';
import 'package:firstapp/src/page/login/models/login_model.dart';
import 'package:http/http.dart' as http;

class AuthService {  
  bool isLoggedIn = false;
  StreamController<UserModel> _currentUserController = StreamController();
  Stream<UserModel> get currentUser => _currentUserController.stream;

  void dispose(){
    _currentUserController.close();
  }

  void logout(){
    isLoggedIn=false;
    _currentUserController.sink.add(
      UserModel(name:'guest')
    );
  }

  Future<UserModel?> login(LoginModel data) async {
    final response = await http
        .post(Uri.parse("http://localhost:8080/user/person/login"), body: {
      "name": data.Name,
      "password": data.Password,
    });

    print(response.body);
    print(response.statusCode);

    final responseBody = json.decode(response.body);

    print(responseBody["name"]);

    switch (response.statusCode) {
      case 400:
        final exceptionResponse = ExceptionResponseModel.fromJson(responseBody);
        print(
            "error message: (${exceptionResponse.statusCode})${exceptionResponse.message}");
        throw ("(${exceptionResponse.statusCode})${exceptionResponse.message}");
      default:
        final user = UserModel.fromJson(responseBody);
        _currentUserController.add(user);
        isLoggedIn = true;
        return user;
    }
  }
}
