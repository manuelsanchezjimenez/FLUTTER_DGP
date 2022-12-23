import 'package:app_dgp/screens/homepage_picto.dart';
import 'package:app_dgp/screens/users_screen.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_dgp/constants.dart';
import 'package:flutter/rendering.dart';
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
  final int max_casillas = 6;
  List<bool> colores = [];
  final _formKey = GlobalKey<FormState>();
  void msgSnack(String msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg, style: TextStyle(fontSize: 20)),
    ));
  }

  void initState(){
    for(int i =0; i<max_casillas;i++){
      colores.add(false);
    }
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
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: colores[0] ? kPrimaryColor : kPrimaryWhite,
                                  width: 5
                              )
                          ),
                          child: SizedBox(width: 230,height: 230,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kPrimaryLightColor),
                                  onPressed: () {
                                    setSecuencia(1);
                                    setState(() {
                                      colores[0] = true;
                                    });
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
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: colores[1] ? kPrimaryColor : kPrimaryWhite,
                                    width: 5
                                )
                            ),
                            child: SizedBox(width:230,height:230,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: kPrimaryLightColor),
                                    onPressed: () {
                                      setSecuencia(2);
                                      setState(() {
                                        colores[1] = true;
                                      });
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
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => UsersScreen()));
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
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: colores[2] ? kPrimaryColor : kPrimaryWhite,
                                  width: 5
                              )
                          ),
                          child: SizedBox(width: 230,height: 230,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kPrimaryLightColor),
                                  onPressed: () {
                                    setSecuencia(3);
                                    setState(() {
                                      colores[2] = true;
                                    });
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
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: colores[3] ? kPrimaryColor : kPrimaryWhite,
                                    width: 5
                                )
                            ),
                            child: SizedBox(width:230,height:230,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: kPrimaryLightColor),
                                    onPressed: () {
                                      setSecuencia(4);
                                      setState(() {
                                        colores[3] = true;
                                      });
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
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: colores[4] ? kPrimaryColor : kPrimaryWhite,
                                  width: 5
                              )
                          ),
                          child: SizedBox(width: 230,height: 230,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kPrimaryLightColor),
                                  onPressed: () {
                                    setSecuencia(5);
                                    setState(() {
                                      colores[4] = true;
                                    });
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
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: colores[5] ? kPrimaryColor : kPrimaryWhite,
                                    width: 5
                                )
                            ),
                            child: SizedBox(width:230,height:230,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: kPrimaryLightColor),
                                    onPressed: () {
                                      setSecuencia(6);
                                      setState(() {
                                        colores[5] = true;
                                      });
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
                      padding: const EdgeInsets.only(left: 30.0, right: 15.0, top: 50),
                      child: Container(width:230,height:300,decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor, width: 4)
                      ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal:0, vertical:0),
                              child: Image.asset(widget.user.img)
                          ))
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.user.nombre,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontFamily: 'Escolar'
                          ),
                        ),
                      )
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 10,
                    thickness: 1,
                    indent: 20,
                    endIndent: 0,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 15.0, top: 30),
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
                                    for(var i=0; i<6; i++){
                                      colores[i] = false;
                                    }
                                    //colores[0] = false;
                                    msgSnack("Email o contraseña incorrectos");
                                    resetSecuencia();
                                    setState(() {});
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