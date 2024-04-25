import 'package:farmerapplication/Components/Colorpallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      home: const Scaffold(
        backgroundColor: ColorPalette.appBar_color,
        body: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
