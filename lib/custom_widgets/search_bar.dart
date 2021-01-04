import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torrent_movie/utils/custom_color.dart';

class SearchBar extends StatelessWidget {
  final border = OutlineInputBorder(borderRadius: BorderRadius.circular(100));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: SizedBox(
        width: Get.width * .8,
        child: TextField(
          decoration: InputDecoration(
              hintText: "Type something",
              isDense: true,
              filled: true,
              // contentPadding: EdgeInsets.only(left: 20),
              fillColor: CustomColors.background,
              focusedBorder: border,
              enabledBorder: border),
        ),
      ),
    );
  }
}
