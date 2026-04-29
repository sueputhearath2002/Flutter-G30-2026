import 'package:flutter/material.dart';
import 'package:flutter2026/basic_widget/pages/demo_screen/admin_screen.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminScreen()),
            ),
            leading: Icon(
              Icons.circle_notifications,
              color: Colors.amber,
              size: 34,
            ),
            title: Text("Flutter-basic"),
            subtitle: Text("Flutter-basic-12456"),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
      // body: ListView.builder(
      //   padding: EdgeInsets.all(20),
      //   itemCount: 20,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       leading: Icon(
      //         Icons.circle_notifications,
      //         color: Colors.amber,
      //         size: 34,
      //       ),
      //       title: Text("Flutter-basic"),
      //       subtitle: Text("Flutter-basic-12456"),
      //     );
      //   },
      // ),
    );
  }
}
