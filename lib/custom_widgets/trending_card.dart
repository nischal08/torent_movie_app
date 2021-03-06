import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TrendingCard extends StatelessWidget {
  List<String> _genreList = ["Sci-fi", "Action", "Comedy", "Horror"];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(DetailPage());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: SizedBox(
            height: Get.height * .25,
            width: Get.width * .80,
            child: Stack(children: [
              _background(),
              _opacity(),
              _movieInfo(),
            ])),
      ),
    );
  }

  Widget _opacity() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        height: Get.height * .25,
        width: Get.width * .80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _movieInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              SizedBox(
                height: 10,
              ),
              _duration(),
            ],
          ),
          _genres(),
        ],
      ),
    );
  }

  Widget _duration() {
    return Text(
      "1h 44min",
      style: TextStyle(
        color: Colors.grey.shade300,
      ),
    );
  }

  Widget _title() {
    return RichText(
      text: TextSpan(
          text: "How To Train Your Dragon: The Hidden World",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: "(2019)",
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 14,
                ))
          ]),
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
            color: Colors.black38, borderRadius: BorderRadius.circular(50)),
        child: Text(
          genre,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ));
  }

  Widget _background() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        "https://static1.cbrimages.com/wordpress/wp-content/uploads/2019/02/how-to-train-your-dragon-hidden-world-header.jpg",
        fit: BoxFit.fitHeight,
        height: Get.height * .25,
      ),
    );
  }
}
