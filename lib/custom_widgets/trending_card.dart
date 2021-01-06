import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: _background(),
    );
  }

  Widget _background() {
    return SizedBox(
      height: Get.height * .25,
      width: Get.width * .80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          "https://static1.cbrimages.com/wordpress/wp-content/uploads/2019/02/how-to-train-your-dragon-hidden-world-header.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
