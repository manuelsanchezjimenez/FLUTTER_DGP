import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class UserDbModel{
  ObjectId id;
  late String usuario;
  late String nombre;
  late int tipo;
  late String clase; //cambiar a string
  late String profesor;
  late String contra;
  late String img;

  UserDbModel({
        required this.id,
        required this.usuario,
        required this.nombre,
        required this.tipo,
        required this.clase,
        required this.contra
    });


  factory UserDbModel.fromJson(Map<String,dynamic> json) => UserDbModel(
    id: json["_id"],
    usuario: json["usuario"],
    nombre: json['nombre'],
    tipo: json['tipo'],
    clase: json['clase'],
    contra: json['contra']
  );

  Map<String,dynamic>toJson(Map<String,dynamic> json) =>
      {
        "_id": id,
        "usuario": usuario,
        "nombre": nombre,
        "tipo": tipo,
        "clase": clase,
        "contra":contra
      };

  void clear(){
    id = ObjectId();
    this.contra  = this.clase = '';
    this.nombre = this.usuario = this.profesor = '';
    this.tipo = 0;

  }
}