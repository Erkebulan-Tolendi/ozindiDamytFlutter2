import 'package:flutter/material.dart';
import 'package:ozindi_damyt/constants/app_color.dart';
import 'package:ozindi_damyt/features/bottom_nav_bar/home_page/home_page.dart';
import 'package:ozindi_damyt/features/bottom_nav_bar/my_book_page/my_book_page.dart';
import 'package:ozindi_damyt/features/bottom_nav_bar/quiz_page/quiz_page.dart';
import 'package:ozindi_damyt/features/bottom_nav_bar/sport_page/sport_page.dart';

import '../../features/bottom_nav_bar/calendar_page/calendar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 2;

  final List<Widget> _screens = [
    MarathonePage(),
    MyBookPage(),
    HomePage(),
    SportPage(),
    QuizzPageBot(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.checklist_rtl_sharp,
                color: _selectedIndex == 0 ? AppColor.red : AppColor.grey,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.collections_bookmark,
                color: _selectedIndex == 1 ? AppColor.red : AppColor.grey,
              ),
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Icon(
                Icons.home_rounded,
                color: _selectedIndex == 2 ? AppColor.red : AppColor.grey,
              ),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(
                Icons.sports_handball_rounded,
                color: _selectedIndex == 3 ? AppColor.red : AppColor.grey,
              ),
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              icon: Icon(
                Icons.quiz_outlined,
                color: _selectedIndex == 4 ? AppColor.red : AppColor.grey,
              ),
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
