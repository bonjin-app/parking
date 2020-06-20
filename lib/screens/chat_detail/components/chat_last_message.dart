import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking/models/message.dart';
import 'package:parking/models/user.dart';
import 'package:parking/providers/user_provider.dart';
import 'package:parking/repository/message_repository.dart';
import 'package:provider/provider.dart';

class ChatLastMessage extends StatelessWidget {
  final User receiver;
  final MessageRepository _messageRepository = MessageRepository();

  ChatLastMessage({
    Key key,
    this.receiver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return StreamBuilder<QuerySnapshot>(
      stream: _messageRepository.fetchLastMessageBetween(
          senderId: userProvider.user.uid,
          receiverId: receiver.uid,
      ),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          var docList = snapshot.data.documents;

          if(docList.isEmpty) {
            print("ChatLastMessage isEmpty");
          }

          Message message = Message.fromMap(docList.last.data);

          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              message.message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          );
        }

        return Text(
          "...",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        );
      },
    );
  }
}
