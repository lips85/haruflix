import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haruflix/02_final_movie/constants/gaps.dart';
import 'package:haruflix/02_final_movie/constants/sizes.dart';
import 'package:haruflix/02_final_movie/models/movie_detail_model.dart';
import 'package:haruflix/02_final_movie/services/api_service.dart';
import 'package:haruflix/02_final_movie/widgets/detail_poster_image.dart';

class DetailMovieScreen extends StatefulWidget {
  final int movieId;
  final String posterPath;
  final String heroTag;

  const DetailMovieScreen({
    super.key,
    required this.movieId,
    required this.posterPath,
    required this.heroTag,
  });

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  List<Widget> _buildStarRating(double voteAverage) {
    List<Widget> stars = [];
    int fullStars = voteAverage ~/ 2;
    bool hasHalfStar = (voteAverage % 2) >= 1;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    for (int i = 0; i < fullStars; i++) {
      stars.add(
        const FaIcon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: Sizes.size20,
        ),
      );
    }

    if (hasHalfStar) {
      stars.add(
        const FaIcon(
          FontAwesomeIcons.solidStarHalfStroke,
          color: Colors.yellow,
          size: Sizes.size20,
        ),
      );
    }

    for (int i = 0; i < emptyStars; i++) {
      stars.add(
        FaIcon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow.withOpacity(0.5),
          size: Sizes.size20,
        ),
      );
    }

    return stars;
  }

  late Future<MovieDetailModel> movieDetail;

  @override
  void initState() {
    super.initState();
    movieDetail = ApiService.getMovieDetail(widget.movieId);
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
      body: SafeArea(
        child: FutureBuilder<MovieDetailModel>(
          future: movieDetail,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Hero(
                tag: widget.heroTag,
                child: DetailPosterImage(
                  url: widget.posterPath,

                  id: widget.movieId,
                  // Hero tag 전달
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final movie = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Hero(
                        tag: widget.heroTag,
                        child: DetailPosterImage(
                          url: movie.posterPath,
                          id: movie.id,
                          // Hero tag 전달
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gaps.v40,
                              Text(
                                movie.title,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              Gaps.v40,
                              Row(
                                children: [
                                  ..._buildStarRating(movie.voteAverage),
                                  const SizedBox(width: 5),
                                  Text('${movie.voteAverage} / 10'),
                                ],
                              ),
                              Gaps.v40,
                              Text(
                                'Runtime: ${movie.runtime} minutes',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Gaps.v40,
                              Text(
                                'Genres: ${movie.genres.join(', ')}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Gaps.v40,
                              Text(
                                movie.overView,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
