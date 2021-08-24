import 'package:firstapp/src/app/widgets/app_logo.dart';
import 'package:firstapp/src/page/signup/providers/signup_service.dart';
import 'package:firstapp/src/page/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Provider(
      create: (context) => SignupService(),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black, BlendMode.dstATop))),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(40.0),
              child: Column(
                children: [
                  AppLogo(
                    type: LogoType.signup,
                  ),
                  SignupForm()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
