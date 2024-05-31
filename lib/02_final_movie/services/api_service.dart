import 'dart:convert';

import 'package:haruflix/02_final_movie/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String popular = "popular";

  static Future<List<MovieModel>> getPopularMovie() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse("$baseUrl/$popular");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);
      final List<dynamic> movies = responseJson['results'];

      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    } else {
      throw Exception('Failed to load data');
    }
  }

//   static Future<WebtoonDetailModel> getWebtoonDetail(String id) async {
//     final url = Uri.parse("$baseUrl/$id");
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final webtoon = jsonDecode(response.body);
//       return WebtoonDetailModel.fromJson(webtoon);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   static Future<List<WebtoonEpisodeModel>> getLatestEpisodesByID(
//       String id) async {
//     List<WebtoonEpisodeModel> episodeInstances = [];
//     final url = Uri.parse("$baseUrl/$id/episodes");
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final episodes = jsonDecode(response.body);
//       for (var episode in episodes) {
//         episodeInstances.add(WebtoonEpisodeModel.fromJson(episode));
//       }
//       return episodeInstances;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
}
