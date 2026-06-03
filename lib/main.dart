import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/repository/user_repository.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/user/bloc/user_bloc.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/user/person_screen.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/user/user_form/user_from_bloc.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserBloc(UserRepository())..add(LoadUser()),
        ),
        BlocProvider(create: (_) => UserFromBloc()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
