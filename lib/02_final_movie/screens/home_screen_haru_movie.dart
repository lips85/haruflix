import 'package:flutter/material.dart';
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
        title: const Text('HaruFlix'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              MovieBuilder(
                text: "Popular Movies",
                movieList: popularMovie,
                width: 300,
                height: 200,
                istitle: false,
              ),
              MovieBuilder(
                text: "Now Playing Movies",
                movieList: nowPlayingMovies,
                width: 150,
                height: 150,
                istitle: true,
              ),
              MovieBuilder(
                text: "Now Playing Movies",
                movieList: comingSoonMovie,
                width: 150,
                height: 150,
                istitle: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieBuilder extends StatelessWidget {
  const MovieBuilder({
    super.key,
    required this.movieList,
    required this.width,
    required this.height,
    required this.istitle,
    required this.text,
  });

  final Future<List<MovieModel>> movieList;
  final double width, height;
  final bool istitle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: movieList,
      builder:
          (BuildContext context, AsyncSnapshot<List<MovieModel>> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                MovieListed(
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
