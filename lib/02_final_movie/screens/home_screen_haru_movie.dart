import 'package:flutter/material.dart';
import 'package:haruflix/02_final_movie/models/movie_model.dart';
import 'package:haruflix/02_final_movie/services/api_service.dart';
import 'package:haruflix/02_final_movie/widgets/movie_listed.dart';

class HomeScreenHaruMovie extends StatelessWidget {
  HomeScreenHaruMovie({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('HaruFlix'),
      ),
      body: SafeArea(
        child: FutureBuilder<List<MovieModel>>(
          future: popularMovies,
          builder:
              (BuildContext context, AsyncSnapshot<List<MovieModel>> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular Movies',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Expanded(
                      child: MovieListed(
                        istitle: false,
                        movies: snapshot.data!,
                        width: 300,
                        height: 200,
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
