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
import 'package:app_dgp/screens/login.dart';
import 'package:app_dgp/mongodb.dart';
import 'package:app_dgp/screens/profile_screen.dart';
import 'package:app_dgp/screens/users_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/UserDbModel.dart';

class HomePage extends StatefulWidget {
  UserDbModel user;
  HomePage({required this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get width => null;

  void wipeData(){
    widget.user.clear();
  }

  Widget crearBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            child: Container(
              width: 300,
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
                                height: 90,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Center(
                                      child: Text(
                                        widget.user.nombre,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))),
                          ),
                        )
                      ],
                    ),
                  ), // Cuadro superior-izquierdo: foto de perfil y nombre
                  const Divider(
                    color: Colors.white,
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 0,
                  ), // Divisor entre foto-nombre y botones perfil-sesion
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            // Botón de perfil
                            height: 90,
                            width: 250,
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
                                child: Text(
                                  'Perfil',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            )),
                        Padding(
                          // Botón de cierre de sesión
                          padding: EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              top: 150,
                              bottom: 0), // Márgenes
                          child: Container(
                            height: 90,
                            width: 250,
                            child: ElevatedButton(
                              // Botón
                              style: ElevatedButton.styleFrom(
                                  primary: kPrimaryColor,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        30.0), // Borde redondo
                                  )),
                              onPressed: () {
                                wipeData();
                                Navigator.of(context).popUntil((route) => route.isFirst);
                              },
                              child: Text(
                                'Cerrar sesión',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
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
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          height: 200,
                          width: 900,
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
                            child: Text(
                              'Mis tareas',
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 40),
                            ),
                          )),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 70,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Expanded(
                      child: Container(
                          height: 200,
                          width: 900,
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
                            child: Text(
                              'Mis actividades',
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 40),
                            ),
                          )),
                    ),
                  ],
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
        title: Text("Página principal", style: TextStyle(fontFamily: 'Sifonn')),
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: crearBody(context),
    );
  }
}
