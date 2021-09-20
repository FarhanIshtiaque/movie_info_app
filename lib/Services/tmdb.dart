import 'package:dio/dio.dart';
import 'package:movie_app/Module/Details_Page/model/movie_details_model.dart';
import 'package:movie_app/Module/Home/model/PopularResponse.dart';
import 'package:movie_app/Module/Home/model/genre_model.dart';
import 'package:movie_app/Module/Home/model/popular_request.dart';

class TMDB {
  static const String imageUrl = 'https://image.tmdb.org/t/p/w200';
  static const String imageUrlDetails = 'https://image.tmdb.org/t/p/w500';
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = '46d6718883903f0428e3c06cd4c38c12';
  final String language = 'en-US';

  late Dio dio;

  TMDB() {
    BaseOptions options = new BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000 // 60 seconds
    );

    dio = new Dio(options);
  }

  Future<PopularResponse?> getPopular({
    required String page,
    required String region}) async {
    PopularRequest pr = PopularRequest(
        api_key: this.apiKey,
        language: this.language,
        page: page,
        region: region);
    try {
      Response response =
      await dio.get("/movie/popular", queryParameters: pr.toMap());
      return PopularResponse.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      print(ex);
      throw Exception(ex.message);
    }
  }


  Future<Genres> fetchGenres() async {
    try {
      Response response = await dio.get('/genre/movie/list', queryParameters: {
        'api_key': this.apiKey, 'language': this.language
      });
      return Genres.fromJson(response.data);
    }
    on DioError catch(ex){
      throw Exception(ex.message);
    }
  }

  Future<MovieDetailsModel> fetchMovieById(int id) async {
    try {
      Response response = await dio.get('/movie/${id}', queryParameters: {
        'api_key': this.apiKey,
      });
      return MovieDetailsModel.fromJson(response.data);
    }
    on DioError catch(ex){
      throw Exception(ex.message);
    }
  }
}

