import 'dart:ui';
import 'package:app_dgp/components/round_button.dart';
import 'package:app_dgp/constants.dart';
import 'package:app_dgp/models/UserDbModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileScreen extends StatefulWidget{
  UserDbModel user;
  ProfileScreen({required this.user});

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
List<String> dataName=['Nombre completo','Correo', 'D.N.I.', 'Clase'];
List<IconData> icons = [Icons.person, Icons.email, Icons.badge, Icons.school];
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
            onPressed: () {
              Navigator.pop(context);
            },
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
                                      buildTextDataCategory(dataName,icons)
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
                                     buildTextFormField(widget.user.nombre),
                                      buildTextFormField(widget.user.correo),
                                      buildTextFormField(widget.user.dni),
                                      buildTextFormField(widget.user.clase.toString())
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
                    width: size.width*0.35,
                    height: size.height*0.25,
                    icon: Icons.graphic_eq,
                    onPressed: (){print(dataName.length);})
              ],
            ),
          )
        )
    );
  }

  Widget buildTextFormField(String data){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
            height: size.height*0.08,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color:Colors.blueGrey),
              ),
            ),
        child: Text(
            data,
            style: GoogleFonts.arimo(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey
            )),
          )
    );
  }
  Widget buildTextDataCategory(List<String> nameCategory, List<IconData> icons){
    Size size = MediaQuery.of(context).size;
   /* return Padding(
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
    );*/
    return ListView.builder(
        shrinkWrap: true,
          itemCount: nameCategory.length,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal:size.width*0.02),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height*0.08,
                    alignment: Alignment.bottomRight,
                    child: Transform.scale(
                      scale: 1.5,
                      child: Icon(
                          icons[index],
                          color: Colors.blueGrey,
                      ),
                    )
                  ),

                  Container(
                    height: size.height*0.08,
                    alignment: Alignment.bottomRight,
                    child: Text('${nameCategory[index]}',
                        style: GoogleFonts.arimo(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                        )
                    ),
                  )
                ],
              )
              );
          }
    );
  }
}