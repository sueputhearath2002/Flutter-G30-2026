import 'dart:io';

import 'package:flutter2026/Assignment/A/bloc_leaning/screen/user/user_form/user_form_state.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/user/user_form/user_form_event.dart';
import 'package:bloc/bloc.dart';

class UserFromBloc extends Bloc<UserFormEvent, UserFormState> {
  UserFromBloc() : super(UserFormState()) {
    on<SelectUserImage>(_selectUserImage);
    on<StartEditUser>(_startEditUser);
    on<ClearUserForm>(_clearUserForm);
  }

  void _selectUserImage(SelectUserImage event, Emitter<UserFormState> emit) {
    emit(
      UserFormState(
        imaeFile: event.imageFile,
        isEdit: state.isEdit,
        editId: state.editId,
      ),
    );
  }

  void _startEditUser(StartEditUser event, Emitter<UserFormState> emit) {
    emit(
      UserFormState(
        imaeFile: File(event.user.avatar),
        isEdit: true,
        editId: event.user.id,
      ),
    );
  }

  void _clearUserForm(ClearUserForm event, Emitter<UserFormState> emit) {
    emit(UserFormState());
  }
}
