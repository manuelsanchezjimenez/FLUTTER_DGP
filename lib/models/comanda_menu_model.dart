class ComandaMenuDbModel{
 // ObjectId id;
  String nombre;
  int type;
  String descripcion;
  String alumno;
  bool completado;
  late String feedbackAlum;
  late String feedbackProf;

  ComandaMenuDbModel({
    //required this.id,
    required this.nombre,
    required this.type,
    required this.descripcion,
    required this.alumno,
    required this.completado,
    required this.feedbackAlum,
    required this.feedbackProf
  });


  factory ComandaMenuDbModel.fromJson(Map<String,dynamic> json) => ComandaMenuDbModel(
      //id: json["_id"],
      nombre: json["nombre"],
      type: json['type'],
      descripcion: json['descripcion'],
      alumno: json['alumno'],
      completado: json['completado'],
      feedbackAlum: json['feedbackAlum'],
      feedbackProf: json['feedbackProf']
  );

  Map<String,dynamic>toJson(Map<String,dynamic> json) =>
      {
        //"_id": id,
        "nombre": nombre,
        "type": type,
        "descripcion": descripcion,
        "alumno": alumno,
        "completado": completado,
        "feedbackAlum": feedbackAlum,
        "feedbackProf":feedbackProf
        //"profesor": profesor
      };

}