import 'package:flutter/material.dart';
import 'package:parking/screens/tab/tab_screen.dart';

void main() {
//  WidgetsFlutterBinding.ensureInitialized();
//  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '주차',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabScreen(),
    );
  }
}
