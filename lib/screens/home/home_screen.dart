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
    Article(imageUrl: "https://lh3.googleusercontent.com/proxy/07XnrEr7FlZO5vFVLWvRIzfgr7FAysTA9hOtXJKskqeTB6P8mu4t6Ndg-o3KR1JkY97pC70TdzoxhVr8u80BdV3XFUc1lDKMHTIBU2bg_J4dcfPgDljBSjeOREEDAkmU9Ah2vzaCEPrdeeLgpUNk20e-vLqTeAxWeB6qmNM"),
    Article(imageUrl: "https://img.insight.co.kr/static/2019/12/02/700/f722m0wwefl4029x8iv6.jpg"),
    Article(imageUrl: "https://lh3.googleusercontent.com/proxy/u9f_0PL5hKwXy9U1owRU5wjW0Ys_G11jksGTCYFclfhPsUfAWgP0X0NvxcBJhFTZ1sYiIEYGDwCmWqTnPsv_OpSQqOCpFMoUiKJHXYEA-takRqfKIIfz0JmZviQ"),
    Article(imageUrl: "https://image.esquirekorea.co.kr/wp-content/uploads/2019/02/190228-114-01.jpg"),
    Article(imageUrl: "https://cdn.eyesmag.com/content/uploads/posts/2020/03/05/1-ddebcbf3-8d6c-4b5c-ac2a-ade8d5587be9.png"),
    Article(imageUrl: "https://lh3.googleusercontent.com/proxy/c6ep42IMLpiyvckbKBRPRgFtVR3z-RPR87voJgYq-NHsjQLBfetiXv3Ee9cTg9hyiYYiKD0PS3Cjhf5BLzPdIRqbIOCOgedXV-pBVl3sDjMxbPf00VkL5vaVuhTgo9_RvWMM5qnIT8j-K7BmLVCHRvPgOQg"),
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
