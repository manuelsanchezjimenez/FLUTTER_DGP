import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ActivityImageDbModel{
  //ObjectId id;
  String actividad;
  int orden;
  String imagen;


  ActivityImageDbModel({
    //required this.id,
    required this.actividad,
    required this.orden,
    required this.imagen
    //required this.profesor,
  });


  factory ActivityImageDbModel.fromJson(Map<String,dynamic> json) => ActivityImageDbModel(
      //id: json["_id"],
      actividad: json['actividad'],
      orden: json['orden'],
      imagen: json['imagen'],
  );

  Map<String,dynamic>toJson(Map<String,dynamic> json) =>
      {
        //"_id": id,
        "actividad": actividad,
        "orden": orden,
        "imagen": imagen,
      };
}