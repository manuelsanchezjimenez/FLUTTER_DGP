import 'dart:ui';
import 'package:video_player/video_player.dart';
import 'package:app_dgp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_metadata/youtube_metadata.dart' as metadata;
import '../components/arrow_button.dart';
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
  int selectedIndex = 1;
  int cont = 0;
  List<String> buttons = ["Pasos", "Video",];
  bool isVisibleVideo = true;
  bool isVisibleText = false;
  metadata.MetaDataModel? metaData;
  List<String> pasos = ["Mojarse las manos", "Echarse jabón", "Frotar las palmas",
                        "Frotar entre los espacios de los dedos", "Frotar el dorso de la mano",
                        "Enjuagarse las manos con agua", "Secarse las manos con una toalla"];


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
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: kPrimaryWhite,
              fontFamily: 'Escolar'
          ),
        ),
      ),
      centerTitle: true,
    );
  }
  @override
  Widget build(BuildContext context) {
   Size size =  MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryWhite,
        appBar: buildAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: size.height*0.025,horizontal: size.width*0.025),
            child: Container(
              width: size.width*0.95,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical:size.height * 0.01),
                        child: Text(
                          widget.name,
                          style:TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryWhite,
                              fontFamily: 'Escolar'
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisibleVideo,
                        child: Container(
                          height: size.width*0.4,
                          width: size.width*0.8,
                          child: YoutubePlayer(
                            controller: _youtubecontroller,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisibleText,
                        child: Container(
                          height: size.width*0.4,
                          width: size.width*0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ArrowButton(
                                  heroTag: "btn_back",
                                  icon: Icons.arrow_back,
                                  onPressed: () {
                                    setState(() {
                                      if(cont == 0){
                                        cont = 0;
                                      }else{
                                        cont--;
                                      }
                                    });
                                  },
                                  tooltip: "Anterior"
                              ),
                              Container(
                                height: size.width*0.4,
                                width: size.width*0.7,
                                decoration: BoxDecoration(
                                    color: kPrimaryLightColor,
                                    border: Border.all(
                                        color: kPrimaryColor,
                                        width: 5,
                                    ),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: size.height*0.08,
                                      alignment: Alignment.center,
                                      child: new Text(
                                          'Paso '+ (cont+1).toString()+': ' +pasos.elementAt(cont),
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Escolar'
                                          ),
                                      ),
                                    ),
                                    Container(
                                      height: size.height*0.5,
                                      child: Image.asset('assets/pasosprovisional/'+(cont+1).toString()+'.png'),
                                    )
                                  ],
                                )
                              ),
                              ArrowButton(
                                  heroTag: "btn_forward",
                                  icon: Icons.arrow_forward,
                                  onPressed: (){
                                    setState(() {
                                      if(cont == pasos.length-1){
                                        cont = pasos.length-1;
                                      }else{
                                        cont++;
                                      }
                                    });
                                  },
                                  tooltip: "Siguiente"
                              ),
                            ],
                          )
                        ),
                      ),
                      Container(
                        height: size.width*0.1,
                        //color: kPrimaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:
                            List.generate(buttons.length, (index) {
                              return SizedBox(
                                width: size.width*0.18,
                                height: size.height*0.1,
                                child: ElevatedButton(
                                    onPressed: (){
                                      setState(() {
                                          selectedIndex = index;
                                          if(selectedIndex == 0 ){
                                            isVisibleVideo = false;
                                            isVisibleText = true;
                                          }
                                          if(selectedIndex == 1 ){
                                            isVisibleVideo = true;
                                            isVisibleText = false;
                                          }
                                      });
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            side:BorderSide(width: 2, color: kPrimaryColor),
                                          )
                                      ),
                                      backgroundColor: selectedIndex == index ?
                                      MaterialStateProperty.all(kPrimaryColor) : MaterialStateProperty.all(Colors.white),
                                    ),
                                    child: Text(
                                        buttons[index].toString(),
                                        style: TextStyle(
                                          fontFamily: 'Escolar',
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: selectedIndex == index ? Colors.white : Colors.black,
                                        ))
                                ),
                              );
                              },
                            ),
                        ),
                      )
                    ]
                )
            )
        )
    );
  }
  
 
}