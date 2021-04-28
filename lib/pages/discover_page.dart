import 'package:flutter/material.dart';

import 'discover/discover_cell.dart';
import 'discover/discover_child_page.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<DiscoverPage> {

  Color _themecolor = Color.fromRGBO(220, 220, 220, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发现'),
        centerTitle: true,
        backgroundColor: _themecolor,
        elevation: 0, //底部边栏
      ),

      body: Container(
        color: _themecolor,
        child: ListView(
          children: [
            DiscoverCell(title: "朋友圈",imageName: "images/朋友圈.png",tapAction: (){
                     Navigator.of(context).push(
                         MaterialPageRoute(builder: (BuildContext context)=>DiscoverChildPage(title:"朋友圈1")
                         )
       );
            },),
            SizedBox(height: 10,),
            DiscoverCell(title: "扫一扫",imageName: "images/扫一扫.png",),
            Row(
              children: [
                Container(
                  color: Colors.white,
                  width: 50,
                  height: 0.5,
                ),
                Container(
                  color: Colors.grey,
                  height: 0.5,
                )
              ],
            ),
            DiscoverCell(title: "摇一摇",imageName: "images/摇一摇.png",),
            SizedBox(height: 10,),
            DiscoverCell(title: "看一看",imageName: "images/看一看icon.png",),
            Row(
              children: [
                Container(
                  color: Colors.white,
                  width: 50,
                  height: 0.5,
                ),
                Container(
                  color: Colors.grey,
                  height: 0.5,
                )
              ],
            ),
            DiscoverCell(title: "搜一搜",imageName: "images/搜一搜.png",),
            SizedBox(height: 10,),
            DiscoverCell(title: "附近的人",imageName: "images/附近的人icon.png",),
            SizedBox(height: 10,),
            DiscoverCell(title: "购物",imageName: "images/购物.png",subTitle: "618活动",submImageName: "images/badge.png",),
            Row(
              children: [
                Container(
                  color: Colors.white,
                  width: 50,
                  height: 0.5,
                ),
                Container(
                  color: Colors.grey,
                  height: 0.5,
                )
              ],
            ),
            DiscoverCell(title: "游戏",imageName: "images/游戏.png",),
            SizedBox(height: 10,),
            DiscoverCell(title: "小程序",imageName: "images/小程序.png",),
          ],
        ),
      ),
    );
  }
}
