import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/circle_btn.dart';
import 'package:flutter2026/Firebase_screen/user_form_screen.dart';
import 'package:flutter2026/Assignment/A/model/user_model.dart';
import 'package:flutter2026/Firebase_screen/user_service.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  Future<void> confrimDelete(BuildContext context, UserModel user) async {
    final confirmed = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Delete User",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          content: Text("Are you sure ,You want to delete `${user.name}`"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
    if (confirmed == true) {
      await UserService.deleteUser(user.id ?? "");
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User deleted"), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users"), backgroundColor: Colors.blue),
      body: StreamBuilder<List<UserModel>>(
        stream: UserService.getUsers(),
        builder: (context, snap) {
          //Check Loading
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // Check Error
          if (snap.hasError) {
            return Column(
              spacing: 24,
              children: [
                Icon(Icons.error, size: 50, color: Colors.red),

                Text("Error: ${snap.error}"),
              ],
            );
          }

          final users = snap.data ?? [];

          // Check list user if Empty show somthing
          if (users.isEmpty) {
            return Column(
              spacing: 16,
              children: [
                Icon(Icons.person, size: 80, color: Colors.grey),
                Text(
                  "No users yet.\n Tap + to add one.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            );
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: ClipOval(
                  child: (user.avatar != null && user.avatar!.startsWith('/'))
                      ? Image.file(
                          File(user.avatar ?? ""),
                          width: 54,
                          height: 54,
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: user.avatar ?? "",
                          height: 54,
                          width: 54,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                ),
                title: Text(user.name ?? ""),
                subtitle: Text(user.email ?? ""),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    spacing: 8,
                    children: [
                      CircleBtn(
                        icon: Icons.edit,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserFormScreen(user: user),
                          ),
                        ),
                      ),
                      CircleBtn(
                        icon: Icons.delete,
                        iconColor: Colors.red,
                        onTap: () => confrimDelete(context, user),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserFormScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
