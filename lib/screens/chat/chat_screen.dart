import 'package:flutter/material.dart';
import 'package:parking/screens/chat/components/chat_appbar.dart';
import 'package:parking/widgets/custom_tile.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return  CustomTile(
            onTap: () {},
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
                    backgroundImage: NetworkImage(
                        "https://img.hankyung.com/photo/201903/AA.19067065.1.jpg"),
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
