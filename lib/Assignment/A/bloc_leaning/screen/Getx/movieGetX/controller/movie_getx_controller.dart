import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/model/movie_mode.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/repository/movie_repository.dart';
import 'package:get/get.dart';

class MovieGetxController extends GetxController {
  final MovieRepository repository;

  MovieGetxController({required this.repository});

  TextEditingController searchMovieController = TextEditingController();
  final RxList<MovieModel> movies = <MovieModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadMovies('avengers');
  }

  Future<void> loadMovies(String? value) async {
    final query = (value ?? searchMovieController.text).trim();
    if (query.isEmpty) return;

    isLoading.value = true;
    errorMessage.value = "";

    try {
      final result = await repository.searchMovie(query);
      movies.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
