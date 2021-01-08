import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torrent_movie/model/listmovies.dart';
import 'package:torrent_movie/model/movie_details.dart' as md;
import 'package:torrent_movie/screens/detailed_page/cover_with_title.dart';
import 'package:torrent_movie/screens/detailed_page/detailController.dart';
import 'package:torrent_movie/utils/custom_color.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;
  DetailPage(this.movie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(Get.context).padding.top,
          ),
          CoverWithTitle(
            movie,
          ),
          SizedBox(
            height: 10.0,
          ),
          _rating(),
          _details(),
          _storyLine(),
          _fullCast()
        ],
      ),
    );
  }

  Widget _fullCast() {
    return GetBuilder(
        init: DetailController(movie.id),
        builder: (controller) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Cast",
                    style: TextStyle(
                      color: CustomColors.primaryBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _castList(controller),
                ],
              ),
            ));
  }

  Widget _castList(DetailController controller) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: controller.casts.length == 0
            ? [
                Center(
                  child: CircularProgressIndicator(),
                )
              ]
            : [
                for (var eachCast in controller.casts) _eachCastMember(eachCast)
              ],
      ),
    );
  }

  Widget _eachCastMember(md.Cast cast) {
    double imageSize = Get.width * .15;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              cast.urlSmallImage ??
                  "https://png.pngtree.com/png-vector/20190804/ourlarge/pngtree-avatar-male-people-profile-blue-icon-on-abstract-cloud-backgr-png-image_1650274.jpg",
              height: imageSize,
              width: imageSize,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            cast.name,
            style: TextStyle(
                color: CustomColors.primaryBlue, fontWeight: FontWeight.bold),
          ),
          Text(
            cast.characterName,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _storyLine() {
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
            movie.descriptionFull,
            style: TextStyle(color: Colors.grey.shade600),
          )
        ],
      ),
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
          _eachDetailText(label: "Release date: ", content: "${movie.year}"),
          _eachDetailText(label: "Director: ", content: ""),
          _eachDetailText(label: "Writers: ", content: ""),
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
        movie.largeCoverImage,
        height: Get.height * .3,
        width: Get.width * .35,
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
    return Center(
      child: Column(
        children: [
          Text(
            "${movie.rating}/10",
            style: style,
          ),
          Text(
            "IMDb",
            style: style,
          ),
        ],
      ),
    );
  }
}
