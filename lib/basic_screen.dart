import 'package:flutter/material.dart';
import 'package:flutter2026/basic_widget/pages/home_page.dart';
import 'package:flutter2026/basic_widget/pages/order_page.dart';
import 'package:flutter2026/basic_widget/pages/profile.dart';
import 'package:flutter2026/basic_widget/pages/search_page.dart';

class BasicScreen extends StatefulWidget {
  BasicScreen({super.key});

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  final _page = [HomePage(), SearchPage(), OrderPage(), Profile()];

  int _selectIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 2,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
        title: Text("Basic flutter"),
        backgroundColor: Colors.blue,
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(100),
        //   child: Container(
        //     height: 100,
        //     decoration: BoxDecoration(
        //       color: Colors.amber,
        //       borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(16),
        //         bottomRight: Radius.circular(16),
        //       ),
        //     ),
        //   ),
        // ),
        centerTitle: false,
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Center(
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBwgu1A5zgPSvfE83nurkuzNEoXs9DMNr8Ww&s",
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text("Hello Jonh"),
                subtitle: Text("Jonh@gmail.com"),
              ),
            ),
            ListTile(title: Text("Home"), leading: Icon(Icons.home)),
            ListTile(title: Text("Home"), leading: Icon(Icons.home)),
            ListTile(title: Text("Home"), leading: Icon(Icons.home)),
          ],
        ),
      ),
      body: _page[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        currentIndex: _selectIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (value) => _onTap(value),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: "Order",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
