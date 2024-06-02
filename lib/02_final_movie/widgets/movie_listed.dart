import 'package:flutter/material.dart';
import 'package:haruflix/02_final_movie/models/movie_model.dart';
import 'package:haruflix/02_final_movie/screens/detail_screen.dart';
import 'package:haruflix/02_final_movie/widgets/movie_widget.dart';

class MovieListed extends StatelessWidget {
  final List<MovieModel> movies;
  final double width, height;
  final bool istitle;
  final String tag;

  const MovieListed({
    super.key,
    required this.movies,
    required this.width,
    required this.height,
    required this.istitle,
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
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      DetailScreen(
                    movieId: movie.id,
                    posterPath: movie.posterPath,
                    heroTag: heroTag,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: MainPageMovie(
              title: istitle ? movie.title : null,
              posterPath: movie.posterPath,
              id: movie.id,
              width: width,
              height: height,
              heroTag: heroTag,
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
