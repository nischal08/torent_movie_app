import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:torrent_movie/screens/movies/movies.dart';
import 'package:torrent_movie/screens/trending/trending.dart';

class HomeController extends GetxController {
  int navbarIndex = 1;

  onNavbarItemTap(index) {
    navbarIndex = index;
    update();
  }

  List<Widget> _homePages = [Movies(), Trending()];

  Widget get homePages => _homePages[navbarIndex];
}
