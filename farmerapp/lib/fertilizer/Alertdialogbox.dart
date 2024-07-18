import 'package:farmerapp/Components/Colorpallet.dart';
import 'package:farmerapp/Tab%20view/detailstext.dart';
import 'package:flutter/material.dart';

class vegedetail extends StatefulWidget {
  const vegedetail({Key? key}) : super(key: key);

  @override
  State<vegedetail> createState() => _vegedetailState();
}

class _vegedetailState extends State<vegedetail> {
  // final videoURL = "https://youtu.be/jC_4lnSO-m0?si=e56J6NqQ60Fp5_dW";
  // late YoutubePlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   final videoID = YoutubePlayer.convertUrlToId(videoURL);
  //   _controller = YoutubePlayerController(
  //     initialVideoId: videoID.toString(),
  //     flags: YoutubePlayerFlags(autoPlay: false),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.forest_Green.withOpacity(0.2),
      appBar: AppBar(
        title: Text('Carrot ( කැරට් / கேரட் )'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 15, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // YoutubePlayer(
              //   controller: _controller,
              //   showVideoProgressIndicator: true,
              // ),
              SizedBox(
                height: 15,
              ),
              detailtext(detail: 'එළවළු වර්ගය', db_datil: ''),
              detailtext(detail: 'බීජ වර්ග', db_datil: ''),
              detailtext(detail: 'වගා කරන ප්‍රදේශ', db_datil: ''),
              detailtext(detail: 'වගා කරන කාලය', db_datil: ''),
              detailtext(detail: 'පලදාව ලැබීමට ගතවන කාලය', db_datil: ''),
              detailtext(detail: 'පොහොර වර්ග', db_datil: ''),
              detailtext(detail: 'පොහොර ප්‍රමාණය', db_datil: ''),
              detailtext(detail: 'කෘමිනාශක වර්ග', db_datil: ''),
              detailtext(detail: 'වගාකරන අකාරය', db_datil: ''),
              detailtext(detail: 'කාලගුණික තත්වය', db_datil: ''),
            ],
          ),
        ),
      ),
    );
  }
}
