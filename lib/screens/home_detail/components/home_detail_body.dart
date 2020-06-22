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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("동천 유타워 1주일 주차"),
          expandedHeight: MediaQuery.of(context).size.height * 0.45,
          // floating 설정. SliverAppBar는 스크롤 다운되면 화면 위로 사라짐.
          // true: 스크롤 업 하면 앱바가 바로 나타남. false: 리스트 최 상단에서 스크롤 업 할 때에만 앱바가 나타남
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
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
          ),
        ),
        SliverList(
          // 아이템을 빌드하기 위해서 delegate 항목을 구성함
          // SliverChildBuilderDelegate는 ListView.builder 처럼 리스트의 아이템을 생성해줌
          delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 150),
        ),
      ],
    );

//    return Container(
//      width: double.infinity,
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Container(
//            child: Stack(
//              children: <Widget>[
//
//                ///Container for place quick info
//                Container(
//                  width: double.infinity,
//                  padding: EdgeInsets.only(
//                      top: MediaQuery.of(context).size.height * 0.5 + 16,
//                      bottom: 20,
//                      right: 32,
//                      left: 32),
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.only(
//                        bottomLeft: Radius.circular(40),
//                        bottomRight: Radius.circular(40),
//                      ),
//                      color: Colors.grey[200]),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text("Bonjin",),
//                      SizedBox(
//                        height: 8,
//                      ),
//
//                      ///Container for data
//                      Container(
//                        margin: const EdgeInsets.only(right: 80),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: [
//                            Row(
//                              children: [
//                                Icon(
//                                  Icons.star,
//                                  size: 22,
//                                ),
//                                SizedBox(
//                                  width: 4,
//                                ),
//                                Text(
//                                  "4.0",
//                                ),
//                              ],
//                            ),
//                            Row(
//                              children: [
//                                Icon(
//                                  Icons.alarm,
//                                  size: 22,
//                                ),
//                                SizedBox(
//                                  width: 4,
//                                ),
//                                Text(
//                                  "10 시간 전",
//                                ),
//                              ],
//                            ),
//                            Row(
//                              children: [
//                                Icon(
//                                  Icons.location_on,
//                                ),
//                                SizedBox(
//                                  width: 4,
//                                ),
//                                Text(
//                                  "1 Km",
//                                ),
//                              ],
//                            )
//                          ],
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//
//                ///Hero Image Container
//                Hero(
//                  tag: article.imageUrl,
//                  child: Container(
//                    width: double.infinity,
//                    height: MediaQuery.of(context).size.height * 0.5,
//                    child: ClipRRect(
//                      borderRadius: BorderRadius.only(
//                        bottomLeft: Radius.circular(40),
//                        bottomRight: Radius.circular(40),
//                      ),
//                      child: Image.network(
//                        article.imageUrl,
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                  ),
//                ),
//
//                ///Back button
//                Positioned(
//                  top: 40,
//                  left: 24,
//                  child: IconButton(
//                    icon: Icon(
//                      Icons.arrow_back_ios,
//                      color: Colors.white,
//                      size: 30,
//                    ),
//                    onPressed: () {
//                      Navigator.pop(context);
//                    },
//                  ),
//                ),
//
//                ///Favorate icon
//                Positioned(
//                  child: Container(
//                    padding: const EdgeInsets.all(16),
//                    decoration: BoxDecoration(
//                        shape: BoxShape.circle,
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(color: Colors.grey[100], blurRadius: 8)
//                        ]),
//                    child: Icon(
//                      Icons.favorite,
//                      color: Colors.red,
//                      size: 30,
//                    ),
//                  ),
//                  right: 34,
//                  bottom: 60,
//                ),
//              ],
//            ),
//          ),
//
//          SizedBox(
//            height: 24,
//          ),
//
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 32),
//            child: Text(
//              "동천 유타워 1주일 주차",
//            ),
//          ),
//
//          SizedBox(
//            height: 16,
//          ),
//
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 32),
//            child: Text(
//              "동천동 유타워 개인 주차장 1주일 대여해요.",
//            ),
//          ),
//
//          Spacer(),
//
//          Container(
//            width: double.infinity,
//            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.only(
//                  topLeft: Radius.circular(40),
//                  topRight: Radius.circular(40),
//                ),
//                color: Colors.grey[200]),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    Text(
//                      "주차 비용",
//                    ),
//                    Text(
//                      "80,000원",
//                    )
//                  ],
//                ),
//
//                FlatButton.icon(
//                  padding: const EdgeInsets.symmetric(
//                    vertical: 10.0,
//                    horizontal: 20.0,
//                  ),
//                  color: Colors.blue,
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(30.0),
//                  ),
//                  onPressed: () {},
//                  icon: const Icon(
//                    Icons.chat,
//                    color: Colors.white,
//                  ),
//                  label: Text(
//                    '채팅',
//                  ),
//                  textColor: Colors.white,
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    );
  }
}
