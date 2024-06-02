import 'package:flutter/material.dart';
import 'package:haruflix/02_final_movie/models/movie_model.dart';
import 'package:haruflix/02_final_movie/screens/detail_screen.dart';
import 'package:haruflix/02_final_movie/widgets/main_page_movie.dart';

class MovieListed extends StatelessWidget {
  final List<MovieModel> movies;
  final double width, height;

  final String tag;

  const MovieListed({
    super.key,
    required this.movies,
    required this.width,
    required this.height,
    required this.tag,
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
          var heroTag = '$tag-${movie.id}';

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMovieScreen(
                    movieId: movie.id,
                    posterPath: movie.posterPath,
                    heroTag: heroTag,
                  ),
                  fullscreenDialog: true,
                ),
              );
            },
            child: MainPageMovie(
              title: movie.title,
              posterPath: movie.posterPath,
              id: movie.id,
              width: width,
              height: height,
              heroTag: heroTag, // Hero tag 전달
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
