import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/Sqllite/database_helper.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/model/person_model.dart';
import 'package:image_picker/image_picker.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  File? imageFile;

  List<PersonModel> users = [];

  bool isEdit = false;

  int? editId;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;
    imageFile = File(picked.path);
    setState(() {
      imageFile = File(picked.path);
    }); 
    // rebuild 
  }

  //Laod user

  Future<void> loadUsers() async {
    final data = await DatabaseHelper.instance.getUers();
    setState(() {
      users = data;
    });
  }

  Future<void> savePerson() async {
    if (imageFile == null) return;

    final person = PersonModel(
      name: nameController.text,
      email: emailController.text,
      avatar: imageFile!.path,
    );
    await DatabaseHelper.instance.insertUser(person);
    clearForm();
    loadUsers();

    //clear
  }

  Future<void> updateUser() async {
    if (imageFile == null) return;
    final person = PersonModel(
      id: editId,
      name: nameController.text,
      email: emailController.text,
      avatar: imageFile!.path,
    );
    await DatabaseHelper.instance.updateUser(person);
    clearForm();
    loadUsers();
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    imageFile = null;
  }

  void editUser(PersonModel user) {
    nameController.text = user.name;
    emailController.text = user.email;
    imageFile = File(user.avatar);

    editId = user.id;
    isEdit = true;

    setState(() {});
  }

  Future<void> deleteUser(PersonModel user) async {
    final image = File(user.avatar);
    if (await image.exists()) {
      await image.delete();
    }

    await DatabaseHelper.instance.deleteUser(user.id!);
    clearForm();
    loadUsers();
  }

  @override
  void initState() {
    loadUsers();
    super.initState();
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
            GestureDetector(
              onTap: () => pickImage(),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: imageFile != null
                    ? FileImage(imageFile!)
                    : null,
                child: imageFile == null
                    ? Icon(Icons.camera_alt, size: 40)
                    : null,
              ),
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

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  isEdit ? updateUser() : savePerson();
                },
                child: Text("Save Person"),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
