import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'constants.dart';

class MongoDatabase{
  static var db, collection;

  static connect() async {
    db = await mongo.Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    collection = db.collection(COLLECTION_NAME);
  }
  static disconnect() async {
    await db.close();
  }

  static Future<int> getDataLength()async{
    final data = await getData();
    return data.length.toInt();
  }

  static Future<List<Map<String,dynamic>>> getData() async{
    final data = await collection.find().toList();
    return data;
  }
  static Future<Map<String,dynamic>>getContra(String user) async{
    var contra = await collection.findOne(mongo.where.eq('nombre',user));
    return contra;
  }
}
