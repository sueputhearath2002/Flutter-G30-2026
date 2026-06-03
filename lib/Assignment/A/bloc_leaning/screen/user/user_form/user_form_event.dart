import 'dart:io';

import 'package:flutter2026/Assignment/A/bloc_leaning/model/person_model.dart';

abstract class UserFormEvent {}

class SelectUserImage extends UserFormEvent {
  final File imageFile;

  SelectUserImage(this.imageFile);
}

class StartEditUser extends UserFormEvent {
  final PersonModel user;

  StartEditUser(this.user);
}

class ClearUserForm extends UserFormEvent {}
