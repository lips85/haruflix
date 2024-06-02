import 'package:flutter/material.dart';
import 'package:haruflix/02_final_movie/constants/gaps.dart';
import 'package:haruflix/02_final_movie/constants/sizes.dart';
import 'package:haruflix/02_final_movie/models/movie_model.dart';
import 'package:haruflix/02_final_movie/services/api_service.dart';
import 'package:haruflix/02_final_movie/widgets/movie_listed.dart';

class HomeScreenHaruMovie extends StatelessWidget {
  HomeScreenHaruMovie({super.key});

  final Future<List<MovieModel>> popularMovie = ApiService.getMovie("popular");

  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getMovie("now-playing");

  final Future<List<MovieModel>> comingSoonMovie =
      ApiService.getMovie("coming-soon");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "HARUFLIX",
          style: TextStyle(
            fontFamily: "BebasNeue",
            color: Colors.red,
            fontSize: Sizes.size32,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              MovieBuilder(
                text: "Popular Movies",
                movieList: popularMovie,
                width: 350,
                height: 250,
                istitle: false,
                tag: "popular",
              ),
              Gaps.v20,
              MovieBuilder(
                text: "Now Playing Movies",
                movieList: nowPlayingMovies,
                width: 180,
                height: 150,
                istitle: true,
                tag: "now",
              ),
              Gaps.v20,
              MovieBuilder(
                text: "Coming Soon Movies",
                movieList: comingSoonMovie,
                width: 180,
                height: 150,
                istitle: true,
                tag: "comming",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieBuilder extends StatelessWidget {
  final Future<List<MovieModel>> movieList;
  final double width, height;
  final bool istitle;
  final String text, tag;

  const MovieBuilder({
    super.key,
    required this.movieList,
    required this.width,
    required this.height,
    required this.istitle,
    required this.text,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: movieList,
      builder:
          (BuildContext context, AsyncSnapshot<List<MovieModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          List<MovieModel> sortedMovies = snapshot.data!;
          sortedMovies.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));
          snapshot.data!.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Gaps.v10,
                MovieListed(
                  tag: tag,
                  istitle: istitle,
                  movies: snapshot.data!,
                  width: width,
                  height: height,
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
