import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:parking/screens/category/category_screen.dart';
import 'package:parking/screens/chat/chat_screen.dart';
import 'package:parking/screens/home/home_screen.dart';
import 'package:parking/screens/profile/profile_screen.dart';

class TabScreen extends StatefulWidget{
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with WidgetsBindingObserver {
  final Logger _logger = Logger();

  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),  // swipe 방지
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          HomeScreen(),
          CategoryScreen(),
          Container(),
          ChatScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.grey.shade400,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 20,
            ),
            title: Text("홈"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 20,
            ),
            title: Text("카테고리"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.edit,
              size: 20,
            ),
            title: Text("글쓰기"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              size: 20,
            ),
            title: Text("채팅"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 20,
            ),
            title: Text("나의 주차"),
          ),
        ],
      ),
    );
  }

  /// WidgetsBindingObserver
  /// 시스템이 앱을 백그라운드에 놓거나 앱을 포 그라운드로 되돌릴 때 호출
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:

        _logger.d("didChangeAppLifecycleState : resumed state (ONLINE)");
        break;

      case AppLifecycleState.inactive:

        _logger.d("didChangeAppLifecycleState : inactive state (OFFLINE)");
        break;

      case AppLifecycleState.paused:

        _logger.d("didChangeAppLifecycleState : paused state (WAITING)");
        break;

      case AppLifecycleState.detached:

        _logger.d("didChangeAppLifecycleState : detached state (OFFLINE)");
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
