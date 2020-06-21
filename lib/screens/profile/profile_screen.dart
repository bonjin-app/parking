import 'package:flutter/material.dart';
import 'package:parking/screens/profile/components/profile_appbar.dart';
import 'package:parking/screens/profile/components/profile_body.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: ProfileBody(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
