import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torrent_movie/api/api.dart';
import 'package:torrent_movie/custom_widgets/movie_card.dart';
import 'package:torrent_movie/model/listmovies.dart';

class MoviesController extends GetxController {
  MoviesController() {
    _getMovieList();
  }
  int currentIndex = 0;

  List<Widget> _movieList = [
    Center(
      child: CircularProgressIndicator(),
    )
  ];

  List<Widget> get movieList => _movieList;

  onTabClick(int index) {
    currentIndex = index;
    update();
  }

  _getMovieList() async {
    ListMovies listMovies = await Api.listMovies();
    List<Widget> _tempList = List();
    for (var eachMovie in listMovies.data.movies) {
      _tempList.add(MovieCard(eachMovie));
    }
    _movieList = _tempList;
    update();
  }
}
