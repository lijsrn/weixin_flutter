import 'package:flutter/material.dart';
import 'package:weichatdemo/pages/chat/chat_page.dart';
import 'package:weichatdemo/pages/discover_page.dart';
import 'package:weichatdemo/pages/friends/friends_page.dart';
import 'package:weichatdemo/pages/mine_page.dart';

class RootPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RootPage> {

  List<Widget> _pages = [ChatPage(),FriendsPage(),DiscoverPage(),MinePage()];

  int _currentIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _pages,
        index: _currentIndex,
      )
      ,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            title: Text('微信'),
            icon: Image.asset('images/tabbar_chat.png',width: 20,height: 20,),
            activeIcon: Image.asset('images/tabbar_chat_hl.png',width: 20,height: 20,),
        ),
        BottomNavigationBarItem(
            title: Text('通讯录'),
            icon: Image.asset('images/tabbar_friends.png',width: 20,height: 20,),
            activeIcon: Image.asset('images/tabbar_friends_hl.png',width: 20,height: 20,)
        ),
        BottomNavigationBarItem(title: Text('发现'),icon: Icon(Icons.history)),
        BottomNavigationBarItem(title: Text('我'),icon: Icon(Icons.person_outline)),
      ],
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        onTap: (index){

          setState(() {
            _currentIndex = index;
          });

        },
        currentIndex: _currentIndex,
        selectedFontSize:14.0,
        unselectedFontSize : 14.0,
      ),
    );
  }
}
