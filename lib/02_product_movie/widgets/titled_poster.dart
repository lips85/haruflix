import 'package:flutter/material.dart';
import 'package:haruflix/02_product_movie/widgets/poster.dart';

class TitledPoster extends StatelessWidget {
  static double estimatedHeight(
      {required double imageSize, required String title}) {
    final textPainer = TextPainter(
      text: TextSpan(text: title, style: textStyle),
      maxLines: 3,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: imageSize);
    return imageSize + spacing + textPainer.height;
  }

  static const textStyle = TextStyle(fontWeight: FontWeight.w700, height: 1);
  static const double spacing = 8;

  final String urlString;
  final String title;
  final double imageSize;

  const TitledPoster({
    super.key,
    required this.urlString,
    required this.title,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Poster(
          urlString: urlString,
          width: imageSize,
          height: imageSize,
        ),
        const SizedBox(height: spacing),
        SizedBox(
          width: imageSize,
          child: Text(
            title,
            style: textStyle,
            maxLines: 3,
          ),
        )
      ],
    );
  }
}
