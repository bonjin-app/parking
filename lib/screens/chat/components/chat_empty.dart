import 'package:flutter/material.dart';

class ChatEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Text(
        "채팅방이 없습니다.",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
    );
  }
}
