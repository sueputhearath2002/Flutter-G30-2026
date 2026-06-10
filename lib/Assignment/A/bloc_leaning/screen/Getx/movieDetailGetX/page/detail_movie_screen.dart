import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter2026/Assignment/A/bloc_leaning/model/movie_mode.dart';
import 'package:get/get.dart';

class DetailMovieScreen extends StatelessWidget {
  const DetailMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieModel movie = Get.arguments;
    final show = movie.show;
    return Scaffold(
      appBar: AppBar(title: Text(show?.name ?? "Movie Detial")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 350,
              width: double.infinity,
              imageUrl: (show?.image?.original ?? show?.image?.medium) ?? "",
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  Text(
                    show?.name ?? "",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  Row(
                    spacing: 4,
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text((show?.rating?.average).toString()),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    children: (show?.genres ?? [])
                        .map((genre) => Chip(label: Text(genre)))
                        .toList(),
                  ),
                  Text(show?.summary ?? ""),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
