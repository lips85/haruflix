class MovieDetailModel {
  final String title;
  final double voteAverage;
  final int runtime;
  final List<String> genres;
  final String overView;

  MovieDetailModel({
    required this.title,
    required this.voteAverage,
    required this.runtime,
    required this.genres,
    required this.overView,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        voteAverage = json['vote_average'],
        runtime = json['runtime'],
        genres = (json['genres'] as List<dynamic>)
            .map((e) => e['name'] as String)
            .toList(),
        overView = json['overview'];
}
