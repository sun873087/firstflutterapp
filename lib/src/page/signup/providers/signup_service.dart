import 'dart:convert';

import 'package:firstapp/src/app/models/exception_response_model.dart';
import 'package:firstapp/src/app/models/user_model.dart';
import 'package:firstapp/src/page/signup/models/signup_model.dart';
import 'package:http/http.dart' as http;

class SignupService {  
  Future<UserModel?> signup(SignupModel data) async {
    final response = await http
        .post(Uri.parse("http://localhost:8080/user/person/signup"), body: {
      "name": data.Name,
      "password": data.Password,
    });

    print(response.body);
    print(response.statusCode);

    final responseBody = json.decode(response.body);

    print(responseBody["name"]);

    switch (response.statusCode) {
      case 201:
        final user = UserModel.fromJson(responseBody);
        print("user: ${user.name}");
        break;
      case 400:
        final exceptionResponse = ExceptionResponseModel.fromJson(responseBody);
        print(
            "error message: (${exceptionResponse.statusCode})${exceptionResponse.message}");
        throw ("(${exceptionResponse.statusCode})${exceptionResponse.message}");
      default:
        return UserModel.fromJson(responseBody);
    }
  }
}
