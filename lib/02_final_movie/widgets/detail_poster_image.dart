import 'package:flutter/material.dart';

class DetailPosterImage extends StatelessWidget {
  final String url;
  final double width, height;
  final int id;

  const DetailPosterImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        PosterImageUri.string(url),
        fit: BoxFit.cover,
        scale: 1,
      ),
    );
  }
}

class PosterImageUri {
  static String string(String path) {
    return 'https://image.tmdb.org/t/p/w500/$path';
  }
}
