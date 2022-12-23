import 'package:app_dgp/models/comanda_menu_model.dart';
import 'package:app_dgp/screens/login.dart';
import 'package:app_dgp/mongodb.dart';
import 'package:app_dgp/screens/profile_screen.dart';
import 'package:app_dgp/screens/tareas_menu.dart';
import 'package:app_dgp/screens/users_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/UserDbModel.dart';
import 'activities_menu_screen.dart';

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
                              EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: kPrimaryColor, width: 4)
                            ),
                            child: SizedBox(
                                width: 220,
                                height: 240,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Image.asset(widget.user.img)
                                )
                            ),
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
                                height: 95,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Center(
                                      child: Text(
                                        widget.user.nombre,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryColor,
                                          fontFamily: 'Escolar'
                                        ),
                                      ),
                                    ))),
                          ),
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
                            height: 90,
                            width: 250,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 0),
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
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryWhite,
                                      fontFamily: 'Escolar'
                                  ),
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
                                  primary: kPrimaryRed,
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
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryWhite,
                                    fontFamily: 'Escolar'
                                ),
                            ),
                          ),
                        ),
                        )
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
                            onPressed: () async {
                              var tareas = await MongoDatabase.getQueryTarea(widget.user.id.toHexString());
                              //print(ComandaMenuDbModel.fromJson(tareas[0]).fechaInicio);
                             Navigator.push(
                              context, MaterialPageRoute(builder: (_) => TareasMenuScreen(user:widget.user, model: tareas,)));
                            },
                            child: Text(
                              'Mis tareas',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                  fontFamily: 'Escolar'
                              ),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ActivitiesMenuScreen()),
                              );
                            },
                            child: Text(
                              'Mis actividades',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                  fontFamily: 'Escolar'
                              ),
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
        title: Text("Página principal",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: kPrimaryWhite,
              fontFamily: 'Escolar'
          ),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: crearBody(context),
    );
  }
}
