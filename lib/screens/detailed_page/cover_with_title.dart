import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoverWithTitle extends StatelessWidget {
  final List<String> _genreList = [
    "Animation",
    "Action",
    "Adventure",
  ];

  @override
  Widget build(BuildContext context) {
    return coverWithTitle();
  }

  Widget coverWithTitle() {
    return SizedBox(
        height: Get.height * .25,
        width: Get.width,
        child: Stack(children: [
          _background(),
          _opacity(),
          _movieInfo(),
        ]));
  }

  _backBtn() {
    return IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          Get.back();
        });
  }

  Widget _opacity() {
    return Opacity(
      opacity: 0.3,
      child: Container(
        height: Get.height * .25,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _movieInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _backBtn(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _title(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _review(),
                  SizedBox(
                    width: 40,
                  ),
                  _duration(),
                ],
              ),
              _genres(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _review() {
    return Text(
      "1456 reviews",
      style: TextStyle(
        color: Colors.grey.shade300,
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
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      child: Image.network(
        "https://static1.cbrimages.com/wordpress/wp-content/uploads/2019/02/how-to-train-your-dragon-hidden-world-header.jpg",
        fit: BoxFit.cover,
        width: Get.width,
      ),
    );
  }
}
