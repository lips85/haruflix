class MovieDetailModel {
  final String title;
  final double rating;
  final int runtime;
  final List<String> genres;
  final String storyline;

  MovieDetailModel({
    required this.title,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.storyline,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        rating = json['vote_average'],
        runtime = json['runtime'],
        genres = (json['genres'] as List<dynamic>)
            .map((e) => e['name'] as String)
            .toList(),
        storyline = json['overview'];
}
