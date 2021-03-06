import 'package:movie_app/Module/Home/model/genre_model.dart';

class MovieDetailsModel {
  bool adult;
  String backdropPath;
  dynamic belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompanies> productionCompanies;
  List<ProductionCountries> productionCountries;
  String releaseDate;
  int revenue;
  dynamic runtime;
  List<SpokenLanguages> spokenLanguages;
  String status;
  dynamic tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetailsModel(
      {required this.adult,
      required this.backdropPath,
      required this.belongsToCollection,
      required this.budget,
      required this.genres,
      required this.homepage,
      required this.id,
      required this.imdbId,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.productionCompanies,
      required this.productionCountries,
      required this.releaseDate,
      required this.revenue,
      required this.runtime,
      required this.spokenLanguages,
      required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        belongsToCollection: json['belongs_to_collection'],
        budget: json['budget'],
        genres: json['genres'] != null
            ? json['genres'].map<Genre>((v) => Genre.fromJson(v)).toList()
            : null,
        homepage: json['homepage'],
        id: json['id'],
        imdbId: json['imdb_id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        productionCompanies: json['production_companies'] != null
            ? json['production_companies']
                .map<ProductionCompanies>((v) => ProductionCompanies.fromJson(v)).toList()
            : null,
        productionCountries: json['production_countries'] != null
            ? json['production_countries']
                .map<ProductionCountries>((v) => ProductionCountries.fromJson(v)).toList()
            : null,
        releaseDate: json['release_date'],
        revenue: json['revenue'],
        runtime: json['runtime'],
        spokenLanguages: json['spoken_languages'] != null
            ? json['spoken_languages'].map<SpokenLanguages>((v) => SpokenLanguages.fromJson(v)).toList()
            : null,
        status: json['status'],
        tagline: json['tagline'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['belongs_to_collection'] = this.belongsToCollection;
    data['budget'] = this.budget;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }

    data['homepage'] = this.homepage;
    data['id'] = this.id;
    data['imdb_id'] = this.imdbId;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    if (this.productionCompanies != null) {
      data['production_companies'] =
          this.productionCompanies.map((v) => v.toJson()).toList();
    }
    if (this.productionCountries != null) {
      data['production_countries'] =
          this.productionCountries.map((v) => v.toJson()).toList();
    }
    data['release_date'] = this.releaseDate;
    data['revenue'] = this.revenue;
    data['runtime'] = this.runtime;
    if (this.spokenLanguages != null) {
      data['spoken_languages'] =
          this.spokenLanguages.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class ProductionCompanies {
  int id;
  dynamic logoPath;
  String name;
  String originCountry;

  ProductionCompanies(
      {required this.id,
      required this.logoPath,
      required this.name,
      required this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) {
    return ProductionCompanies(
        id: json['id'],
        logoPath: json['logo_path'],
        name: json['name'],
        originCountry: json['origin_country']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class ProductionCountries {
  String iso31661;
  String name;

  ProductionCountries({required this.iso31661, required this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) {
    return ProductionCountries(
        iso31661: json['iso_3166_1'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }
}

class SpokenLanguages {
  String iso6391;
  String name;

  SpokenLanguages({required this.iso6391, required this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) {
    return SpokenLanguages(iso6391: json['iso_639_1'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }
}
