import 'package:flutter/material.dart';
import 'package:parking/screens/chat/components/chat_appbar.dart';
import 'package:parking/screens/chat/components/chat_body.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: ChatBody(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
