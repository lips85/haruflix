class MovieModel {
  final int id;
  final String title;
  final String posterPath;
  final dynamic voteAverage;

  MovieModel(
    this.voteAverage, {
    required this.id,
    required this.posterPath,
    required this.title,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        voteAverage = json['vote_average'],
        posterPath = json['poster_path'],
        title = json['title'];
}
