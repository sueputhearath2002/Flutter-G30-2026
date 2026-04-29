import 'package:flutter/material.dart';
import 'package:flutter2026/basic_widget/pages/demo_screen/category_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Page"), backgroundColor: Colors.amber),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (contetx) => CategoryScreen()),
            ).then((value) {
              print("Back value from page Category ${value as String}");
            });
          },
          child: Text("Go to Category Page"),
        ),
      ),
    );
  }
}
