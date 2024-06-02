import 'package:flutter/material.dart';
import 'package:haruflix/02_final_movie/widgets/poster_image.dart';

class MainPageMovie extends StatelessWidget {
  final String? title;
  final String posterPath;
  final int id;
  final double width, height;
  final String heroTag;

  const MainPageMovie({
    super.key,
    required this.title,
    required this.posterPath,
    required this.id,
    required this.width,
    required this.height,
    required this.heroTag, // Hero tag 추가
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PosterImage(
          url: posterPath,
          width: width,
          height: height,
          id: id,
          heroTag: heroTag, // Hero tag 전달
        ),
        if (title != null)
          SizedBox(
            width: width,
            height: 17,
            child: Text(
              title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ),
      ],
    );
  }
}
