import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/A_widget/components/circle_btn.dart';
import 'package:flutter2026/Firebase_screen/user_form_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users"), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBwgu1A5zgPSvfE83nurkuzNEoXs9DMNr8Ww&s",
                fit: BoxFit.cover,
              ),
            ),
            title: Text("Hello Jonh"),
            subtitle: Text("Jonh@gmail.com"),
            trailing: SizedBox(
              width: 100,
              child: Row(
                spacing: 8,
                children: [
                  CircleBtn(icon: Icons.edit),
                  CircleBtn(icon: Icons.delete, iconColor: Colors.red),
                ],
              ),
            ),
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
