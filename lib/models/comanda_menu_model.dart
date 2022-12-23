import 'package:mongo_dart/mongo_dart.dart';

class ComandaMenuDbModel{
  ObjectId id;
  String nombre;
  int type;
  String descripcion;
  String alumno;
  bool completado;
  late String feedbackAlum;
  late String feedbackProf;
  late DateTime fechaInicio;
  late DateTime fechaFin;

  ComandaMenuDbModel({
    required this.id,
    required this.nombre,
    required this.type,
    required this.descripcion,
    required this.alumno,
    required this.completado,
    required this.feedbackAlum,
    required this.feedbackProf,
    required this.fechaInicio,
    //required this.fechaFin
  });


  factory ComandaMenuDbModel.fromJson(Map<String,dynamic> json) => ComandaMenuDbModel(
      id: json["_id"],
      nombre: json["nombre"],
      type: json['type'],
      descripcion: json['descripcion'],
      alumno: json['alumno'],
      completado: json['completado'],
      feedbackAlum: json['feedbackAlum'],
      feedbackProf: json['feedbackProf'],
      fechaInicio: json['fechaInicio'],
      //fechaFin: json['fechaFin']
  );

  Map<String,dynamic>toJson(Map<String,dynamic> json) =>
      {
        "_id": id,
        "nombre": nombre,
        "type": type,
        "descripcion": descripcion,
        "alumno": alumno,
        "completado": completado,
        "feedbackAlum": feedbackAlum,
        "feedbackProf":feedbackProf,
        "fechaInicio":fechaInicio.toIso8601String(),
        //"fechaFin":fechaFin
        //"profesor": profesor
      };

}