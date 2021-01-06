import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:torrent_movie/screens/home/homeController.dart';
import 'package:torrent_movie/utils/custom_color.dart';

class Home extends StatelessWidget {
  HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _bottomNavBar(),
      body: _body(),
    );
  }

  Widget _body() {
    return GetBuilder(
        init: homeController,
        builder: (homeController) => homeController.homePages);
  }

  Widget _bottomNavBar() {
    return GetBuilder(
      init: homeController,
      builder: (homeController) => BottomNavigationBar(
        onTap: (index) {
          homeController.onNavbarItemTap(index);
        },
        currentIndex: homeController.navbarIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade800,
        backgroundColor: CustomColors.primaryBlue,
        items: _navbarItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _navbarItems() {
    return [
      _eachNavBarItem(iconData: FontAwesomeIcons.film, title: "Movies"),
      _eachNavBarItem(iconData: FontAwesomeIcons.fire, title: "Trending"),
    ];
  }

  BottomNavigationBarItem _eachNavBarItem({String title, IconData iconData}) {
    return BottomNavigationBarItem(
        icon: FaIcon(
          iconData,
        ),
        label: title);
  }
}
