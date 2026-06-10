import 'dart:convert';

import 'package:flutter2026/Assignment/A/bloc_leaning/model/movie_mode.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  final http.Client _client;

  MovieRepository({http.Client? client}) : _client = client ?? http.Client();

  Future<List<MovieModel>> searchMovie(String query) async {
    final uri = Uri.parse("https://api.tvmaze.com/search/shows?q=$query");

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load movies. Status code. ${response.statusCode}',
      );
    }

    final data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((item) => MovieModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
