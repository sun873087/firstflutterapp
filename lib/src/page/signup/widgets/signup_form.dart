import 'package:firstapp/src/page/signup/models/signup_model.dart';
import 'package:firstapp/src/page/signup/providers/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  SignupModel _formData = SignupModel();
  bool _autovalidate = false;
  late SignupService _signupService;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Name: ${_formData.Name}");
      print("Password: ${_formData.Password}");

      try {
        final user = await _signupService.signup(_formData);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("成功註冊用戶")));
      } catch (error) {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
      }
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  String? _validateName(String? value) {
    if (value!.isEmpty) {
      return "請輸入註冊用戶名。";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return "請輸入註冊用戶密碼。";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _signupService = Provider.of<SignupService>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                labelText: '用戶名',
                hintText: '輸入註冊用戶名',
                helperText: '',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white30)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white))),
            onSaved: (String? value) {
              _formData.Name = value;
            },
            //autovalidateMode: AutovalidateMode(),
            autovalidate: _autovalidate,
            validator: _validateName,
          ),
          TextFormField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                labelText: '用戶密碼',
                hintText: '輸入註冊用戶密碼',
                helperText: '',
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white30),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white))),
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
                "註冊新用戶",
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
                "已有帳號，點擊登錄",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.all(12.0),
            ),
          )
        ],
      ),
    );
  }
}
