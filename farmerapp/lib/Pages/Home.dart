import 'package:farmerapp/Components/Colorpallet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorPalette.forest_Green.withOpacity(0.2),
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10 ,bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "S A V I R U",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "ගොවියාගෙ හිත මිතු​රා",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              CarouselSlider(
                items: [
                  'assets/1.jpeg',
                  'assets/2.jpeg',
                  'assets/3.jpeg',
                  'assets/4.jpeg',
                ].map((String imagePath) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 250.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Daily Blogs",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: Width,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorPalette.forest_Green.withOpacity(0.2)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Farming",
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  (context).goNamed("Info");
                                },
                                icon: Icon(Icons.read_more),
                                label: Text('Read more'))
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Farming is a fundamental practice that involves cultivating land, raising crops, and rearing livestock for food, fiber, and other essential resources. It plays a crucial role in providing sustenance and livelihoods to communities around the world. Farming practices vary widely based on geography, climate, and cultural traditions.",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Vision & Mission",
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Our project aims to uplift the living conditions of farmers in Sri Lanka by establishing a system that empowers them to sell their cultivated vegetables at controlled prices, ensuring fairness and stability in agricultural trade. Simultaneously, we seek to enable customers to access these vegetables at subsidized prices, mitigating price fluctuations and promoting affordability. By fostering a transparent and equitable marketplace, our initiative contributes to enhancing Sri Lanka's agricultural sector, promoting economic development, food security, and sustainability while supporting the livelihoods of farmers and improving access to nutritious produce for consumers.",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
