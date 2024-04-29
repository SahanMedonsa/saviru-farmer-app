import 'package:farmerapplication/Components/Colorpallet.dart';
import 'package:flutter/material.dart';

class dailycollection extends StatefulWidget {
  const dailycollection({super.key});

  @override
  State<dailycollection> createState() => _dailycollectionState();
}

class _dailycollectionState extends State<dailycollection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.forest_Green.withOpacity(0.2),
    );
  }
}
