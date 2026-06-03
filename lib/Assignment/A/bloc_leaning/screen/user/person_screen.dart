import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/model/person_model.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/user/bloc/user_bloc.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/user/user_form/user_form_event.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/user/user_form/user_form_state.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/user/user_form/user_from_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  void clearForm() {
    nameController.clear();
    emailController.clear();
    context.read<UserFromBloc>().add(ClearUserForm());
  }

  Future<void> pickImage() async {
    final formBloc = context.read<UserFromBloc>();

    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    final dir = await getApplicationDocumentsDirectory();
    final fileName = p.basename(picked.path);
    final saveImage = await File(picked.path).copy('${dir.path}/$fileName');

    formBloc.add(SelectUserImage(saveImage));
  }

  void saveUser() {
    final formBloc = context.read<UserFromBloc>();
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        formBloc.state.imaeFile == null) {
      return;
    }

    final user = PersonModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      avatar: formBloc.state.imaeFile!.path,
    );
    context.read<UserBloc>().add(AddUser(user));
    clearForm();
  }

  void editUser(PersonModel user) {
    nameController.text = user.name;
    emailController.text = user.email;
    context.read<UserFromBloc>().add(StartEditUser(user));
  }

  void updateUserData() {
    final formState = context.read<UserFromBloc>().state;
    if (formState.editId == null || formState.imaeFile == null) return;

    final user = PersonModel(
      id: formState.editId,
      name: nameController.text,
      email: emailController.text,
      avatar: formState.imaeFile!.path,
    );
    context.read<UserBloc>().add(UpdateUser(user));
    clearForm();
  }

  Future<void> deleteUser(PersonModel user) async {
    final userBloc = context.read<UserBloc>();
    final image = File(user.avatar);
    if (await image.exists()) {
      await image.delete();
    }
    userBloc.add(DeleteUser(user.id!));
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sqflite")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<UserFromBloc, UserFormState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => pickImage(),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: state.imaeFile != null
                        ? FileImage(state.imaeFile!)
                        : null,
                    child: state.imaeFile == null
                        ? Icon(Icons.camera_alt, size: 40)
                        : null,
                  ),
                );
              },
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            BlocBuilder<UserFromBloc, UserFormState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state.isEdit ? updateUserData : saveUser,
                    child: Text(state.isEdit ? "Update Person" : "Save Person"),
                  ),
                );
              },
            ),
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is UserLoaded) {
                    if (state.users.isEmpty) {
                      return Text("No users found");
                    }

                    return ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final user = state.users[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(File(user.avatar)),
                            ),
                            title: Text(user.name),
                            subtitle: Text(user.email),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    editUser(user);
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    deleteUser(user);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (state is UserError) {
                    return Center(child: Text(state.message));
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
