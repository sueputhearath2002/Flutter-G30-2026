import 'package:flutter2026/Assignment/A/bloc_leaning/model/movie_mode.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/repository/movie_repository.dart';
import 'package:get/get.dart';

class DetailMovieController extends GetxController {
  final MovieRepository repository;

  DetailMovieController({required this.repository});

  final RxBool isLoading = false.obs;

  final Rxn<MovieModel> movie = Rxn<MovieModel>();

  @override
  void onInit() {
    super.onInit();
    movie.value = Get.arguments;
  }
}
