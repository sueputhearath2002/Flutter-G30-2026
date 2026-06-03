import 'dart:io';

class UserFormState {
  final File? imaeFile;
  final bool isEdit;
  final int? editId;

  UserFormState({this.imaeFile, this.isEdit = false, this.editId});
}
