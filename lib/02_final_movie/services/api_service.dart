import 'dart:convert';

import 'package:haruflix/02_final_movie/models/movie_detail_model.dart';
import 'package:haruflix/02_final_movie/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';

  static Future<List<MovieModel>> getMovie(String parser) async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse("$baseUrl/$parser");
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

  static Future<MovieDetailModel> getMovieDetail(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
