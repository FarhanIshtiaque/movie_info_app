import 'package:hive/hive.dart';
part 'favourite_adapter.g.dart';

@HiveType(typeId : 1)
class Favourite extends HiveObject{
  @HiveField(0)
  late int movieId;

  Favourite({required this.movieId});
}
