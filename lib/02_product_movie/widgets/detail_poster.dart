import 'package:flutter/material.dart';
import 'package:haruflix/02_product_movie/services/poster/image_uri.dart';

class DetailPoster extends StatelessWidget {
  final String urlString;
  final double width;
  final double height;

  const DetailPoster({
    super.key,
    required this.urlString,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        ImageUri.string(urlString),
        fit: BoxFit.cover,
        scale: 1,
      ),
    );
  }
}
