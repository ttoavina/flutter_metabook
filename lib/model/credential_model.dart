import 'package:mongo_dart/mongo_dart.dart';

class Credential {
  String username;
  String password;

  Credential({required this.username , required this.password});

  Map<String , dynamic> toJson() {
    Map<String , dynamic> data = Map<String , dynamic>();
    data['password'] = this.password; 
    data['username'] = this.username;
    data['date'] = DateTime.now().toIso8601String();
    data['_id'] = ObjectId();
    return data;
  }
}