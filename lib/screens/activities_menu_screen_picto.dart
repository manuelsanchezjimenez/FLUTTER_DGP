import 'dart:ui';
import 'package:app_dgp/components/arrow_button.dart';
import 'package:app_dgp/constants.dart';
import 'package:app_dgp/models/UserDbModel.dart';
import 'package:app_dgp/screens/activitiy_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../mongodb.dart';

class ActivitiesMenuScreenPicto extends StatefulWidget{
  ActivitiesMenuScreenPicto();
  @override
  _ActivitiesMenuScreenPicto createState() => _ActivitiesMenuScreenPicto();
}

class _ActivitiesMenuScreenPicto extends State<ActivitiesMenuScreenPicto> {
  int cont = 0;
  final int limit_list= 3;
  List<String> lista_acciones= ["ATARSE LOS CORDONES", "APRENDE LAS EMOCIONES", "LAVARSE LAS MANOS"];
  List<String> links = [
    "https://www.youtube.com/watch?v=Ma05YV2XLc8",
    "https://www.youtube.com/watch?v=qBZSlGo4N1k&t=44s",
    "https://www.youtube.com/watch?v=-_2vPIB6Ofc&list=PLBal9AttAE0twHdBKuZzz2NnBDIn8uDLF&index=4"
  ];
  List<String> pictos = [
    'assets/atar_zapatillas.png',
    'assets/sentimientos.png',
    'assets/lavar_manos.png',
  ];

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
        "ACTIVIDADES",
        style: GoogleFonts.lexend(
          fontSize: 30,
          fontWeight: FontWeight.normal,
          color: kPrimaryWhite,
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
              Padding(
                padding: EdgeInsets.symmetric(vertical:size.height*0.02),
                child: Container(
                  width: size.width*0.9,
                  child: buildList(kPrimaryColor,cont),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Semantics(
                    focused: true,
                    child: ArrowButton(
                        heroTag: "btn_back",
                        icon: Icons.arrow_back,
                        onPressed: () async{
                          cont = 0;
                          //int length = await MongoDatabase.getDataLength();
                          /* if(length > limit_list) {
                          setState(() {
                            cont -= 8;
                          });*/
                          //}
                        },
                        tooltip: "Anterior"
                    ),
                  ),
                  ArrowButton(
                      heroTag: "btn_forward",
                      icon: Icons.arrow_forward,
                      onPressed: () async{
                        cont = 0;
                        /*int length = await MongoDatabase.getDataLength();
                        if(length > limit_list) {
                          setState(() {
                            cont += 8;
                          });*/
                        //}
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
    int limit = limit_list;
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
        shrinkWrap: true,
          itemCount: limit_list,
          itemBuilder: (context, index){
            return displayData(color, index);
          }
    );
  }

  Widget displayData(Color color, int index){
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
                //fixedSize: const Size(200, 80),
                primary: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: color,
                    width: 2.0,
                  ),
                ),
              ),
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivityScreen(name: lista_acciones[index], link: links[index],)),
                );*/
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      lista_acciones[index],
                      style: GoogleFonts.lexend(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        color: kPrimaryWhite,
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Image.asset(pictos[index])
                  )
                ],
              )
          ),
        )
    );
  }

}