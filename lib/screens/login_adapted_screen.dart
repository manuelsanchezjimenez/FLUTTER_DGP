import 'package:app_dgp/screens/homepage_picto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app_dgp/constants.dart';
import 'package:flutter/rendering.dart';

import '../models/UserDbModel.dart';

class LoginAdapted extends StatefulWidget {
  UserDbModel user;

  LoginAdapted({required this.user});
  @override
  _LoginAdaptedState createState() => _LoginAdaptedState();
}

class _LoginAdaptedState extends State<LoginAdapted> {
  get width => null;

  Widget crearBody(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children:[
          Container(
            width:915 ,
            decoration: BoxDecoration(
                color: Colors.white),
            child: Row(
              children:[
                Column(
                    children:[
                      Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 60),
                  child: Container(
                    child: SizedBox(width: 240,height: 240,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: kPrimaryLightColor),
                          onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          child:
                          Image.asset('assets/triangulo.png'),
                        ))
                    ),

                  ),
                ),
                      const Divider(
                        color: Colors.white,
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 0,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 60),
                          child: Container(
                            child: SizedBox(width:240,height:240,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kPrimaryLightColor),
                                  onPressed: () {},
                            child: Padding(
                              padding :EdgeInsets.symmetric(horizontal:0, vertical:0),
                              child:
                                Image.asset('assets/cuadrado.png')
                            ))
                      ),
                          )
                        ),

                ]
                ),//Primera columna
                Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 60),
                        child: Container(
                          child: SizedBox(width: 240,height: 240,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: kPrimaryLightColor),
                                onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child:
                                Image.asset('assets/circulo.png'),
                              ))
                          ),

                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 0,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 60),
                          child: Container(
                            child: SizedBox(width:240,height:240,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kPrimaryLightColor),
                                  onPressed: () {},
                                child: Padding(
                                    padding :EdgeInsets.symmetric(horizontal:0, vertical:0),
                                    child:
                                    Image.asset('assets/rombo.png')
                                ))
                            ),
                          )
                      ),

                    ]
                ), //Segunda columna
                Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 60),
                        child: Container(
                          child: SizedBox(width: 240,height: 240,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: kPrimaryLightColor),
                                onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child:
                                Image.asset('assets/estrella.png'),
                              ))
                          ),

                        ),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 20,
                        thickness: 1,
                        indent: 20,
                        endIndent: 0,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 60),
                          child: Container(
                            child: SizedBox(width:240,height:240,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kPrimaryLightColor),
                                  onPressed: () {},
                                child: Padding(
                                    padding :EdgeInsets.symmetric(horizontal:0, vertical:0),
                                    child: Image.asset('assets/aspas.png'),
                                ))
                            ),
                          )
                      ),
                    ]
                )//Tercera columna
              ],//Sección de botones

            ),

          ),
          Expanded(
            child: Column(
             children:[
               Padding(
                 padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 100),
                 child: Container(width:230,height:300,decoration: BoxDecoration(
                     border: Border.all(color: kPrimaryColor, width: 4)
                 ),
                 child: Padding(
                   padding: EdgeInsets.all(2),
                   child: Image.asset(widget.user.img)
                 ))
               ),
               const Divider(
                 color: Colors.white,
                 height: 10,
                 thickness: 1,
                 indent: 20,
                 endIndent: 0,
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 120),
                 child: SizedBox(width:200,height:200,
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                       primary: kPrimaryColor),
                   onPressed: () {
                     Navigator.push(
                         context, MaterialPageRoute(builder: (_) => HomePagePicto(user:widget.user)));
                   },
                   child:Padding(
                 padding: EdgeInsets.symmetric(horizontal:0, vertical:0),
                     child: Image.asset('assets/tick.png')
                 )
                 )
                 )
               )
             ],
            )
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          "Colegio de Educación Especial San Rafael",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: kPrimaryWhite,
              fontFamily: 'Escolar'
          ),
        ),
        centerTitle: true,
      ),
      body: crearBody(context),
    );
  }
}