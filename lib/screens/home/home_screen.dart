import 'package:flutter/material.dart';
import 'package:parking/models/article.dart';
import 'package:parking/screens/home/components/home_appbar.dart';
import 'package:parking/screens/home/components/home_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  var articles = [
    Article(imageUrl: "https://img.insight.co.kr/static/2019/04/01/700/60308481nf5f1d6o1l76.jpg"),
    Article(imageUrl: "https://dimg.donga.com/wps/NEWS/IMAGE/2020/03/24/100332619.1.jpg"),
    Article(imageUrl: "https://pds.joins.com/news/component/htmlphoto_mmdata/201909/05/aaa6ff0d-127b-4889-a515-83d170edf3ce.jpg"),
    Article(imageUrl: "https://image.chosun.com/sitedata/image/201908/23/2019082301404_0.png"),
    Article(imageUrl: "https://img.insight.co.kr/static/2019/05/31/700/a14np3358336hi4355gk.jpg"),
    Article(imageUrl: "https://img.insight.co.kr/static/2019/12/02/700/f722m0wwefl4029x8iv6.jpg"),
    Article(imageUrl: "https://cdn.eyesmag.com/content/uploads/posts/2020/02/25/sundayryan_ep_01_thum-ea017180-076d-4970-b012-229cd996ea8a.jpg"),
    Article(imageUrl: "https://image.esquirekorea.co.kr/wp-content/uploads/2019/02/190228-114-01.jpg"),
    Article(imageUrl: "https://cdn.eyesmag.com/content/uploads/posts/2020/03/05/1-ddebcbf3-8d6c-4b5c-ac2a-ade8d5587be9.png"),
    Article(imageUrl: "https://www.beinews.net/news/photo/201912/29937_27035_5222.jpg"),
    Article(imageUrl: "https://cphoto.asiae.co.kr/listimglink/6/2019022210501155713_1550800212.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return HomeItem(article: articles[index]);
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
