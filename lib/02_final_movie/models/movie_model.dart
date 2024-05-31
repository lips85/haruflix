class MovieModel {
  final int id;
  final String title;
  final String posterPath;

  MovieModel({
    required this.id,
    required this.posterPath,
    required this.title,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        posterPath = json['poster_path'],
        title = json['title'];
}
