import 'package:farmerapp/Components/Gtext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FertilizerPage extends StatelessWidget {
  const FertilizerPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 12, right: 12),
      child: Column(
        children: [
          const Gtext(
            text: 'Crop ( බෝ​ග / பயிர் )',
            tsize: 22,
            tcolor: Colors.black,
            fweight: FontWeight.w600,
          ),
          //
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: GestureDetector(
              onTap: () {
                context.goNamed("vegedetails");
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gtext(
                        text: 'Carrot',
                        tsize: 18,
                        tcolor: Colors.black,
                        fweight: FontWeight.w600,
                      ),
                      Gtext(
                        text: '( කැර​ට් / கேரட் )',
                        tsize: 18,
                        tcolor: Colors.black,
                        fweight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
