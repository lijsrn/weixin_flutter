import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<MinePage> {

  Widget _headerWidget(){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 100),
      child: Row(

        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("images/Hank.png")
                )
            ),
          ),
          Row(
            children: [

            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
////        title: Text('我'),
//        backgroundColor:Colors.white,
//        elevation: 0.0,
//        actions: [
//          IconButton(
//            icon: Image(image: AssetImage('images/五角星b.png'),),
//            onPressed: (){
//
//            },
//          )
//        ],
//      ),
      body: Stack(
//        child: Text('我的'),
        children: [
          Container(
            child: MediaQuery.removePadding(context: context, child: ListView(
              children: [
                _headerWidget(),
              ],
            )),
          ),
          Positioned(
            right: 10,
            top: 20,
            child: Image(
              image: AssetImage('images/相机.png'),
              width: 30,
              height: 30,
            ),
          )
        ],
      ),

    );
  }
}
