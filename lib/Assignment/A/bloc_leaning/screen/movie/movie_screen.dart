import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/model/movie_mode.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/movie/bloc/movie_bloc.dart';
import 'package:flutter2026/constant/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  TextEditingController searchMovieController = TextEditingController();

  void searchMovie(BuildContext context) {
    final query = searchMovieController.text.trim();
    if (query.isEmpty) return;

    context.read<MovieBloc>().add(LoadMovies(query: query));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie API with Bloc")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              spacing: 8,
              children: [
                Flexible(
                  child: TextFormField(
                    controller: searchMovieController,
                    onFieldSubmitted: (_) => searchMovie(context),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      label: Text("Movie"),
                      hintText: "Search Movie...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.black, width: 3),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () => searchMovie(context),
                    child: Text("search Movie"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is MovieLoaded) {
                    if (state.movies.isEmpty) {
                      return Text("No movies found");
                    }

                    return ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        return buildMovieCard(state.movies[index]);
                      },
                    );
                  }

                  if (state is MovieError) {
                    return Column(
                      spacing: 16,
                      children: [
                        Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),

                        ElevatedButton(
                          onPressed: () => searchMovie(context),
                          child: Text("Try Again"),
                        ),
                      ],
                    );
                  }

                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMovieCard(MovieModel movie) {
    final movieData = movie.show;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: movieData?.image?.original ?? "",
              height: 54,
              width: 54,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieData?.name ?? "",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Text(movieData?.rating?.average.toString() ?? ""),
                      ],
                    ),

                    Row(
                      children: List.generate(
                        (movieData?.genres ?? []).length,
                        (index) {
                          final genres = movieData?.genres?[index];
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              genres?[index] ?? "",
                              style: TextStyle(
                                fontSize: 13,
                                overflow: TextOverflow.ellipsis,
                                color: ColorStyle.blueColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        movieData?.summary ?? "",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
