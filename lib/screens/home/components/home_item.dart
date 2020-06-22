import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parking/models/article.dart';
import 'package:parking/screens/home_detail/home_detail_screen.dart';
import 'package:parking/utils/route/route_fade.dart';

class HomeItem extends StatelessWidget {
  final Article article;

  HomeItem({
    Key key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            RouteFade(page: HomeDetailScreen(article: article,)
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 120,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            width: 1,
            color: Colors.grey.shade200,
          )),
        ),
        child: Row(
          children: <Widget>[
            Hero(
              tag: article.imageUrl,
              child: Container(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    article.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 8.0, top: 4, bottom: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "동천 유타워 1주일 주차",
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      "용인시 수지구 동천동",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "80,000원",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 16,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.favorite,
                          size: 16,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
