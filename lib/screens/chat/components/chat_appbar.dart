import 'package:flutter/material.dart';
import 'package:parking/widgets/custom_appbar.dart';

class ChatAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      centerTitle: false,
      title: Text(
        "채팅",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
