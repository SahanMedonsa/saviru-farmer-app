import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.green,
      backgroundColor: Colors.blue,
      selectedIconTheme: IconThemeData(color: Colors.green),
      unselectedIconTheme: IconThemeData(color: Colors.black),
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.plantWilt),
          label: 'Vege Status',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: 'Blog',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
