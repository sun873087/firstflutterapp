
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  // const AppLogo({Key? key}) : super(key: key);

  final LogoType type;
  AppLogo({required this.type});

  @override
  Widget build(BuildContext context) {
    final logoType = type.index == 0 ? "login" : "signup";

    return Padding(
        padding: EdgeInsets.all(64.0),
        child: Image.asset('assets/images/$logoType.jpeg'));
  }
}

enum LogoType{
  login,
  signup 
}