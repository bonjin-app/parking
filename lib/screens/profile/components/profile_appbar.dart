import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parking/screens/setting/setting_screen.dart';
import 'package:parking/widgets/custom_appbar.dart';

class ProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      centerTitle: false,
      title: Text(
        "나의 주차",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(
                  builder: (context) => SettingScreen(),
                ),
            );
          },
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
