import 'package:flutter/material.dart';
import 'package:parking/models/user.dart';
import 'package:parking/screens/chat_detail/components/chat_detail_appbar.dart';
import 'package:parking/screens/chat_detail/components/chat_detail_body.dart';

class ChatDetailScreen extends StatelessWidget {
  final User receiver;

  const ChatDetailScreen({
    Key key,
    this.receiver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatDetailAppBar(receiver: receiver,),
      body: ChatDetailBody(receiver: receiver,),
    );
  }
}
