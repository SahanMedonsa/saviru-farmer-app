import 'package:farmerapplication/Components/Colorpallet.dart';
import 'package:farmerapplication/Tab%20view/Income.dart';
import 'package:farmerapplication/Tab%20view/collection.dart';
import 'package:farmerapplication/Tab%20view/farmerpersonaldetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

final List<String> fileNames = ['File 1', 'File 2', 'File 3'];

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorPalette.forest_Green.withOpacity(0.2),
        appBar: AppBar(
          title: Text(
            'Profile',
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: signOut, icon: Icon(Icons.logout_outlined))
          ],
        ),
        body: DefaultTabController(
          length: 3, // Specify the number of tabs
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints.expand(
                    height: 50), // Optional height constraint for TabBar
                child: TabBar(
                  labelColor: Colors.black,
                  dividerColor: ColorPalette.appBar_color,
                  unselectedLabelColor: ColorPalette.appBar_color,
                  tabs: [
                    Tab(text: 'Income'),
                    Tab(text: 'Collection'),
                    Tab(text: 'Profile'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Contents of Tab 1
                    income(),
                    // Contents of Tab 2
                    DailyCollection(),
                    // Contents of Tab 3
                    FarmerPersonalDetails()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      context.goNamed("Login");
      print("User signed out successfully");
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
