import 'package:flutter/material.dart';
import 'package:haruflix/03_final_movie/models/movie_model.dart';
import 'package:haruflix/03_final_movie/services/api_service.dart';

import '../widgets/movie_widget.dart';

class HomeScreenHaruMovie extends StatelessWidget {
  HomeScreenHaruMovie({super.key});

  final Future<List<MovieModel>> movies = ApiService.getPopularMovie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'HaruFlix',
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: FutureBuilder(
        future: movies,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Expanded(
                    child: makeList(
                  snapshot,
                )),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<dynamic> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Movie(
          title: movie.title,
          id: movie.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
