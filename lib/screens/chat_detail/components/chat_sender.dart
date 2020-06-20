import 'package:flutter/material.dart';
import 'package:parking/models/message.dart';
import 'package:parking/screens/chat_detail/components/chat_message.dart';

class ChatSender extends StatelessWidget {
  final Message message;

  const ChatSender({
    Key key,
    this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Radius messageRadius = Radius.circular(10);

    return Container(
      margin: EdgeInsets.only(top: 6),
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.65),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topLeft: messageRadius,
          topRight: messageRadius,
          bottomLeft: messageRadius,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ChatMessage(message: message),
      ),
    );
  }
}
