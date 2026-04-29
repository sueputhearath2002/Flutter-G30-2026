import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 30,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return Card(child: Text("Item $index"));
        },
      ),
      // body: GridView.count(
      //   padding: EdgeInsets.all(8),
      //   crossAxisCount: 3,
      //   crossAxisSpacing: 8,
      //   mainAxisSpacing: 8,
      //   childAspectRatio: 1,
      //   children: [
      //     Card(child: Column(children: [Text("Apple")])),
      //     Card(child: Column(children: [Text("Apple")])),
      //     Card(child: Column(children: [Text("Apple")])),
      //     Card(child: Column(children: [Text("Apple")])),
      //     Card(child: Column(children: [Text("Apple")])),
      //     Card(child: Column(children: [Text("Apple")])),
      //     Card(child: Column(children: [Text("Apple")])),
      //   ],
      // ),
    );
  }
}
