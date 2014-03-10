import 'dart:io';
import 'dart:async';
import 'package:vane/vane.dart';
import 'package:mongo_dart/mongo_dart.dart';

class PostData extends Controller {
  void main() {
    var mongodb_uri = Platform.environment['MONGODB_URI'];
    print("mongodb_uri: $mongodb_uri");
    
    Db db;
    DbCollection coll;
    
    db = new Db(mongodb_uri);
    var collName = "sessions";
    
    var sessionId = "ABCEDF";
    if(query.containsKey("session")) {
      sessionId = query["session"];
    }
    
    db.open().then((c) {
      coll = db.collection(collName);
      coll.insert({"user":"Robert", "session":sessionId})
      .then((_) {
        db.close().then((_) => send("Data save!")); 
      });
    });
  }
}

class GetData extends Controller {
  void main() {
    var mongodb_uri = Platform.environment['MONGODB_URI'];
    print("mongodb_uri: $mongodb_uri");
    
    Db db;
    DbCollection coll;
    
    db = new Db(mongodb_uri);
    var collName = "sessions";
    
    db.open().then((c) {
      coll = db.collection(collName);
      var user = coll.findOne({"user":"Robert"});
      
      Future.wait([user]).then((data) {
        db.close().then((_) => send(data[0]));
      });
    });
  }
}

class GetDatas extends Controller {
  void main() {
    var mongodb_uri = Platform.environment['MONGODB_URI'];
    print("mongodb_uri: $mongodb_uri");
    
    Db db;
    DbCollection coll;
    
    db = new Db(mongodb_uri);
    var collName = "sessions";
    
    db.open().then((c) {
      coll = db.collection(collName);
      var users = coll.find({"user":"Robert"}).toList();
      
      Future.wait([users]).then((data) {
        db.close().then((_) => send(data[0]));
      });
    });
  }
}

