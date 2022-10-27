import 'package:app_dgp/user.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {

  User user = User("","");
  TextEditingController user_ctrl = new TextEditingController();
  TextEditingController passwd_ctrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Nombre App",
          style: TextStyle(fontFamily: 'Sifonn'),
        ),
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

          Padding( // Campo de texto para el nombre de usuario
            padding:
            EdgeInsets.only(left: 30.0, right: 15.0, top: 70, bottom: 40), // Márgenes
            child: SizedBox(
              width: 600, // Tamaño de la caja
              child: TextField(
                key: Key("usuario"),
                controller: user_ctrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '',
                  labelText: 'Usuario', // Para que ponga "Usuario" dentro antes de rellenarlo
                  icon: Icon(Icons.person), // Icono de la persona a la izquierda
                  focusedBorder: OutlineInputBorder(), // El borde cambia de color al clickar encima
                ),
                style: TextStyle(fontSize: 20), // Tamaño de la letra
              ),
            ),
          ),

          const Padding( // Campo de texto para la contraseña
            padding:
                EdgeInsets.only(left: 30.0, right: 15.0, top: 5, bottom: 70), // Márgenes
            child: SizedBox(
              width: 600, // Tamaño de la caja
              child: TextField(
                obscureText: true, // Conforme se va escribiendo se ponen puntitos
                decoration: InputDecoration(
                    border: OutlineInputBorder(), // El borde cambia de color al clickar encima
                    labelText: 'Contraseña', // Para que ponga "Usuario" dentro antes de rellenarlo
                    icon: Icon(Icons.lock_outline) // Icono del candado a la izquierda
                ),
                style: TextStyle(fontSize: 20), // Tamaño de la letra
              ),
            ),
          ),
          Container( // Botón de inicio de sessión
            height: 90,
            width: 250,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)), // Borde redondo
            child: ElevatedButton( // Botón
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Text(
                'Iniciar sesion',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
