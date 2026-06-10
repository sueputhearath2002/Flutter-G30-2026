import 'package:bloc/bloc.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/model/movie_mode.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/repository/movie_repository.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;

  MovieBloc(this.repository) : super(MovieInitial()) {
    on<LoadMovies>(_loadMovies);
  }

  Future<void> _loadMovies(LoadMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());

    try {
      final movies = await repository.searchMovie(event.query);
      emit(MovieLoaded(movies: movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}
