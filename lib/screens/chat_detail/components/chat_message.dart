import 'package:flutter/material.dart';
import 'package:parking/models/message.dart';

class ChatMessage extends StatelessWidget {
  final Message message;

  const ChatMessage({
    Key key,
    this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message.message,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }
}
