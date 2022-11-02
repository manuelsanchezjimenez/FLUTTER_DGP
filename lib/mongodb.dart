import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constants.dart';

class MongoDatabase{
  static var db, collection;

  static connect() async {
    print("Me voy a conectar");
    db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    print("Ya me he conectado");
    collection = db.collection(COLLECTION_NAME);
  }

  static Future<List<Map<String,dynamic>>> getData() async{
    final data = await collection.find().toList();
    return data;
  }
}
