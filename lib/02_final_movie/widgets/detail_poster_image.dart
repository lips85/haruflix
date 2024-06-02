import 'dart:ui';

import 'package:flutter/material.dart';

class DetailPosterImage extends StatelessWidget {
  final String url;
  final int id;

  const DetailPosterImage({
    super.key,
    required this.url,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            PosterImageUri.string(url),
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.5), // 이미지 투명도 적용
            colorBlendMode: BlendMode.darken,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), // 외곽 블러 처리
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}

class PosterImageUri {
  static String string(String path) {
    return 'https://image.tmdb.org/t/p/w500/$path';
  }
}
