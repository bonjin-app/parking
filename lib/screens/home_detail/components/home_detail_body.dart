import 'package:flutter/material.dart';
import 'package:parking/models/article.dart';

class HomeDetailBody extends StatelessWidget {
  final Article article;

  const HomeDetailBody({
    Key key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[

                ///Container for place quick info
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5 + 16,
                      bottom: 20,
                      right: 32,
                      left: 32),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      color: Colors.grey[200]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bonjin",),
                      SizedBox(
                        height: 8,
                      ),

                      ///Container for data
                      Container(
                        margin: const EdgeInsets.only(right: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "4.0",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.alarm,
                                  size: 22,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "10 시간 전",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "1 Km",
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                ///Hero Image Container
                Hero(
                  tag: article.imageUrl,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      child: Image.network(
                        article.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                ///Back button
                Align(
                  alignment: Alignment.topLeft,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text("동천 유타워 1주일 주차"),
                  ),
                ),

                ///Favorate icon
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey[100], blurRadius: 8)
                        ]),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  right: 34,
                  bottom: 60,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 24,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "동천 유타워 1주일 주차",
            ),
          ),

          SizedBox(
            height: 16,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "동천동 유타워 개인 주차장 1주일 대여해요.",
            ),
          ),

          Spacer(),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.grey[200]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "주차 비용",
                    ),
                    Text(
                      "80,000원",
                    )
                  ],
                ),

                FlatButton.icon(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  label: Text(
                    '채팅',
                  ),
                  textColor: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
