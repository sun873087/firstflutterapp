import 'package:firstapp/src/app/models/user_model.dart';
import 'package:firstapp/src/page/login/login.dart';
import 'package:firstapp/src/page/login/providers/auth_service.dart';
import 'package:firstapp/src/page/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late UserModel _currentUser;
  late AuthService _authService;

  @override
  Widget build(BuildContext context) {
    _currentUser = Provider.of<UserModel>(context);
    _authService = Provider.of<AuthService>(context);

    if (_currentUser.name == "") {
      print("還沒有登入");
    } else {
      print("當前登錄用戶：${_currentUser.name}");
    }

    return Scaffold(
      body: Stack(
        children: [
          if (_authService.isLoggedIn) ...[
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _currentUser.name,
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 8,
                ),
                RaisedButton(
                    child: Text(
                      "退出登録",
                      style: TextStyle(color: Colors.white70),
                    ),
                    color: Theme.of(context).primaryColor,
                    splashColor: Colors.white12,
                    elevation: 0.0,
                    onPressed: _authService.logout)
              ],
            ))
          ],
          if (!_authService.isLoggedIn) ...[
            Login(),
          ]
        ],
      ),
    );
  }
}
