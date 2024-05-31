import 'package:flutter/material.dart';
import 'package:haruflix/02_final_movie/widgets/poster_image.dart';

class Movie extends StatelessWidget {
  final String? title;
  final String posterPath;
  final int id;
  final double width, height;

  const Movie({
    super.key,
    required this.title,
    required this.posterPath,
    required this.id,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PosterImage(
          url: posterPath,
          width: width,
          height: height,
        ),
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
