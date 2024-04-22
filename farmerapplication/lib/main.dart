import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapplication/Components/Colorpallet.dart';
import 'package:farmerapplication/Components/NavigationBar.dart';
import 'package:farmerapplication/Pages/Blog.dart';
import 'package:farmerapplication/Pages/Home.dart';
import 'package:farmerapplication/Pages/Profile.dart';
import 'package:farmerapplication/Pages/VegeState.dart';
import 'package:farmerapplication/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    VegeStatScreen(),
    BlogScreen(),
    Profilescreen()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: ColorPalette.forest_Green,
              iconTheme: IconThemeData(color: Colors.white))),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: _currentIndex, onTap: _onTabTapped),
      ),
    );
  }
}
