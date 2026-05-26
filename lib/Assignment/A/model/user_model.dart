import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? avatar;

  UserModel({this.id, this.name, this.email, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> map, String docId) {
    return UserModel(
      id: docId,
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      avatar: map["avatar"] ?? "",
    );
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  Map<String, dynamic> toMap() {
    return {"name": name, "email": email, "avatar": avatar};
  }
}
