import 'package:farmerapp/Components/Colorpallet.dart';
import 'package:flutter/material.dart';

class DailyCollection extends StatefulWidget {
  const DailyCollection({super.key});

  @override
  State<DailyCollection> createState() => _incomeState();
}

class _incomeState extends State<DailyCollection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.forest_Green.withOpacity(0.2),
    );
  }
}
