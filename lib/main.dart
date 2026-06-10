import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/repository/movie_repository.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/repository/user_repository.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/Getx/movieDetailGetX/binding/detail_movie_binding.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/Getx/movieDetailGetX/page/detail_movie_screen.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/Getx/movieGetX/Binding/movie_binding.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/Getx/movieGetX/page/movie_getx_screen.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/movie/bloc/movie_bloc.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/movie/movie_screen.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/user/bloc/user_bloc.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/user/user_form/user_from_bloc.dart';
import 'package:flutter2026/Firebase_screen/notification/local_notification.dart';
import 'package:flutter2026/Firebase_screen/user_form_screen.dart';
import 'package:flutter2026/Firebase_screen/user_screen.dart';
import 'package:flutter2026/constant/const.dart';
import 'package:flutter2026/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalNotification.init();
  // runApp(const MyApp()); //Old Code <Using BLoc>
  runApp(
    GetMaterialApp(
      // home: MovieGetxScreen() //withouth binding
      initialRoute: '/movie',
      getPages: [
        GetPage(
          name: '/movie',
          page: () => MovieGetxScreen(),
          binding: MovieBinding(),
        ),

        GetPage(
          name: '/movie-detail',
          page: () => DetailMovieScreen(),
          binding: DetailMovieBinding(),
        ),
      ],
    ),
  );
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
        BlocProvider(
          create: (_) => MovieBloc(MovieRepository())..add(LoadMovies()),
        ),
        BlocProvider(create: (_) => UserFromBloc()),
      ],
      child: GetMaterialApp(
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
        home: MovieGetxScreen(),
        //MovieScreen(),
        // PersonScreen(),
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
