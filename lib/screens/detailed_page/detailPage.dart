import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torrent_movie/screens/detailed_page/cover_with_title.dart';
import 'package:torrent_movie/utils/custom_color.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(Get.context).padding.top,
        ),
        _coverWithTitle(),
        SizedBox(
          height: 10.0,
        ),
        _rating(),
        _details(),
        _storyLine(),
      ],
    );
  }

  Widget _storyLine() {
    final _description =
        "As Hiccup fulfills his dreams of creating a peaceful dragon utopia, Toothless' discovery of an untamed, elusive mate draws the Night Fury away. When danger mounts at home and Hiccup's reign as village chief is tested, both dragon and rider must make impossible decisions to save their kind. Written by JC Jamison";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "StoryLine",
            style: TextStyle(
                color: CustomColors.primaryBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            _description,
            style: TextStyle(color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }

  Widget _coverWithTitle() {
    return Stack(
      children: [CoverWithTitle()],
    );
  }

  Widget _details() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _detailsText(),
          SizedBox(
            width: 20,
          ),
          _movieCover(),
        ],
      ),
    );
  }

  Widget _detailsText() {
    return SizedBox(
      width: Get.width * .55,
      height: Get.height * .25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _eachDetailText(label: "Release date: ", content: "January 9, 2019"),
          _eachDetailText(label: "Director: ", content: "Dean DeBlois"),
          _eachDetailText(
              label: "Writers: ", content: "Dean BeBlois, Cressida Cowell"),
        ],
      ),
    );
  }

  Widget _eachDetailText({String label, String content}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            label,
            style: TextStyle(
              color: CustomColors.primaryBlue,
            ),
          ),
        ),
        Flexible(
          child: Text(
            content,
            style: TextStyle(
                color: CustomColors.primaryBlue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _movieCover() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        "https://static1.cbrimages.com/wordpress/wp-content/uploads/2019/02/how-to-train-your-dragon-hidden-world-header.jpg",
        height: Get.height * .3,
        width: Get.width * .3,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _rating() {
    TextStyle style = TextStyle(
      color: CustomColors.primaryBlue,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    return Column(
      children: [
        Text(
          "7.6/10",
          style: style,
        ),
        Text(
          "IMDb",
          style: style,
        ),
      ],
    );
  }
}
