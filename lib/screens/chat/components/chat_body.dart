import 'package:flutter/material.dart';
import 'package:parking/widgets/custom_tile.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 20,
      itemBuilder: (context, index) {
        return CustomTile(
          onTap: () {

          },
          title: Text(
            "이름",
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          subtitle: Text("메시지"),
          leading: Container(
            constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage("https://img.hankyung.com/photo/201903/AA.19067065.1.jpg"),
                  maxRadius: 30,
                ),
              ],
            ),
          ),
          trailing: Text(
            "2020",
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).accentColor,
            ),
          ),
        );
      },
    );
  }
}
