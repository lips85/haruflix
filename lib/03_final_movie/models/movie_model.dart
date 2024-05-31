class MovieModel {
  final int id;
  final String title;

  MovieModel({
    required this.id,
    required this.title,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'];
}
