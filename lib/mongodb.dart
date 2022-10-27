import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import 'constants.dart';

class MongoDatabase{
  static connect() async {
    print("Me voy a conectar");
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    print("Ya me he conectado");
    var collection = db.collection(COLLECTION_NAME);
    print(await collection.find().toList());
  }
}