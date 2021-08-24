import 'package:firstapp/src/page/login/models/login_model.dart';
import 'package:firstapp/src/page/login/providers/auth_service.dart';
import 'package:firstapp/src/page/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  LoginModel _formData = LoginModel();
  bool _autovalidate = false;
  late AuthService _authService;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Name: ${_formData.Name}");
      print("Password: ${_formData.Password}");
      _authService.login(_formData);
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String? _validateName(String? value) {
    if (value!.isEmpty) {
      return "請輸入用戶名。";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return "請輸入用戶密碼。";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    _authService = Provider.of<AuthService>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: '用戶名', hintText: '輸入登錄用戶名', helperText: ''),
            onSaved: (String? value) {
              _formData.Name = value;
            },
            //autovalidateMode: AutovalidateMode(),
            autovalidate: _autovalidate,
            validator: _validateName,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: '用戶密碼', hintText: '輸入登錄用戶密碼', helperText: ''),
            onSaved: (String? value) {
              _formData.Password = value;
            },
            obscureText: true,
            autovalidate: _autovalidate,
            validator: _validatePassword,
          ),
          Container(
            padding: EdgeInsets.only(top: 32.0),
            width: double.infinity,
            child: RaisedButton(
              child: Text(
                "登錄",
                style: TextStyle(color: Colors.white70, fontSize: 18.0),
              ),
              onPressed: _submitForm,
              color: Theme.of(context).primaryColor,
              splashColor: Colors.white12,
              padding: EdgeInsets.all(16.0),
              elevation: 0.0,
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              child: Text(
                "註冊新帳號",
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
              },
              padding: EdgeInsets.all(12.0),
            ),
          )
        ],
      ),
    );
  }
}
