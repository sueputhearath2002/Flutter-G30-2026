import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/Sqllite/person_screen.dart';
import 'package:flutter2026/Assignment/A/home_screen.dart';
import 'package:flutter2026/Firebase_screen/notification/local_notification.dart';
import 'package:flutter2026/Firebase_screen/user_form_screen.dart';
import 'package:flutter2026/Firebase_screen/user_screen.dart';
import 'package:flutter2026/basic_screen.dart';
import 'package:flutter2026/basic_widget/action_widget.dart';
import 'package:flutter2026/basic_widget/common_widget.dart';
import 'package:flutter2026/basic_widget/inputs_widget.dart';
import 'package:flutter2026/constant/const.dart';
import 'package:flutter2026/firebase_options.dart';

import 'basic_widget/layout_widget.dart' show RowWidget, LayoutWidget;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalNotification.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
        dividerColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      navigatorKey: navigatorKey,
      routes: {
        '/user_form': (context) => UserFormScreen(),
        '/list_user': (context) =>
            UserScreen(), //Navigator.pushName(context,"/list_user")
      },
      home: PersonScreen(),
      // UserScreen(),
      // BasicScreen(),
      // BasicScreen(),
      // ActionWidget(),
      // InputsWidget(),
      // CommonWidget(),
      // LayoutWidget()
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Hello flutter"),backgroundColor: Colors.orange,),
      body: SafeArea(
        child: Container(
          width: 200,
          height: 300,
          margin: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            /* shape: BoxShape.circle,*/
            border: Border(
              top: BorderSide(width: 8, color: Colors.green),
              right: BorderSide(width: 8, color: Colors.green),
              left: BorderSide(width: 8, color: Colors.green),
              bottom: BorderSide(width: 8, color: Colors.green),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(10, 24),
                blurRadius: 48,
                spreadRadius: 32,
              ),
              BoxShadow(
                color: Colors.black38,
                offset: Offset(10, 24),
                blurRadius: 48,
                spreadRadius: 32,
              ),
            ],
            gradient: RadialGradient(colors: [Colors.yellow, Colors.red]),
          ),
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(36),
          child: Container(color: Colors.yellow, width: 20, height: 30),
        ),
      ),
    );
  }
}
