import 'package:flutter/material.dart';
import 'package:flutter2026/constant/colors.dart';

class UserFormScreen extends StatelessWidget {
  UserFormScreen({super.key});

  TextEditingController nameUser = TextEditingController();
  TextEditingController emailUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create User")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Image.network(
            width: 150,
            height: 200,
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBwgu1A5zgPSvfE83nurkuzNEoXs9DMNr8Ww&s",
            // fit: BoxFit.cover,
          ),
          SizedBox(height: 32),
          TextFormField(
            controller: nameUser,
            decoration: InputDecoration(
              filled: true,

              prefixIcon: Icon(Icons.person),
              // suffixIcon: Icon(Icons.percent),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: Text("User Name"),
              hintText: "Please input User Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.black, width: 3),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: nameUser,
            decoration: InputDecoration(
              filled: true,

              prefixIcon: Icon(Icons.email),
              // suffixIcon: Icon(Icons.percent),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: Text("Email"),
              hintText: "Please input email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.black, width: 3),
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(ColorStyle.mainColor),
            ),
            child: Text(
              "Create User",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
