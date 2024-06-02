import 'package:flutter/material.dart';
import 'package:haruflix/02_final_movie/constants/gaps.dart';
import 'package:haruflix/02_final_movie/constants/sizes.dart';
import 'package:haruflix/02_final_movie/models/movie_model.dart';
import 'package:haruflix/02_final_movie/services/api_service.dart';
import 'package:haruflix/02_final_movie/widgets/movie_listed.dart';

class HomeScreenHaruMovie extends StatefulWidget {
  const HomeScreenHaruMovie({super.key});

  @override
  State<HomeScreenHaruMovie> createState() => _HomeScreenHaruMovieState();
}

class _HomeScreenHaruMovieState extends State<HomeScreenHaruMovie> {
  late Future<List<MovieModel>> popularMovie;
  late Future<List<MovieModel>> nowPlayingMovies;
  late Future<List<MovieModel>> comingSoonMovie;

  @override
  void initState() {
    super.initState();
    popularMovie = ApiService.getMovie("popular");
    nowPlayingMovies = ApiService.getMovie("now-playing");
    comingSoonMovie = ApiService.getMovie("coming-soon");
  }

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
            letterSpacing: 0.1,
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
                tag: "popular",
              ),
              Gaps.v20,
              MovieBuilder(
                text: "Now Playing Movies",
                movieList: nowPlayingMovies,
                width: 180,
                height: 150,
                tag: "now",
              ),
              Gaps.v20,
              MovieBuilder(
                text: "Coming Soon Movies",
                movieList: comingSoonMovie,
                width: 180,
                height: 150,
                tag: "coming",
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
  final String text, tag;

  const MovieBuilder({
    super.key,
    required this.movieList,
    required this.width,
    required this.height,
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontFamily: "BebasNeue",
                    color: Colors.white,
                    fontSize: Sizes.size32,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                MovieListed(
                  tag: tag,
                  movies: sortedMovies,
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
