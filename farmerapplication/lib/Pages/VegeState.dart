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
      appBar: AppBar(
        title: Text('Vegetable Status'),
      ),
    );
  }
}
