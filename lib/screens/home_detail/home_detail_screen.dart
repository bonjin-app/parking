import 'package:flutter/material.dart';
import 'package:parking/models/article.dart';
import 'package:parking/screens/home_detail/components/home_detail_body.dart';

class HomeDetailScreen extends StatelessWidget {

  final Article article;

  HomeDetailScreen({
    Key key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeDetailBody(article: article),
    );
  }
}
