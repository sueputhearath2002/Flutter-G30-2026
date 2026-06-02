part of 'user_bloc.dart';

sealed class UserEvent {}

class LoadUser extends UserEvent {}

class AddUser extends UserEvent {
  final PersonModel user;
  AddUser(this.user);
}

class UpdateUser extends UserEvent {
  final PersonModel user;

  UpdateUser(this.user);
}

class DeleteUser extends UserEvent {
  final int id;

  DeleteUser(this.id);
}
