import 'package:get/get.dart';

class MoviesController extends GetxController {
  int currentIndex = 0;

  onTabClick(int index) {
    currentIndex = index;
    update();
  }
}
