class Genre {
  int id;
  String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Genres {
  List<Genre> genres;

  Genres({required this.genres});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
        genres: json['genres'] != null
            ? json['genres'].map<Genre>((json) => Genre.fromJson(json)).toList()
            : null);
  }
}
