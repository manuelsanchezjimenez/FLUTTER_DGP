import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:mongo_dart/mongo_dart.dart';
import 'constants.dart';
import 'models/ActivityDbModel.dart';

class MongoDatabase{
  //String COLLECTION_NAME = 'student';

  static var db, collection;

  static connect(String collection_name) async {
    db = await mongo.Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    collection = db.collection(collection_name);
  }
  static disconnect() async {
    await db.close();
  }

  static Future<int> getDataStudentLength()async{
    final data = await getStudentData();
    return data.length.toInt();
  }

  static Future<List<Map<String,dynamic>>> getStudentData() async{
    COLLECTION_NAME = "student";
    collection = db.collection(COLLECTION_NAME);
    final data = await collection.find().toList();
    return data;
  }
  static Future<Map<String,dynamic>>getContra(String user) async{
    var contra = await collection.findOne(mongo.where.eq('nombre',user));
    return contra;
  }

  static Future<List<Map<String,dynamic>>> getActivityData() async{
    COLLECTION_NAME = "actividad";
    collection = db.collection(COLLECTION_NAME);
    final data = await collection.find().toList();
    return data;
  }

  static Future<List<Map<String,dynamic>>> getQueryActivityData(String activity_name) async{
    COLLECTION_NAME = "actividad_imagen";
    collection = db.collection(COLLECTION_NAME);
    final data = await collection.find(where.eq('actividad',activity_name)).toList();
    return data;
  }

  static Future<int> getDataActivityLength()async{
    final data = await getActivityData();
    return data.length.toInt();
  }

  static Future<List<Map<String,dynamic>>> getQueryMenuData(String user_name) async{
    COLLECTION_NAME = "tarea";
    collection = db.collection(COLLECTION_NAME);
    final data = await collection.find(where.eq('alumno',user_name).eq('type',2)).toList();
    return data;
  }

  static Future<int> getMenuComandaLength(String user_name)async{
    COLLECTION_NAME = "tarea";
    collection = db.collection(COLLECTION_NAME);
    final data = await collection.find(where.eq('alumno',user_name).eq('type',2)).toList();
    return data.length.toInt();
  }
  static Future<void> updateUserComment(var id, String msg)async{
    COLLECTION_NAME = "tarea";
    collection = db.collection(COLLECTION_NAME);
    collection.update(where.eq('_id',id), modify.set('feedbackAlum', msg));
  }

  static Future<void> updateActivityState(var id)async{
    COLLECTION_NAME = "tarea";
    collection = db.collection(COLLECTION_NAME);
    collection.update(where.eq('_id',id), modify.set('completado', true));
  }

  static Future<List<Map<String,dynamic>>> getTaskData() async{
    COLLECTION_NAME = "tarea";
    collection = db.collection(COLLECTION_NAME);
    final data = await collection.find().toList();
    return data;
  }

  static Future<List<Map<String,dynamic>>> getQueryTaskData(String alumno) async{
    COLLECTION_NAME = "tarea";
    collection = db.collection(COLLECTION_NAME);
    final data = await collection.find(where.eq('alumno',alumno)).toList();
    return data;
  }

  static Future<int> getDataTaskLength()async{
    final data = await getTaskData();
    return data.length.toInt();
  }

}
