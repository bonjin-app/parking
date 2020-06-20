import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking/models/message.dart';
import 'package:parking/models/user.dart';
import 'package:parking/providers/message_provider.dart';
import 'package:parking/providers/user_provider.dart';
import 'package:parking/screens/chat_detail/components/chat_input.dart';
import 'package:parking/screens/chat_detail/components/chat_receiver.dart';
import 'package:parking/screens/chat_detail/components/chat_sender.dart';
import 'package:provider/provider.dart';

class ChatDetailBody extends StatelessWidget {

  final User receiver;
  ScrollController _listScrollController = ScrollController();

  ChatDetailBody({
    Key key,
    this.receiver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var messageProvider = Provider.of<MessageProvider>(context);

    return Column(
      children: <Widget>[
        Flexible(
          child: StreamBuilder(
            stream: messageProvider.messageStream(
              senderId: userProvider.user.uid,
              receiverId: receiver.uid,
            ),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//              // Input 입력시 스크롤 하단으로
//              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//                _listScrollController.animateTo(
//                  _listScrollController.position.minScrollExtent,
//                  duration: Duration(milliseconds: 250),
//                  curve: Curves.easeInOut,
//                );
//              });

              if(snapshot.hasData) {
                var docList = snapshot.data.documents;

                return ListView.builder(
                  padding: EdgeInsets.all(10),
                  reverse: true,
                  itemCount: docList.length,
                  controller: _listScrollController,
                  itemBuilder: (context, index) {

                    Message _message = Message.fromMap(docList[index].data);

                    if (_message.senderId == userProvider.user.uid) {
                      return Container(
                        alignment: Alignment.centerRight,
                        child: ChatSender(message: _message),
                      );
                    } else {
                      return Container(
                        alignment: Alignment.centerLeft,
                        child: ChatReceiver(message: _message),
                      );
                    }
                  },
                );
              }

              return Container(
                child: CircularProgressIndicator(),
              );
            }
          ),
        ),
        ChatInput(receiver: receiver),
      ],
    );
  }
}
