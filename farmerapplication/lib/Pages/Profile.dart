import 'package:farmerapplication/Components/Colorpallet.dart';
import 'package:flutter/material.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.forest_Green.withOpacity(0.2),
      appBar: AppBar(
        title: Text(
          'My Profile',
        ),
      ),
    );
  }
}
