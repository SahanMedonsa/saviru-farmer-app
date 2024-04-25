import 'package:farmerapplication/Components/Colorpallet.dart';
import 'package:flutter/material.dart';

class VegeStatScreen extends StatefulWidget {
  const VegeStatScreen({super.key});

  @override
  State<VegeStatScreen> createState() => _VegeStatScreenState();
}

class _VegeStatScreenState extends State<VegeStatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.forest_Green.withOpacity(0.2),
      appBar: AppBar(
        title: Text('Vegetable Status'),
      ),
    );
  }
}
