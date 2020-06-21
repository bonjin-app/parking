import 'package:flutter/material.dart';

class HomeDetailScreen extends StatelessWidget {

  HomeDetailScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                        color: Colors.white),
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
                    tag: "transition target",
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(60),
                          bottomLeft: Radius.circular(60),
                        ),
                        child: Image.network(
                          "https://t1.kakaocdn.net/friends/prod/product/20190925121732325_8809681700832_LittelRYAN_humidifier_BW_00.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  ///Back button
                  Positioned(
                    top: 40,
                    left: 24,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                    bottom: 80,
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
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                  color: Colors.white),
              child: Row(
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

                  Spacer(),

                  FlatButton(
                    child: Text(
                      "채팅",

                    ),
                    onPressed: () {},
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
