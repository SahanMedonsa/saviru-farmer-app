import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapplication/Components/Colorpallet.dart';
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
        body: Column(children: [
          TextField(
            controller: cropname,
          ),
          ElevatedButton(
            onPressed: () {
              Map<String, String> collectionadd = {'crop name': cropname.text};
              _referenceBlog.add(collectionadd);
            },
            child: Text('Add Entry'),
          ),
        ]));
  }
}
