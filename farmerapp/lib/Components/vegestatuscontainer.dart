import 'package:farmerapp/Components/Gtext.dart';
import 'package:flutter/material.dart';

class StatusContainer extends StatelessWidget {
  final String vege;

  final String yesterdayprice;
  final String imagePath;
  final String todayprice;

  const StatusContainer(
      {Key? key,
      required this.vege,
      required this.yesterdayprice,
      required this.imagePath,
      required this.todayprice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double yesPrice = double.tryParse(yesterdayprice) ?? 0;
    double todayPrice = double.tryParse(todayprice) ?? 0;
    double total = todayPrice - yesPrice;
    String totalDifference;

    if (total < 0) {
      totalDifference = "- Rs.${total.abs().toStringAsFixed(2)}";
    } else {
      totalDifference = "+ Rs."+ total.toStringAsFixed(2);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            SizedBox(
              width: 110,
              child: Gtext(
                text: vege,
                tsize: 16,
                tcolor: Colors.black,
                fweight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 120,
              child: Gtext(
                text: "Rs. $todayPrice",
                tsize: 16,
                tcolor: Colors.black,
                fweight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 100,
              child: Gtext(
                text: totalDifference,
                tsize: 16,
                tcolor: total < 0 ? Colors.green : Colors.red,
                fweight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
