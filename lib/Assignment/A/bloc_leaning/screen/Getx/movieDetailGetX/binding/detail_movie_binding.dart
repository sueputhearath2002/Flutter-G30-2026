import 'package:flutter2026/Assignment/A/bloc_leaning/repository/movie_repository.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/Getx/movieDetailGetX/controller/detail_movie_controller.dart';
import 'package:get/get.dart';

class DetailMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailMovieController(repository: Get.find<MovieRepository>()),
    );
  }
}
