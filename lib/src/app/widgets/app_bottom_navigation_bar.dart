import 'package:firstapp/src/app/providers/current_page.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

class AppBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentPage = Provider.of<CurrentPage>(context);

    return BottomNavigationBar(
        currentIndex: currentPage.index,
        onTap: (value) => currentPage.index = value,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.change_history,
                size: 32,
              ),
              title: Text("首頁")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 32,
              ),
              title: Text("添加")),
          BottomNavigationBarItem(
              icon: Icon(
                OMIcons.accountCircle,
                size: 32,
              ),
              title: Text("帳戶"))
        ]);
  }
}
