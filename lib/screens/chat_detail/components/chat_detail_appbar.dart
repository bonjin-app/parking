import 'package:flutter/material.dart';
import 'package:parking/models/user.dart';
import 'package:parking/widgets/custom_appbar.dart';
import 'package:parking/widgets/custom_title.dart';

class ChatDetailAppBar extends StatelessWidget with PreferredSizeWidget {
  final User receiver;

  ChatDetailAppBar({
    Key key,
    this.receiver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: CustomTitle(text: receiver.name),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
