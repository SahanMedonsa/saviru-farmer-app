import 'package:farmerapplication/Components/Colorpallet.dart';
import 'package:flutter/material.dart';
import 'package:farmerapplication/Pages/Blog.dart';
import 'package:farmerapplication/Pages/VegeState.dart';
import 'package:farmerapplication/Signup/Login/login.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key, required this.navigationShell})
      : super(
          key: key,
        );

  final StatefulNavigationShell navigationShell;
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    VegeStatScreen(
      data: {},
    ),
    BlogScreen(),
    LoginPage(),
  ];

  int selectedIndex = 0;

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.green.shade100,
        selectedIndex: selectedIndex,
        onButtonPressed: (int index) {
          setState(() {
            selectedIndex = index;
          });
          _goToBranch(selectedIndex);
        },
        inactiveColor: ColorPalette.appBar_color,
        activeColor: ColorPalette.appBar_color,
        iconSize: 30,
        barItems: [
          BarItem(
            icon: Icons.home,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.local_florist,
            title: 'Status',
          ),
          BarItem(
            icon: Icons.newspaper,
            title: 'Information',
          ),
          BarItem(
            icon: Icons.person,
            title: 'Profile',
          ),
        ],
      ),
    );
  }
}
