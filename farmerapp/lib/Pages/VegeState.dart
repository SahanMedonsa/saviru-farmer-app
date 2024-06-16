import 'package:farmerapp/Components/Colorpallet.dart';
import 'package:farmerapp/Components/Gtext.dart';
import 'package:farmerapp/vegestatus/cabbagestatus.dart';
import 'package:farmerapp/vegestatus/capcicum.dart';
import 'package:farmerapp/vegestatus/carrot.dart';
import 'package:farmerapp/vegestatus/potato.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VegeStatScreen extends StatefulWidget {
  final Map data;

  const VegeStatScreen({Key? key, required this.data}) : super(key: key);

  @override
  _VegeStatScreenState createState() => _VegeStatScreenState();
}

class _VegeStatScreenState extends State<VegeStatScreen> {
  @override
  Widget build(BuildContext context) {
    // Get today's date
    String todayDate = DateFormat('yMMMMd').format(DateTime.now());

    return Scaffold(
      backgroundColor: ColorPalette.forest_Green.withOpacity(0.2),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gtext(
                text: "Vege Status",
                tsize: 20,
                tcolor: Colors.black,
                fweight: FontWeight.w500),
            Gtext(
                text: todayDate,
                tsize: 16,
                tcolor: Colors.black,
                fweight: FontWeight.w400),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gtext(
                text: "Today best price",
                tsize: 18,
                tcolor: Colors.black,
                fweight: FontWeight.w500),
            SizedBox(
              height: 30,
            ),
            carrotStatus(),
            cabbagestatus(),
            capcicumStatus(),
            potatostatus()
          ],
        ),
      ),
    );
  }
}
