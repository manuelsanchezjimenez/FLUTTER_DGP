import 'package:app_dgp/screens/homepage_picto.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:app_dgp/constants.dart';
import 'package:flutter/rendering.dart';

import '../components/round_button.dart';
import '../components/round_button_picto.dart';
import '../models/UserDbModel.dart';

class LoginAdapted extends StatefulWidget {
  UserDbModel user;

  LoginAdapted({required this.user});
  @override
  _LoginAdaptedState createState() => _LoginAdaptedState();
}



class _LoginAdaptedState extends State<LoginAdapted> {
  get width => null;
  String secuencia = "";
  final _formKey = GlobalKey<FormState>();
  void msgSnack(String msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg, style: TextStyle(fontSize: 20)),
    ));
  }

  void setSecuencia(int n){
    secuencia = secuencia + n.toString();
  }

  void resetSecuencia(){
    secuencia = "";
  }

  Widget crearBody(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children:[
          Container(
            width:size.width*0.75 ,
            decoration: BoxDecoration(
                color: Colors.white),
            child: Row(
              children:[
                Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 40),
                        child: Container(
                          child: SizedBox(width: 240,height: 240,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kPrimaryLightColor),
                                  onPressed: () {
                                    setSecuencia(1);
                                  },
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
                          padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 40),
                          child: Container(
                            child: SizedBox(width:240,height:240,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: kPrimaryLightColor),
                                    onPressed: () {
                                      setSecuencia(2);
                                    },
                                    child: Padding(
                                        padding :EdgeInsets.symmetric(horizontal:0, vertical:0),
                                        child:
                                        Image.asset('assets/cuadrado.png')
                                    ))
                            ),
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50.0,top:40),
                        child: RoundButtonPicto(
                            text: "Volver",
                            picto: Image.asset("assets/volver.png"),
                            color: kPrimaryRed,
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            width: 250,
                            height: 100,
                        ),
                      )
                    ]
                ),//Primera columna
                Column(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 40),
                        child: Container(
                          child: SizedBox(width: 240,height: 240,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kPrimaryLightColor),
                                  onPressed: () {
                                    setSecuencia(3);
                                  },
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
                          padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 40),
                          child: Container(
                            child: SizedBox(width:240,height:240,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: kPrimaryLightColor),
                                    onPressed: () {
                                      setSecuencia(4);
                                    },
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
                        padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 40),
                        child: Container(
                          child: SizedBox(width: 240,height: 240,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kPrimaryLightColor),
                                  onPressed: () {
                                    setSecuencia(5);
                                  },
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
                          padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 40),
                          child: Container(
                            child: SizedBox(width:240,height:240,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: kPrimaryLightColor),
                                    onPressed: () {
                                      setSecuencia(6);
                                    },
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
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Padding(
                      padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 100),
                      child: Container(width:230,height:300,decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor, width: 4)
                      ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal:0, vertical:0),
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
                      padding: const EdgeInsets.only(left: 50.0, right: 15.0, top: 100),
                      child: SizedBox(width:200,height:200,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: kPrimaryColor),
                              onPressed: () {

                                  final bool checkPassword = new DBCrypt().checkpw(secuencia, widget.user.contra);
                                  if(checkPassword) {
                                    print(secuencia);
                                    resetSecuencia();
                                    Navigator.push(
                                        context, MaterialPageRoute(
                                        builder: (_) => HomePagePicto(user: widget.user)));
                                  }else{
                                    msgSnack("Email o contraseña incorrectos");
                                    resetSecuencia();
                                  }

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

  /* Navigator.push(
  context, MaterialPageRoute(builder: (_) => HomePagePicto(user:widget.user)));*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login adaptado",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: kPrimaryWhite,
              fontFamily: 'Escolar'
          ),
        ),
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: crearBody(context),
    );
  }
}