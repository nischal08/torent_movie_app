import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torrent_movie/custom_widgets/search_bar.dart';
import 'package:torrent_movie/custom_widgets/trending_card.dart';
import 'package:torrent_movie/utils/custom_color.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            _eachTopTrending(),
            _eachTopTrending(),
            _eachTopTrending(),
          ],
        ),
      ),
    );
  }

  Widget _eachTopTrending() {
    return TrendingCard();
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
