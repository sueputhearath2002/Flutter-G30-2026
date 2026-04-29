import 'package:flutter/material.dart';
import 'package:flutter2026/basic_widget/pages/home_page.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  // route :{
  //   '/home':(context)=>HomePage(),
  //   '/cattegory':(context)=>CategoryScreen(),
  // }
  // Navigator.pushNamed(context ,'/home'),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Page"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context, "Back-Success"),
          child: Text("Back to Admin Page"),
        ),
      ),
    );
  }
}
