part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

class LoadMovies extends MovieEvent {
  final String query;

  LoadMovies({this.query = 'avengers'});
}
