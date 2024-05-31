import 'package:flutter/material.dart';
import 'package:haruflix/02_final_movie/models/movie_model.dart';
import 'package:haruflix/02_final_movie/widgets/movie_widget.dart';

class MovieListed extends StatelessWidget {
  final List<MovieModel> movies;
  final double width, height;
  final bool istitle;

  const MovieListed({
    super.key,
    required this.movies,
    required this.width,
    required this.height,
    required this.istitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height + 20,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          var movie = movies[index];
          if (istitle) {
            return Movie(
              title: movie.title,
              posterPath: movie.posterPath,
              id: movie.id,
              width: width,
              height: height,
            );
          } else {
            return Movie(
              title: null,
              posterPath: movie.posterPath,
              id: movie.id,
              width: width,
              height: height,
            );
          }
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
