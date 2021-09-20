import 'package:get/get.dart';
import 'package:movie_app/Module/Home/model/PopularResponse.dart';
import 'package:movie_app/Services/tmdb.dart';

class TopRatedState extends GetxController {
  RxList<Movies> movies = RxList<Movies>();
  RxInt currentPage = RxInt(1);
  RxInt totalPage = RxInt(2);

  fetchTopRatedMovies() async {
    if (currentPage.value < totalPage.value) {
      print(currentPage.value);
      TMDB tmdb = TMDB();
      await tmdb
          .getTopRated(page: currentPage.value.toString(), region: "US")
          .then((data) {
        print(data);
        data!.results.forEach((element) {
          movies.addIf(!movies.map((element) => element.id).contains(element.id),element);
        });

        totalPage.value = data.totalPages;
      });
    }
  }

  void loadNextPage() {
    print(24);
    currentPage++;
    fetchTopRatedMovies();
    update();
  }
}
