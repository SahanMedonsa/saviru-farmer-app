import 'package:farmerapplication/Components/Colorpallet.dart';
import 'package:farmerapplication/Pages/Blog.dart';
import 'package:farmerapplication/fertilizer/fertilzer.dart';
import 'package:flutter/material.dart';

class infomationpage extends StatefulWidget {
  const infomationpage({super.key});

  @override
  State<infomationpage> createState() => _ProfilescreenState();
}

final List<String> fileNames = ['File 1', 'File 2'];

class _ProfilescreenState extends State<infomationpage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorPalette.forest_Green.withOpacity(0.2),
        appBar: AppBar(
          title: Text(
            'Informations for Cultivation',
          ),
        ),
        body: DefaultTabController(
          length: 2, // Specify the number of tabs
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints.expand(
                    height: 50), // Optional height constraint for TabBar
                child: TabBar(
                  labelColor: Colors.black,
                  dividerColor: ColorPalette.appBar_color,
                  unselectedLabelColor: ColorPalette.appBar_color,
                  tabs: [
                    Tab(text: 'Blog'),
                    Tab(text: 'Crops'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Contents of Tab 1
                    BlogScreen(),
                    // Contents of Tab 2
                    FertilizerPage()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
