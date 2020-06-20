import 'package:flutter/material.dart';
import 'package:parking/screens/tab/tab_screen.dart';
import 'package:parking/widgets/nm_box.dart';

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
        textTheme: TextTheme(bodyText2: TextStyle(color: fCL)),
      ),
      home: TabScreen(),
    );
  }
}
