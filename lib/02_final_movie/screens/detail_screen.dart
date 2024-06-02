import 'package:flutter/material.dart';
import 'package:haruflix/02_final_movie/models/movie_detail_model.dart';
import 'package:haruflix/02_final_movie/services/api_service.dart';
import 'package:haruflix/02_final_movie/widgets/detail_poster_image.dart';
import 'package:haruflix/02_final_movie/widgets/poster_image.dart';

class DetailScreen extends StatelessWidget {
  final int movieId;
  final String posterPath;
  final String heroTag;

  const DetailScreen({
    super.key,
    required this.movieId,
    required this.posterPath,
    required this.heroTag, // Hero tag 추가
  });

  List<Widget> _buildStarRating(double voteAverage) {
    List<Widget> stars = [];
    int fullStars = voteAverage ~/ 2;
    bool hasHalfStar = (voteAverage % 2) >= 1;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.yellow));
    }

    if (hasHalfStar) {
      stars.add(const Icon(Icons.star_half, color: Colors.yellow));
    }

    for (int i = 0; i < emptyStars; i++) {
      stars.add(Icon(Icons.star_border, color: Colors.yellow.withOpacity(0.5)));
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Back to list",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder<MovieDetailModel>(
            future: ApiService.getMovieDetail(movieId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final movie = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: heroTag,
                        child: DetailPosterImage(
                          url: movie.posterPath,
                          width: 400,
                          height: 600,
                          id: movie.id,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ..._buildStarRating(movie.voteAverage),
                          const SizedBox(width: 5),
                          Text('${movie.voteAverage} / 10'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Runtime: ${movie.runtime} minutes',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Genres: ${movie.genres.join(', ')}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        movie.overView,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
