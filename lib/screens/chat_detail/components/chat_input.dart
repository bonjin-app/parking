import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking/enums/message_type.dart';
import 'package:parking/models/message.dart';
import 'package:parking/models/user.dart';
import 'package:parking/providers/user_provider.dart';
import 'package:parking/repository/message_repository.dart';
import 'package:parking/screens/chat_detail/components/chat_modal.dart';
import 'package:provider/provider.dart';

class ChatInput extends StatelessWidget {
  final User receiver;
  final TextEditingController _messageInputController = TextEditingController();

  ChatInput({
    Key key,
    this.receiver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return Container(
      padding: EdgeInsets.all(16),
      height: 80,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  elevation: 0,
                  backgroundColor: Color(0xFF19191B),
                  builder: (context) {
                    return ChatModal();
                  });
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 21,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _messageInputController,
                onTap: () {},
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Type a message",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  filled: true,
//                      fillColor: Color(0xFF272C35),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              var message = Message(
                senderId: userProvider.user.uid,
                receiverId: receiver.uid,
                message: _messageInputController.text,
                timestamp: Timestamp.now(),
                type: MessageType.TEXT.toString(),
              );

              _messageInputController.text = "";

              var messageRepository = MessageRepository();
              messageRepository.addMessageToDB(message, userProvider.user, receiver);
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.send,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
