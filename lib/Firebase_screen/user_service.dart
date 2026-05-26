import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter2026/Assignment/A/model/user_model.dart';

class UserService {
  static final _col = FirebaseFirestore.instance.collection('user');

  static Stream<List<UserModel>> getUsers() {
    return _col.snapshots().map(
      (snapshote) =>
          snapshote.docs.map((doc) => UserModel.fromDocument(doc)).toList(),
    );
  }

  static Future<void> creatUser(UserModel user) async {
    await _col.add(user.toMap());
  }

  static Future<void> updateUser(UserModel user) async {
    await _col.doc(user.id).update({
      'name': user.name,
      'email': user.email,
      'avatar': user.avatar,
    });
  }

  static Future<void> deleteUser(String userId) async {
    await _col.doc(userId).delete();
  }
}
