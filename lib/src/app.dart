import 'package:firstapp/src/app/models/user_model.dart';
import 'package:firstapp/src/page/login/providers/auth_service.dart';
import 'package:firstapp/src/Page/profile/profile.dart';
import 'package:firstapp/src/app/providers/current_page.dart';
import 'package:firstapp/src/app/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/add/add.dart';
import 'page/home/home.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
 
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {   
    return MaterialApp(
        title: 'w.store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.black,
            accentColor: Colors.black87,
            appBarTheme: AppBarTheme(
                elevation: 0.0,
                color: Colors.white,
                brightness: Brightness.light,
                textTheme: TextTheme(
                    title: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500)))),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => CurrentPage()),
            Provider<AuthService>(create: (context)=>authService),
            StreamProvider<UserModel>(create: (context)=> authService.currentUser, initialData: UserModel.fromJson({ "name":"","password":"" }))
          ],
          child: Scaffold(
            body: Consumer<CurrentPage>(
              builder: (context, currentPage, child) => IndexedStack(
                index: currentPage.index,
                children: [Home(), Add(), Profile()],
              ),
            ),
            bottomNavigationBar: AppBottomNavigationBar(),
          ),
        ));
  }
}
