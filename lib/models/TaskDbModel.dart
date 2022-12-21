import 'package:mongo_dart/mongo_dart.dart';

class UserDbModel{
  ObjectId id;
  String nombre;
  String descripcion;
  String alumno;
  String alumnoID;
  DateTime fechaInicio;
  DateTime fechaFinal;
  bool completado;
  int type;
  String actividad;

  UserDbModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.alumno,
    required this.alumnoID,
    required this.fechaInicio,
    required this.fechaFinal,
    required this.completado,
    required this.type,
    required this.actividad
    //required this.profesor,
  });


  factory UserDbModel.fromJson(Map<String,dynamic> json) => UserDbModel(
      id: json["_id"],
      nombre: json["nombre"],
      descripcion: json['descripcion'],
      alumno: json['alumno'],
      alumnoID: json['alumnoID'],
      fechaInicio: json['fechaInicio'],
      fechaFinal: json['fechaFinal'],
      completado: json['completado'],
      type: json['type'],
      actividad: json['actividad']
  );

  Map<String,dynamic>toJson(Map<String,dynamic> json) =>
      {
        "_id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "alumno": alumno,
        "alumnoID": alumnoID,
        "fechaIncio": fechaInicio,
        "fechaFinal": fechaFinal,
        "completado": completado,
        "type" : type,
        "actividad": actividad
      };

  void clear(){
    id = ObjectId();
    this.nombre = this.descripcion = this.alumno
    = this.alumnoID = this.actividad = '';
    this.fechaInicio = this.fechaFinal = DateTime.now();
    this.completado = false;
    this.type = 0;

  }
}