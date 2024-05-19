
class Episode {
  String? thumb;
  String? id;
  String? title;
  String? rating;
  String? date;

  Episode({this.thumb, this.id, this.title, this.rating, this.date});

  Episode.fromJson(Map<String, dynamic> json) {
    if(json["thumb"] is String) {
      thumb = json["thumb"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["rating"] is String) {
      rating = json["rating"];
    }
    if(json["date"] is String) {
      date = json["date"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["thumb"] = thumb;
    _data["id"] = id;
    _data["title"] = title;
    _data["rating"] = rating;
    _data["date"] = date;
    return _data;
  }
}