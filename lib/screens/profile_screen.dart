import 'dart:ui';
import 'package:app_dgp/components/round_button_picto.dart';
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
        style: TextStyle(
            fontSize: 30,
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
        appBar: buildAppBar(),
        body:Row(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                width: size.width*0.35,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40, top: size.height*0.1, bottom: size.height*0.05),
                      child: Container(
                        width: size.width*0.3,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: kPrimaryColor,
                              width: 3
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: size.width*0.4,
                          child: buildTextFormField(widget.user.nombre),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Container(
                        width: size.width*0.25,
                        height: size.height*0.45,
                        alignment: Alignment.topCenter,
                        //color: kPrimaryColor,
                        child: Image.asset(widget.user.img),
                      ),
                    ),
                  ],
                )
            ),
            Padding(
                padding: EdgeInsets.all(size.width*0.05),
                child: Container(
                  width: size.width*0.5,
                  height: size.height*0.6,
                    child: Transform.scale(
                      scale: 1.8,
                      child: Image.asset('assets/notas.jpg'),
                    )
                ),
            )
          ],
        )
    );
  }

  //Hacer responsive el container del nombre

  Widget buildTextFormField(String data){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
            height: size.height*0.08,
            alignment: Alignment.center,
            child: Text(
            data,
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                fontFamily: 'Escolar'
            ),
          ),
      )
    );
  }
}