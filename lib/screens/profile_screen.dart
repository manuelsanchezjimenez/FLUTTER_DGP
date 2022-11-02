import 'dart:ui';
import 'package:app_dgp/components/round_button.dart';
import 'package:app_dgp/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileScreen extends StatefulWidget{
  ProfileScreen();

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {

  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading:
      Transform.scale(
          scale: 2.5,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryWhite,
            ),
            onPressed: () {  },
          )
      ),
      title: Text(
        "Perfil",
        style: GoogleFonts.arimo(
          fontSize: 30,
          fontWeight: FontWeight.bold,
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
        appBar: buildAppBar(),
        body:Center(
          child:Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top:30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(40),
                          child: Container(
                            width: size.width*0.25,
                            height: size.height*0.45,
                            alignment: Alignment.center,
                            color: kPrimaryColor,
                            child: Text("FOTO ALUMNO",
                                textScaleFactor: 2),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            width: size.width*0.65,
                            height: size.height*0.4,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: kPrimaryColor,
                                  width: 3
                              ),
                              borderRadius: BorderRadius.circular(30),

                            ),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  height: size.height*0.35,
                                  width: size.width*0.25,
                                  //color: Colors.blueGrey,
                                  child: Column(
                                    children: [
                                      textData("Nombre"),
                                      textData("Apellidos"),
                                      textData("Correo"),
                                      textData("Fecha de nacimiento"),
                                    ],
                                  ),
                                ),

                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: size.height*0.35,
                                  width: size.width*0.38,
                                  //color: Colors.grey,
                                  child: Column(
                                    children: [
                                      buildTextFormField(),
                                      buildTextFormField(),
                                      buildTextFormField(),
                                      buildTextFormField()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                ),
                RoundButton(
                    text: "Ver gráfica",
                    width: size.width*0.25,
                    height: size.height*0.15,
                    icon: Icons.graphic_eq,
                    onPressed: (){})
              ],
            ),
          )
        )
    );
  }

  Widget buildTextFormField(/*String data*/){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
            height: size.height*0.08,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color:Colors.blueGrey),
              ),
            ),
          )
    );
  }
  Widget textData(String nameCategory){
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal:size.width*0.02),
        child: Container(
          height: size.height*0.08,
          alignment: Alignment.bottomRight,
          child: Text(nameCategory,
              style: GoogleFonts.arimo(
              fontSize: 22,
              fontWeight: FontWeight.normal,
              color: Colors.black
          )
        ) ,
      ),
    );
  }
}