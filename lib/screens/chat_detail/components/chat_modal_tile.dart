import 'package:flutter/material.dart';
import 'package:parking/widgets/custom_tile.dart';

class ChatModalTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function onTap;

  const ChatModalTile(
      {Key key,
        @required this.title,
        @required this.subtitle,
        @required this.icon,
        this.onTap
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: CustomTile(
        onTap: onTap,
        leading: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xFF1E2225),
          ),
          padding: EdgeInsets.all(10),
          child: Icon(
            icon,
            color: Color(0xFF8F8F8F),
            size: 38,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: Color(0xFF8F8F8F),
              fontSize: 14,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}