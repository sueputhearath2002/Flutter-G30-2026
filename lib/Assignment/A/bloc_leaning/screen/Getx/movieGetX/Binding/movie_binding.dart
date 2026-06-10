import 'package:flutter2026/Assignment/A/bloc_leaning/repository/movie_repository.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/Getx/movieGetX/controller/movie_getx_controller.dart';
import 'package:get/get.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieRepository>(() => MovieRepository());

    Get.lazyPut(
      () => MovieGetxController(repository: Get.find<MovieRepository>()),
    );
  }
}
