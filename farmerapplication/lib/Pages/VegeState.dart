import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapplication/Components/Colorpallet.dart';
import 'package:farmerapplication/Components/Gtext.dart';
import 'package:flutter/material.dart';

class VegeStatScreen extends StatefulWidget {
  final Map data;

  const VegeStatScreen({Key? key, required this.data}) : super(key: key);

  @override
  _VegeStatScreenState createState() => _VegeStatScreenState();
}

class _VegeStatScreenState extends State<VegeStatScreen> {
  late DocumentReference _documentReference;
  late CollectionReference _referenceBlog;

  @override
  void initState() {
    super.initState();
    _documentReference =
        FirebaseFirestore.instance.collection('Blog').doc(widget.data['id']);
    _referenceBlog = _documentReference.collection('dailyCollection');
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController cropname = TextEditingController();
    return Scaffold(
        backgroundColor: ColorPalette.forest_Green.withOpacity(0.2),
        appBar: AppBar(
          title: Text('Vegetable Status'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Container(
                height: 60,
                decoration: BoxDecoration(
                    color: ColorPalette.forest_Green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Gtext(
                        text: 'Vegetable',
                        tsize: 18,
                        tcolor: Colors.black,
                        fweight: FontWeight.w600),
                    Gtext(
                        text: 'Yesterday',
                        tsize: 18,
                        tcolor: Colors.black,
                        fweight: FontWeight.w500),
                    Gtext(
                        text: 'Today',
                        tsize: 18,
                        tcolor: Colors.black,
                        fweight: FontWeight.w600),
                    Icon(Icons.arrow_circle_down)
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 60,
                decoration: BoxDecoration(
                    color: ColorPalette.forest_Green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Gtext(
                        text: 'Carrote',
                        tsize: 20,
                        tcolor: Colors.black,
                        fweight: FontWeight.w600),
                    Gtext(
                        text: '130.00',
                        tsize: 18,
                        tcolor: Colors.black,
                        fweight: FontWeight.w500),
                    Gtext(
                        text: '128.00',
                        tsize: 18,
                        tcolor: Colors.black,
                        fweight: FontWeight.w600),
                    Icon(Icons.arrow_circle_down)
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 60,
                decoration: BoxDecoration(
                    color: ColorPalette.forest_Green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Gtext(
                        text: 'Cabbage',
                        tsize: 20,
                        tcolor: Colors.black,
                        fweight: FontWeight.w600),
                    Gtext(
                        text: '120.00',
                        tsize: 18,
                        tcolor: Colors.black,
                        fweight: FontWeight.w500),
                    Gtext(
                        text: '145.00',
                        tsize: 18,
                        tcolor: Colors.black,
                        fweight: FontWeight.w600),
                    Icon(Icons.arrow_circle_up)
                  ],
                ))
          ]),
        ));
  }
}
