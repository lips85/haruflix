import 'package:flutter/material.dart';
import 'package:haruflix/02_final_movie/screens/detail_screen.dart';

class PosterImage extends StatelessWidget {
  final String url;
  final double width, height;
  final int id;
  final String heroTag;

  const PosterImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    required this.id,
    required this.heroTag, // Hero tag 추가
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag, // 고유한 태그
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          PosterImageUri.string(url),
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PosterImageUri {
  static String string(String path) {
    return 'https://image.tmdb.org/t/p/w500/$path';
  }
}
