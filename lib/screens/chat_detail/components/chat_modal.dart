import 'package:flutter/material.dart';
import 'package:parking/screens/chat_detail/components/chat_modal_tile.dart';

class ChatModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: <Widget>[
              FlatButton(
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.maybePop(context);
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Context and tools",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
        Flexible(
          child: ListView(
            children: <Widget>[
              ChatModalTile(
                title: "Media",
                subtitle: "Share Photos and Video",
                icon: Icons.image,
                onTap: () {
                },
              ),
              ChatModalTile(
                title: "File",
                subtitle: "Share files",
                icon: Icons.tab,
              ),
              ChatModalTile(
                title: "Contact",
                subtitle: "Share contacts",
                icon: Icons.contacts,
              ),
              ChatModalTile(
                title: "Location",
                subtitle: "Share a location",
                icon: Icons.add_location,
              ),
              ChatModalTile(
                title: "Schedule Call",
                subtitle: "Arrange a skype call and get reminders",
                icon: Icons.schedule,
              ),
              ChatModalTile(
                title: "Create Poll",
                subtitle: "Share polls",
                icon: Icons.poll,
              ),
            ],
          ),
        )
      ],
    );
  }
}
