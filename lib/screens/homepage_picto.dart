/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nombre aplicación"),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
import 'package:app_dgp/screens/activities_menu_screen.dart';
import 'package:app_dgp/screens/login.dart';
import 'package:app_dgp/mongodb.dart';
import 'package:app_dgp/screens/profile_screen.dart';
import 'package:app_dgp/screens/users_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/UserDbModel.dart';
import 'activities_menu_screen_picto.dart';

class HomePagePicto extends StatefulWidget {
  UserDbModel user;
  HomePagePicto({required this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePagePicto> {
  get width => null;

  void wipeData(){
    widget.user.clear();
  }

  Widget crearBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            child: Container(
              width: size.width*0.3,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15.0, right: 15.0, top: 30),
                          child: Container(
                            child: SizedBox(
                                width: 240,
                                height: 240,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Image.asset('assets/default.jpg'))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: kPrimaryLightColor,
                            ),
                            child:SizedBox(
                                width: 235,
                                height: 97,
                                child: Padding(
                                    padding: EdgeInsets.symmetric( vertical: 10),
                                    child: Center(
                                      child: Text(
                                        widget.user.nombre,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryColor,
                                          fontFamily: 'Escolar'
                                      ),
                                    ))),
                          ),
                          )
                        )
                      ],
                    ),
                  ), // Cuadro superior-izquierdo: foto de perfil y nombre
                  const Divider(
                    color: Colors.white,
                    height: 10,
                    thickness: 1,
                    indent: 20,
                    endIndent: 0,
                  ), // Divisor entre foto-nombre y botones perfil-sesion
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            // Botón de perfil
                            height: size.height*0.11,
                            width: size.width*0.20,
                            child: Padding(
                              padding: EdgeInsets.only(top: 0, bottom: 0),
                              child: ElevatedButton(
                                // Botón
                                style: ElevatedButton.styleFrom(
                                    primary: kPrimaryColor,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          30.0), // Borde redondo
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (_) => ProfileScreen(user:widget.user)));
                                },
                                child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Perfil',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryWhite,
                                        fontFamily: 'Escolar'
                                    ),
                                  ),
                                 Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Image.asset('assets/yo.png'),
                                  )
                                ],
                              )
                              ),
                            )),
                        Padding(
                          // Botón de cierre de sesión
                          padding: EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              top: 100,
                              bottom: 0), // Márgenes
                          child: Container(
                            height: size.height*0.11,
                            width: size.width*0.22,
                            child: ElevatedButton(
                              // Botón
                              style: ElevatedButton.styleFrom(
                                  primary: kPrimaryRed,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        30.0), // Borde redondo
                                  )),
                              onPressed: () {
                                wipeData();
                                Navigator.of(context).popUntil((route) => route.isFirst);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: size.width*0.12,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: size.width*0.01),
                                      child: Text(
                                        'Cerrar sesión',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: kPrimaryWhite,
                                            fontFamily: 'Escolar'
                                        ),
                                      ),
                                    )
                                  ),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: Image.asset('assets/adios.png'),
                                  )

                                ],
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), // Cuadro inferior-izquierdo: botones perfil y cerrar sesión
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.all(size.width*0.02),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                            height: size.height*0.25,
                            width: size.width*0.7,
                            child: ElevatedButton(
                              // Botón
                                style: ElevatedButton.styleFrom(
                                  primary: kPrimaryLightColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        width: 2.0,
                                        color: kPrimaryLightColor
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Mis tareas',
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryColor,
                                          fontFamily: 'Escolar'
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: size.width*0.1),
                                      child: Image.asset('assets/deberes.png'),
                                    )
                                  ],
                                )
                            )),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 20,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Expanded(
                        child: Container(
                            height: size.height*0.25,
                            width: size.width*0.7,
                            child: ElevatedButton(
                              // Botón
                                style: ElevatedButton.styleFrom(
                                  primary: kPrimaryLightColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        width: 2.0,
                                        color: kPrimaryLightColor
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (_) => ActivitiesMenuScreenPicto()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Mis actividades',
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryColor,
                                          fontFamily: 'Escolar'
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: size.width*0.05),
                                      child: Image.asset('assets/actividades.png'),
                                    )
                                  ],
                                )
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ), // Panel principal con botones de tareas y actividades
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Página principal",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: kPrimaryWhite,
            fontFamily: 'Escolar'
        ),),
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: crearBody(context),
    );
  }
}
