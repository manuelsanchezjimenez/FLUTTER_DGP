import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class UserDbModel{
  ObjectId id;
  String usuario;
  String nombre;
  int tipo;
  String correo;
  String dni;
  String clase;
  late String profesor;
  late String contra;
  late String img;

  UserDbModel({
        required this.id,
        required this.usuario,
        required this.nombre,
        required this.tipo,
        required this.correo,
        required this.dni,
        required this.clase,
        required this.contra
        //required this.profesor,
    });


  factory UserDbModel.fromJson(Map<String,dynamic> json) => UserDbModel(
    id: json["_id"],
    usuario: json["usuario"],
    nombre: json['nombre'],
    tipo: json['tipo'],
    correo: json['correo'],
    dni: json['dni'],
    clase: json['clase'],
    contra: json['contra']
    //profesor: json['profesor']
  );

  Map<String,dynamic>toJson(Map<String,dynamic> json) =>
      {
        "_id": id,
        "usuario": usuario,
        "nombre": nombre,
        "tipo": tipo,
        "correo": correo,
        "dni": dni,
        "clase": clase,
        "contra":contra
        //"profesor": profesor
      };

  void clear(){
    id = ObjectId();
    this.contra= this.clase = this.dni = this.correo = '';
    this.nombre = this.usuario = this.profesor =   '';
    this.tipo = 0;

  }
}