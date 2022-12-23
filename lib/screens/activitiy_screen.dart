import 'dart:ui';
import 'package:app_dgp/models/ActivityImageDbModel.dart';
import 'package:video_player/video_player.dart';
import 'package:app_dgp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_metadata/youtube_metadata.dart' as metadata;
import '../components/arrow_button.dart';
import '../mongodb.dart';

class ActivityScreen extends StatefulWidget{
  String name, link, descripcion;
  final dataImage;
  ActivityScreen({required this.name, required this.link, required this.descripcion, required this.dataImage});
  @override
  _ActivityScreen createState() => _ActivityScreen();
}

class _ActivityScreen extends State<ActivityScreen> {
 // late VideoPlayerController _controller;
  late YoutubePlayerController? _youtubecontroller;
  int selectedIndex = 1;
  int cont = 0;
  List<String> buttons = ["Pasos", "Video"];
  bool isVisibleVideo = true;
  bool isVisibleText = false;
  metadata.MetaDataModel? metaData;
  late List<String> splitted;


  @override
  void initState(){
    super.initState();
    if(widget.link !=''){
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
    splitted = widget.descripcion.split("\n");
    if(ActivityImageDbModel.fromJson(widget.dataImage[cont]).imagen.isNotEmpty){
      print("true");
    }
    if(widget.dataImage == null){
      print("null");
    }
    //print( );
  }

  void dispose() {
    _youtubecontroller!.dispose();
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
                          child: widget.link == '' ? Center(child: new Text("No hay video"),) : YoutubePlayer(controller: _youtubecontroller!)
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
                                height: size.width*0.5,
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
                                      height: size.height*0.15,
                                      //color: Colors.pink,
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: widget.descripcion == '' ? new Text("No hay pasos definidos") : new Text(
                                          'Paso '+(cont+1).toString()+ ': '+ splitted[cont].toString(),
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Escolar'
                                          ),
                                        ),
                                      )
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: size.height*0.43,
                                        //color: Colors.green,
                                        child: ActivityImageDbModel.fromJson(widget.dataImage[0]).imagen == ' ' ?
                                        new Center(child: new Text("No hay imágenes", style: TextStyle(fontSize: 20)),) :
                                        Image.asset('assets/pasosprovisional/'+ActivityImageDbModel.fromJson(widget.dataImage[cont]).imagen),
                                      ),
                                    )
                                  ],
                                )
                              ),
                              ArrowButton(
                                  heroTag: "btn_forward",
                                  icon: Icons.arrow_forward,
                                  onPressed: (){
                                    setState(() {
                                      if(cont == splitted.length-1){
                                        cont = splitted.length-1;
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