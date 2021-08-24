import 'package:firstapp/src/app/widgets/app_logo.dart';
import 'package:firstapp/src/page/login/widgets/login_form.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(        
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            children: [
              AppLogo(type: LogoType.login,),
              LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}