import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parking/models/contact.dart';
import 'package:parking/models/user.dart';
import 'package:parking/repository/user_repository.dart';
import 'package:parking/screens/chat_detail/chat_detail_screen.dart';
import 'package:parking/screens/chat_detail/components/chat_last_message.dart';
import 'package:parking/widgets/custom_tile.dart';

class ChatItem extends StatelessWidget {
  final Contact contact;
  final UserRepository _userRepository = UserRepository();

  ChatItem({
    Key key,
    this.contact
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: _userRepository.getUserDetailsById(contact.uid),
      builder: (context, snapshot) {

        if (snapshot.hasData) {
          User receiver = snapshot.data;

          return CustomTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(receiver: receiver,)
              ));
            },
            title: Text(
              receiver.name,
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            subtitle: ChatLastMessage(receiver: receiver),
            leading: Container(
              constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(receiver.profilePhoto),
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
        }

        return Container(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}
