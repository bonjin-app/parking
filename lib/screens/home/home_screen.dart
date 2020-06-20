import 'package:flutter/material.dart';
import 'package:parking/screens/home/components/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Container(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
