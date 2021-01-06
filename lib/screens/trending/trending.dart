import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:torrent_movie/custom_widgets/search_bar.dart';
import 'package:torrent_movie/custom_widgets/trending_card.dart';
import 'package:torrent_movie/utils/custom_color.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Ink(
            height: Get.height * .43,
            width: Get.width,
            child: Stack(children: [
              _appbar(),
              Positioned(bottom: 0, child: _topTrendings()),
            ]),
          ),
          _category(),
          SizedBox(
            height: 15,
          ),
          _recent(),
          SizedBox(
            height: Get.height * .4,
          )
        ],
      ),
    );
  }

  Widget _recent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent",
            style: TextStyle(
                color: CustomColors.primaryBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          _recentCards()
        ],
      ),
    );
  }

  Widget _recentCards() {
    return Wrap(
      runSpacing: 20,
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 20,
      children: [
        _recentCard(),
        _recentCard(),
        _recentCard(),
        _recentCard(),
        _recentCard(),
        _recentCard(),
        _recentCard(),
        _recentCard(),
      ],
    );
  }

  Widget _recentCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width * .4,
          height: Get.height * .35,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Toy story",
          style: TextStyle(
              color: CustomColors.primaryBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _category() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        _head(),
        _categoryItems(),
      ],
    );
  }

  Widget _head() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Category",
            style: TextStyle(
                color: CustomColors.primaryBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          _seeMoreBtn(),
        ],
      ),
    );
  }

  Widget _seeMoreBtn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(50)),
      child: Text("See More"),
    );
  }

  Widget _categoryItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _eachCategoryItem(iconData: FontAwesomeIcons.piedPiper, text: "Action"),
        _eachCategoryItem(
            iconData: FontAwesomeIcons.solidLaugh, text: "Comedy"),
        _eachCategoryItem(iconData: FontAwesomeIcons.robot, text: "Sci-fi"),
        _eachCategoryItem(
            iconData: FontAwesomeIcons.solidHeart, text: "Romance"),
      ],
    );
  }

  Widget _eachCategoryItem({String text, IconData iconData}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10)),
          child: FaIcon(
            iconData,
            color: CustomColors.primaryBlue,
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
              color: CustomColors.primaryBlue, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _topTrendings() {
    return Container(
      height: Get.height * .25,
      width: Get.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TrendingCard(),
            TrendingCard(),
            TrendingCard(),
            TrendingCard(),
            TrendingCard(),
          ],
        ),
      ),
    );
  }

  Widget _appbar() {
    return Stack(
      children: [
        Container(
          height: Get.height * .30,
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColors.primaryBlue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        Positioned(
          right: -70,
          top: -50,
          child: Container(
            height: Get.height * .3,
            width: Get.height * .3,
            decoration: BoxDecoration(
                // borderRadius:
                //     BorderRadius.only(bottomRight: Radius.circular(20)),
                color: CustomColors.lightBlue,
                shape: BoxShape.circle),
          ),
        ),
        Positioned(
            top: 10,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                    _searchBar(),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Trending",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ],
    );
  }

  Widget _searchBar() {
    return SearchBar();
  }
}
