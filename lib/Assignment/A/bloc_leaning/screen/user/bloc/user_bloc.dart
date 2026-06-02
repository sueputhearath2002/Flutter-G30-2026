import 'package:bloc/bloc.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/model/person_model.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(UserInitial()) {
    // on<UserEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<LoadUser>(_loadUser);
    on<AddUser>(_addUser);
    on<UpdateUser>(_updateUser);
    on<DeleteUser>(_deleteUser);
  }

  Future<void> _loadUser(LoadUser event, Emitter<UserState> emit) async {
    emit(UserLoading(true));
    try {
      final users = await repository.getUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _addUser(AddUser event, Emitter<UserState> emit) async {
    await repository.addUser(event.user);
    add(LoadUser());
  }

  Future<void> _updateUser(UpdateUser event, Emitter<UserState> emit) async {
    await repository.updateUser(event.user);
    add(LoadUser());
  }

  Future<void> _deleteUser(DeleteUser event, Emitter<UserState> emit) async {
    await repository.deleteUser(event.id);
    add(LoadUser());
  }
}
