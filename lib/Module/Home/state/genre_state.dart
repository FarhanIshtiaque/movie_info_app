import 'package:get/get.dart';
import 'package:movie_app/Module/Home/model/genre_model.dart';
import 'package:movie_app/Services/tmdb.dart';

class GenresState extends GetxController {
  var list = [].obs;

  getGenres() async {
    await TMDB().fetchGenres().then((data) {
      list.value = data.genres;
      update();
    });
  }

  String getString(List<int> genreIds) {
   return list.value.where((item) => genreIds.contains(item.id)).map((e) => e.name).join(', ');
  }
}
