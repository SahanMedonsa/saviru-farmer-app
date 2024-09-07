import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmerapp/Components/Colorpallet.dart';
import 'package:farmerapp/Components/Gtext.dart';
import 'package:farmerapp/Components/vegestatuscontainer.dart';
import 'package:farmerapp/Models/Vegestatusmodel.dart';
import 'package:farmerapp/Services/vegestatus_service.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VegeStatScreen extends StatefulWidget {
  final Map data;

  const VegeStatScreen({Key? key, required this.data}) : super(key: key);

  @override
  _VegeStatScreenState createState() => _VegeStatScreenState();
}

final VegestatusDatabaseService _vegedatabaseServices =
    VegestatusDatabaseService();

 final DateTime today = DateTime.now();
  late DateTime yesterday;

 
class _VegeStatScreenState extends State<VegeStatScreen> {
  @override
   
  Widget build(BuildContext context) {
    // Get today's date
    String todayDate = DateFormat('yMMMMd').format(DateTime.now());

    // Calculate yesterday's date
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(Duration(days: 1));

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
              // Gtext(
              //     text: "Today best price",
              //     tsize: 18,
              //     tcolor: Colors.black,
              //     fweight: FontWeight.w500),
              SizedBox(
                height: 15,
              ),
              Expanded(
                // This is key to give the StreamBuilder's ListView.builder space to expand
                child: StreamBuilder<QuerySnapshot<VegetableStatus>>(
                  stream: _vegedatabaseServices.getVege(),
                 builder: (context, todaySnapshot) {
                  if (todaySnapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (todaySnapshot.hasError) {
                    return Center(child: Text('Error: ${todaySnapshot.error}'));
                  }

                  return StreamBuilder<QuerySnapshot<VegetableStatus>>(
                    stream: _vegedatabaseServices.getVegeByDate(yesterday),
                    builder: (context, yesterdaySnapshot) {
                      if (yesterdaySnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (yesterdaySnapshot.hasError) {
                        return Center(
                            child:
                                Text('Error: ${yesterdaySnapshot.error}'));
                      }

                      List<QueryDocumentSnapshot<VegetableStatus>> todayData =
                          todaySnapshot.data?.docs ?? [];
                      List<QueryDocumentSnapshot<VegetableStatus>>
                          yesterdayData = yesterdaySnapshot.data?.docs ?? [];

                      if (todayData.isEmpty) {
                        return Center(child: Text('No data for today'));
                      }

                      // Assuming only one document per date
                      VegetableStatus todayStatus = todayData.first.data();
                      VegetableStatus? yesterdayStatus =
                          yesterdayData.isNotEmpty
                              ? yesterdayData.first.data()
                              : null;

                    return ListView.builder(
                      shrinkWrap:
                          true, // Ensure this ListView takes only the needed space
                      itemCount: todayData.length,
                      itemBuilder: (context, index) {
                        VegetableStatus vegetableStatus = todayData[index].data();
                        String vegeID = todayData[index].id;
                        return Card(
                          child: ExpansionTile(
                              initiallyExpanded: index == 0,
                            title: Container(
                              width: 120,
                              child: Text("Daily price - "+DateFormat("dd-MM-yyyy")
                                  .format(vegetableStatus.date.toDate())),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StatusContainer(
                                        vege: "Carrot",
                                        yesterdayprice: yesterdayStatus != null
                                            ? "${yesterdayStatus.carrot}"
                                            : "N/A",
                                        imagePath: "assets/carrot.jpeg",
                                        todayprice:
                                            "${vegetableStatus.carrot}"),
                                    StatusContainer(
                                        vege: "Cabbage",
                                         yesterdayprice: yesterdayStatus != null
                                            ? "${yesterdayStatus.cabbage}"
                                            : "N/A",
                                        imagePath: "assets/cabbage.jpeg",
                                        todayprice:
                                            "${vegetableStatus.cabbage}"),
                                            StatusContainer(
                                        vege: "Brinjal",
                                        yesterdayprice: yesterdayStatus != null
                                            ? "${yesterdayStatus.brinjal}"
                                            : "N/A",
                                        imagePath: "assets/Eggplan.jpeg",
                                        todayprice:
                                            "${vegetableStatus.brinjal}"),
                                    StatusContainer(
                                        vege: "Potato",
                                         yesterdayprice: yesterdayStatus != null
                                            ? "${yesterdayStatus.potato}"
                                            : "N/A",
                                        imagePath: "assets/potato.jpeg",
                                        todayprice:
                                            "${vegetableStatus.potato}"),
                                    StatusContainer(
                                        vege: "Capcicum",
                                        yesterdayprice: yesterdayStatus != null
                                            ? "${yesterdayStatus.capsicum}"
                                            : "N/A",
                                        imagePath: "assets/capcicum.jpeg",
                                        todayprice:
                                            "${vegetableStatus.capsicum}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  );
                 }
          ))],
          ),
        ));
  }
}
