import 'dart:ui';
import 'package:app_dgp/components/arrow_button.dart';
import 'package:app_dgp/constants.dart';
import 'package:app_dgp/models/ActivityDbModel.dart';
import 'package:app_dgp/models/UserDbModel.dart';
import 'package:app_dgp/screens/activitiy_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/ActivityImageDbModel.dart';
import '../mongodb.dart';
import 'activitiy_picto_screen.dart';

class ActivitiesPictoMenuScreen extends StatefulWidget{
  ActivitiesPictoMenuScreen();
  @override
  _ActivitiesPictoMenu createState() => _ActivitiesPictoMenu();
}

class _ActivitiesPictoMenu extends State<ActivitiesPictoMenuScreen> {
  late int cont;
  final int limit_list= 3;
  late int limit = limit_list;

  void initState(){
    setState(() {
      cont=0;
    });
    //await MongoDatabase.getActivityData();
  }
  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: Transform.scale(
          scale: 2.5,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )
      ),
      title: Text(
        "Actividades",
        style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: kPrimaryWhite,
            fontFamily: 'Escolar'
        ),
      ),
      centerTitle: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        appBar: buildAppBar(),
        body: Center(
          child:Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: size.width*0.9,
                height: size.height*0.81,
                child: buildList(kPrimaryColor,cont),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArrowButton(
                      heroTag: "btn_back",
                      icon: Icons.arrow_back,
                      onPressed: () async{
                        cont = 0;
                        int length = await MongoDatabase.getDataActivityLength();
                        if(length > limit_list) {
                          setState(() {
                            cont -= 3;
                            length += 3;
                            if(cont == -3){
                              cont = 0;
                            }
                          });
                          if(length > limit_list){
                            setState(() {
                              limit=limit_list;
                            });
                          }
                        }
                      },
                      tooltip: "Anterior"
                  ),
                  ArrowButton(
                      heroTag: "btn_forward",
                      icon: Icons.arrow_forward,
                      onPressed: () async{
                        cont = 0;
                        int length = await MongoDatabase.getDataActivityLength();
                        if(length > limit_list) {
                          setState(() {
                            cont += 3;
                            length-= 3;
                          });
                          if(length < limit_list){
                            setState(() {
                              limit=length;
                            });
                          }
                        }
                      },
                      tooltip: "Siguiente"
                  )
                ],
              )
            ],
          ),
        )
    );
  }

  Widget buildList(Color color, int cont){
    //limit = limit_grid;
    //limit = limit_list;
    Size size = MediaQuery.of(context).size;
    return Container(
        child: FutureBuilder(
          future: MongoDatabase.getActivityData(),
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else{
              if(snapshot.hasData){
                if(snapshot.data.length < limit){
                  limit = snapshot.data.length;
                  cont = 0;
                }
                return Padding(padding: EdgeInsets.only(top: 25),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:limit,
                        itemBuilder: (context, index){
                          return displayData(
                              ActivityDbModel.fromJson(snapshot.data[index+cont]),
                              color
                          );
                        }
                    )
                );
              }else{
                return Center(
                  child: Text("Data not found"),
                );
              }
            }
          },
        )
    );
  }

  Widget displayData(ActivityDbModel data, Color color){
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: EdgeInsets.all(size.width*0.01),
        child:Container(
          width: size.width*0.8,
          height: size.height*0.22,
          child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: GoogleFonts.lexend(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                fixedSize: const Size(200, 80),
                primary: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: color,
                    width: 2.0,
                  ),
                ),
              ),
              onPressed: () async {
                var actImgdata = await MongoDatabase.getQueryActivityData("${data.nombre}");
                //var json;
                if(actImgdata.isEmpty){
                  actImgdata = [
                    {
                      'actividad': ' ',
                      'orden': 0,
                      'imagen': ' '
                    }
                  ];
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivityPictoScreen(name: "${data.nombre}", link: "${data.enlaceVideo}", descripcion: "${data.descripcion}", dataImage: actImgdata,)),
                );
              },
              child: Text(
                "${data.nombre}",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryWhite,
                    fontFamily: 'Escolar'
                ),
              )
          ),
        )
    );
  }

}