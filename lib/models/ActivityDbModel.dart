import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ActivityDbModel{
  ObjectId id;
  String nombre;
  String descripcion;
  String enlaceVideo;


  ActivityDbModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.enlaceVideo,
    //required this.profesor,
  });


  factory ActivityDbModel.fromJson(Map<String,dynamic> json) => ActivityDbModel(
      id: json["_id"],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      enlaceVideo: json['enlaceVideo'],
  );

  Map<String,dynamic>toJson(Map<String,dynamic> json) =>
      {
        "_id": id,
        "nombre": nombre,
        "descrpcion": descripcion,
        "enlaceVideo": enlaceVideo,
      };
}