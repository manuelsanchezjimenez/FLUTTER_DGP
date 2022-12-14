import 'package:app_dgp/models/UserDbModel.dart';
import 'package:flutter/material.dart';
import '../components/round_button.dart';
import '../constants.dart';
import 'homepage.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:http/http.dart' as http;

import 'homepage_picto.dart';

class Login extends StatefulWidget {
  UserDbModel user;
  Login({required this.user});
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  late String plainPwd;

  void msgSnack(String msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg, style: TextStyle(fontSize: 20)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Colegio de Educación Especial San Rafael",
        style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: kPrimaryWhite,
              fontFamily: 'Escolar'
          ),
        ),
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: Container(
                  width: 300,
                  height: 220,
                  child: Image.asset('assets/icon.PNG')),
            ),
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    // Campo de texto para el nombre de usuario
                    padding: EdgeInsets.only(
                        left: 30.0,
                        right: 15.0,
                        top: 70,
                        bottom: 40), // Márgenes
                    child: SizedBox(
                      width: 600, // Tamaño de la caja
                      child: TextFormField(
                        controller: TextEditingController(text: widget.user.nombre),
                        onChanged: (value) {
                         // widget.user.nombre = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'INTRODUCE UN CORREO ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Nombre',
                            icon: Transform.scale(
                              scale: 2,
                              child: Icon(Icons.person),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.blue)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.blue)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.red))),
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Escolar'
                        ), // Tamaño de la letra
                      ),
                    ),
                  ),
                  Padding(
                    // Campo de texto para la contraseña
                    padding: EdgeInsets.only(
                        left: 30.0,
                        right: 15.0,
                        top: 5,
                        bottom: 40), // Márgenes
                    child: SizedBox(
                      width: 600, // Tamaño de la caja
                      child: TextFormField(
                        controller: TextEditingController(text: ''),
                        onChanged: (value) {
                          plainPwd = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'INTRODUCE UNA CONTRASEÑA';
                          }
                          return null;
                        },
                        obscureText:
                            true, // Conforme se va escribiendo se ponen puntitos
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(), // El borde cambia de color al clickar encima
                            labelText:
                                'CONTRASEÑA', // Para que ponga "Contraseña" dentro antes de rellenarlo
                            hintText: 'CONTRASEÑA',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.blue)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.blue)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.red)),
                          icon: Transform.scale(
                            scale: 2,
                            child: Icon(Icons.lock_outline),
                          ),
                        ),
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Escolar'
                        ), // Tamaño de la letra
                      ),
                    ),
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: RoundButton(
                    text: "Volver",
                    color: kPrimaryRed,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    width: 250,
                    height: 90
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child:Container(
                  // Botón de inicio de sesión
                  height: 90,
                  width: 250,
                  child: ElevatedButton(
                    // Botón
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        shape: new RoundedRectangleBorder(
                          borderRadius:
                          new BorderRadius.circular(30.0), // Borde redondo
                        )),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final bool checkPassword = new DBCrypt().checkpw(plainPwd, widget.user.contra);
                        if(checkPassword){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) => HomePage(user:widget.user)));
                        }else{
                          msgSnack("Email o contraseña INCORRECTOS");
                        }
                      }
                    },
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Escolar'
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }

  String hash(String plainPwd){
    String salt = new DBCrypt().gensaltWithRounds(4);
    var encoded = new DBCrypt().hashpw(plainPwd,salt);
    return encoded.toString();
  }
}
