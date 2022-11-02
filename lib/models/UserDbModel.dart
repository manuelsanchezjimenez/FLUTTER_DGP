import 'package:mongo_dart/mongo_dart.dart';

class UserDbModel{
  ObjectId id;
  String usuario;
  String nombre;
  int tipo;
  String correo;
  String dni;
  int clase;
  String profesor;

  UserDbModel({
        required this.id,
        required this.usuario,
        required this.nombre,
        required this.tipo,
        required this.correo,
        required this.dni,
        required this.clase,
        required this.profesor,
    });

  factory UserDbModel.fromJson(Map<String,dynamic> json) => UserDbModel(
    id: json["_id"],
    usuario: json["usuario"],
    nombre: json['nombre'],
    tipo: json['tipo'],
    correo: json['correo'],
    dni: json['dni'],
    clase: json['clase'],
    profesor: json['profesor']
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
        "profesor": profesor
      };
}