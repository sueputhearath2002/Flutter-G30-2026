part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<MovieModel> movies;

  MovieLoaded({required this.movies});
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}
