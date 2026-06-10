import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/model/movie_mode.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/Getx/movieDetailGetX/page/detail_movie_screen.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/screen/Getx/movieGetX/controller/movie_getx_controller.dart';
import 'package:flutter2026/constant/colors.dart';
import 'package:get/get.dart';

class MovieGetxScreen extends GetView<MovieGetxController> {
  const MovieGetxScreen({super.key});

  //==============without Binding=============
  // final MovieGetxController controller = Get.put(
  //   MovieGetxController(repository: MovieRepository()),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie API with GetX")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              spacing: 8,
              children: [
                Flexible(
                  child: TextFormField(
                    controller: controller.searchMovieController,
                    onFieldSubmitted: (_) => controller.loadMovies,
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
                    onPressed: () => controller.loadMovies(
                      controller.searchMovieController.text,
                    ),
                    child: Text("search Movie"),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (controller.errorMessage.value.isNotEmpty) {
                  return Column(
                    children: [
                      Text(
                        controller.errorMessage.value,
                        style: TextStyle(color: Colors.red),
                      ),
                      ElevatedButton(
                        onPressed: () => controller.loadMovies,
                        child: Text('Try Again'),
                      ),
                    ],
                  );
                }

                if (controller.movies.isEmpty) {
                  return Center(child: Text("No movie found"));
                }

                return ListView.builder(
                  itemCount: controller.movies.length,
                  itemBuilder: (context, index) {
                    return buildMovieCard(controller.movies[index]);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMovieCard(MovieModel movie) {
    final movieData = movie.show;
    return InkWell(
      onTap: () {
        Get.toNamed('/movie-detail', arguments: movie);
        // ======without Binding
        // Get.to(DetailMovieScreen());
      },
      child: Card(
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
      ),
    );
  }
}
