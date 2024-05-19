import 'package:farmerapp/Components/Colorpallet.dart';
import 'package:flutter/material.dart';

class income extends StatefulWidget {
  const income({super.key});

  @override
  State<income> createState() => _incomeState();
}

class _incomeState extends State<income> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.forest_Green.withOpacity(0.2),
    );
  }
}
