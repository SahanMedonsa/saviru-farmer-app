import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapp/Components/Colorpallet.dart';
import 'package:farmerapp/Components/app_navigation.dart';
import 'package:farmerapp/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  //widget buinding
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: ColorPalette.forest_Green,
              iconTheme: IconThemeData(color: Colors.white)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.amber,
              selectedIconTheme:
                  IconThemeData(color: ColorPalette.appBar_color),
              unselectedIconTheme:
                  IconThemeData(color: ColorPalette.Jungle_Green))),
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigation.router,
      // home: Scaffold(
      //   body: _screens[_currentIndex],
      //   bottomNavigationBar: CustomBottomNavigationBar(
      //       currentIndex: _currentIndex, onTap: _onTabTapped),
      // ),
    );
  }
}
