import 'package:flutter2026/Assignment/A/Sqllite/database_helper.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/model/person_model.dart';

class UserRepository {
  final DatabaseHelper db = DatabaseHelper.instance;

  Future<List<PersonModel>> getUsers() async {
    return await db.getUers();
  }

  Future<void> addUser(PersonModel user) async {
    await db.insertUser(user);
  }

  Future<void> updateUser(PersonModel user) async {
    await db.updateUser(user);
  }

  Future<void> deleteUser(int id) async {
    await db.deleteUser(id);
  }
}
