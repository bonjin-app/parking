import 'package:flutter/material.dart';
import 'package:parking/widgets/custom_appbar.dart';

class CategoryAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      centerTitle: false,
      title: Text(
        "카테고리",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
          },
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
          },
          icon: Icon(
            Icons.notifications_none,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
