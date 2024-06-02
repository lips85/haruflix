class MovieDetailModel {
  final String title, overView, posterPath;
  final double voteAverage;
  final int runtime, id;
  final List<String> genres;

  MovieDetailModel({
    required this.title,
    required this.voteAverage,
    required this.runtime,
    required this.genres,
    required this.overView,
    required this.posterPath,
    required this.id,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        voteAverage = json['vote_average'],
        runtime = json['runtime'],
        genres = (json['genres'] as List<dynamic>)
            .map((e) => e['name'] as String)
            .toList(),
        overView = json['overview'],
        posterPath = json['poster_path'],
        id = json['id'];
}
