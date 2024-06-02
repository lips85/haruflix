import 'package:flutter/material.dart';
import 'package:haruflix/02_final_movie/widgets/poster_image.dart';

class MainPageMovie extends StatelessWidget {
  final String title;
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
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        PosterImage(
          url: posterPath,
          width: width,
          height: height,
          id: id,
          heroTag: heroTag, // Hero tag 전달
        ),
        LimitedBox(
          maxWidth: width,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black.withOpacity(0.01),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20,
                  )
                ]),
            child: Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "BebasNeue",
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                )),
          ),
        ),
      ],
    );
  }
}
