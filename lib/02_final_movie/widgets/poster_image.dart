import 'package:flutter/material.dart';

class PosterImage extends StatelessWidget {
  final String url;
  final double width, height;

  const PosterImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
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
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}

class PosterImageUri {
  static String string(String path) {
    return 'https://image.tmdb.org/t/p/w500/$path';
  }
}
