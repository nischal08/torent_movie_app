import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torrent_movie/utils/custom_color.dart';

class MovieCard extends StatelessWidget {
  List<String> _genreList = ["Sci-fi", "Action", "Comedy", "Horror"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .30,
      width: Get.width * .90,
      // color: Colors.blue,
      child: Stack(
        children: [
          Positioned(
            left: Get.width * .05,
            bottom: 0,
            child: _bottomCard(),
          ),
          Positioned(left: Get.width * .05, child: _movieCover()),
        ],
      ),
    );
  }

  Widget _bottomCard() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          _movieDetails(),
        ],
      ),
      height: Get.height * .25,
      width: Get.width * .9,
      decoration: BoxDecoration(
          color: CustomColors.background,
          boxShadow: _cardShadow(),
          borderRadius: BorderRadius.circular(15)),
    );
  }

  Widget _movieDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_title(), _ratingDuration(), _genres()],
      ),
    );
  }

  Widget _title() {
    return Text(
      'Avengers : End Game',
      style: TextStyle(
        color: CustomColors.primaryBlue,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _ratingDuration() {
    return Row(
      children: [
        Icon(
          Icons.star_rounded,
          color: CustomColors.orange,
        ),
        Text("8.7/10 IMDb"),
        Text("3hr 2min")
      ],
    );
  }

  Widget _genres() {
    return Container(
      // color: Colors.blue,
      height: 40,
      width: Get.width * .55,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [for (String genre in _genreList) _eachGenre(genre)],
        ),
      ),
    );
  }

  Widget _eachGenre(String genre) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
        decoration: BoxDecoration(
            color: CustomColors.lightPurple,
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          genre,
          style: TextStyle(fontSize: 12, color: CustomColors.lightBlue),
        ));
  }

  List<BoxShadow> _cardShadow() => <BoxShadow>[
        BoxShadow(
            offset: Offset(1.5, 1.5),
            color: CustomColors.shadow,
            blurRadius: 3,
            spreadRadius: 1)
      ];

  Widget _movieCover() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        "https://leonard-photo.com/wp-content/uploads/2015/01/Business-Headshot-Sample-4-300x450.jpg",
        height: Get.height * .25,
        width: Get.width * .30,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
