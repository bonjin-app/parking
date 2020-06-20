import 'package:flutter/material.dart';

class CustomInputSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onTap: () {},
        style: TextStyle(
          color: Colors.white,
        ),
        onChanged: (value) {
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade400,
            size: 20,
          ),
          hintText: "Search...",
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
          fillColor: Color(0xFFEAEAEA),
        ),
      ),
    );
  }
}
