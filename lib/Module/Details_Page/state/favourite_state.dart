import 'package:get/get.dart';

class FavouriteState extends GetxController {
  RxList<dynamic> favourites= RxList();


  addToFavourite(int id){
    favourites.add(id);
  }

  deleteFromFavourite(int i){
    favourites.removeAt(i);
  }


  setFavs(List<dynamic> ids){
    favourites.addAll(ids);
  }
}
