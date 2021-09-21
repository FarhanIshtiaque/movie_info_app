import 'package:get/get.dart';

class HomeState extends GetxController{

  final selectedId = 0.obs;

  setSelectedId(int id) {
    selectedId.value = id;
    update();
  }
}