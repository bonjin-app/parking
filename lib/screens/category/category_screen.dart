import 'package:flutter/material.dart';
import 'package:parking/screens/category/components/category_appbar.dart';
import 'package:parking/screens/category/components/category_body.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppBar(),
      body: CategoryBody(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
