import 'dart:ui';
import 'package:video_player/video_player.dart';
import 'package:app_dgp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:youtube_metadata/youtube_metadata.dart' as metadata;

import '../mongodb.dart';

class ActivityScreen extends StatefulWidget{
  String name, link;
  ActivityScreen({required this.name, required this.link});
  @override
  _ActivityScreen createState() => _ActivityScreen();
}

class _ActivityScreen extends State<ActivityScreen> {
 // late VideoPlayerController _controller;
  late YoutubePlayerController _youtubecontroller;

  metadata.MetaDataModel? metaData;
  @override
  void initState(){
    super.initState();
    String url = widget.link;
    _youtubecontroller = YoutubePlayerController(
        initialVideoId:YoutubePlayer.convertUrlToId(url)!,
            flags: const YoutubePlayerFlags(
              mute: false,
              loop: false,
              autoPlay: false
       )
    );
  }

  void dispose() {
    _youtubecontroller.dispose();
    super.dispose();
  }

  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading:
      Transform.scale(
          scale: 2.5,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryWhite,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
      ),
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          widget.name,
          style: GoogleFonts.lexend(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: kPrimaryWhite,
          ),
        ),
      ),
      centerTitle: true,
      bottom: TabBar(
        labelStyle: GoogleFonts.lexend(
          fontSize: 25,
          fontWeight: FontWeight.normal,
        ),
        labelColor: kPrimaryColor,
        unselectedLabelColor: kPrimaryLightColor,
        indicatorSize: TabBarIndicatorSize.label,
        onTap: (value){
          //print(_controller.value);
          //print(_youtubecontroller.metadata.title.toString());
        },
        indicator:BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)),
            color: kPrimaryWhite
        ),
        tabs: [
          Tab(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("VÍDEO"),
                  ),
                  Transform.scale(
                      scale: 2,
                      child:Icon(Icons.play_circle_outline)
                  )
                ],
              ),
            ),
          ),
          Tab(
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("PASOS"),
                    ),
                    Transform.scale(
                        scale: 2,
                        child:Icon(Icons.image)
                    )
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) =>DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kPrimaryWhite,
        appBar: buildAppBar(),
        body: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.8,
                    child:Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.02),
                          child: Text(
                            widget.name,
                            style: GoogleFonts.lexend(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                          Expanded(
                            child:YoutubePlayer(
                              controller: _youtubecontroller,
                            ),
                          )

                        ]
            )
         )
        )
      ),
  );


}