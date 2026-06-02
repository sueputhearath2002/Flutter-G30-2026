part of 'user_bloc.dart';

sealed class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {
  final bool isLoading;

  UserLoading(this.isLoading);
}

class UserLoaded extends UserState {
  final List<PersonModel> users;

  UserLoaded(this.users);
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
