import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .30,
      width: Get.width * .90,
      color: Colors.blue,
      child: Stack(
        children: [
          _bottomCard(),
          _movieCover(),
        ],
      ),
    );
  }

  Widget _bottomCard() {
    return SizedBox();
  }

  Widget _movieCover() {
    return SizedBox();
  }
}
