import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weichatdemo/pages/chat/search_cell.dart';
import 'package:weichatdemo/pages/const.dart';
import 'package:http/http.dart' as http;
import 'package:weichatdemo/pages/friends/friends_data.dart';

import 'chart_model.dart';


class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with AutomaticKeepAliveClientMixin{

  List<Chat> _chat_datas =[];

  @override
  void initState() {
    super.initState();


    getDatas().then((List<Chat> datas){
//      _chat_datas = value;
//      print(value);
    setState(() {
      _chat_datas = datas;
    });
    }).catchError((e){
        print(e);
    });
  }

  Future<List<Chat>> getDatas ()async{
    var url = "http://rap2.taobao.org:38080/app/mock/257009/api/query";
        var response = await http.get(url);
//    print('----${response.body}');
        if(response.statusCode == 200){
          //将json数据转为Map
          final responseBody = json.decode(response.body);
          //map一定要指定泛型
          List<Chat> chat_list = responseBody["chat_list"].map<Chat>((item){
//              print(item);
            return Chat.fromJson(item);
          }).toList();
//          print(chat_list);
          return chat_list;
        }else{
          throw Exception("statusCode:${response.statusCode}");
        }
  }


  List<PopupMenuEntry<String>> _popitem(BuildContext context){

    return <PopupMenuEntry<String>> [
        PopupMenuItem(
          value: "1",
          child: Row(
            children: [
              Image(image: AssetImage("images/发起群聊.png"),width: 20,),
              SizedBox(width: 20,),
              Text("发起群聊",style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      PopupMenuItem(
        value: "2",
        child: Row(
          children: [
            Image(image: AssetImage("images/添加朋友.png"),width: 20,),
            SizedBox(width: 20,),
            Text("添加朋友",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
      PopupMenuItem(
        value: "3",
        child: Row(
          children: [
            Image(image: AssetImage("images/扫一扫1.png"),width: 20,),
            SizedBox(width: 20,),
            Text("扫一扫",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
      PopupMenuItem(
        value: "4",
        child: Row(
          children: [
            Image(image: AssetImage("images/收付款.png"),width: 20,),
            SizedBox(width: 20,),
            Text("收付款",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        backgroundColor: WeChatThemeColor,
        actions: [
         Container(
           margin: EdgeInsets.only(right: 10),
           child:  PopupMenuButton(
               offset: Offset(0, 60),
               child: Image(image: AssetImage("images/圆加.png"),width: 25,),
               itemBuilder:_popitem,
                onSelected: (value){
                 print(value);
                },
           ),
         )
        ],
      ),

      body: Container(
        child: _chat_datas.length ==0 ? Center(child: Text("加载中..."),):
        ListView.builder(
          itemBuilder: (BuildContext context,int index){

            if(index == 0){
              return SearchCell(datas: _chat_datas,);
            }
            index --;
            Chat item = _chat_datas[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.message,style: TextStyle(),maxLines: 1,overflow: TextOverflow.ellipsis,),
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(image: NetworkImage(item.imageUrl))
                ),
              ),
            );
          },
          itemCount: _chat_datas.length +1,
        ),
      ),

    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}



//body: Container(
//child:  FutureBuilder(
//future: getDatas(),
//builder: (BuildContext context,AsyncSnapshot snapshot){
//
//
//if(snapshot.connectionState == ConnectionState.waiting){
//return Center(
//child: Text("future加载中"),
//);
//}
//return ListView(
//children: snapshot.data.map<Widget>((item){
//
//return ListTile(
//title: Text(item.name),
//subtitle: Text(item.message,style: TextStyle(),maxLines: 1,overflow: TextOverflow.ellipsis,),
//leading: Container(
//width: 44,
//height: 44,
//decoration: BoxDecoration(
//borderRadius: BorderRadius.circular(6),
//image: DecorationImage(image: NetworkImage(item.imageUrl))
//),
//),
//);
//}).toList()
//
//);
//
//},
//
//),
//),