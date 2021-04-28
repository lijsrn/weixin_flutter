import 'package:flutter/material.dart';
import 'package:weichatdemo/pages/const.dart';
import 'package:weichatdemo/pages/discover/index_bar.dart';
import 'friends_data.dart';
//import '/const.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<FriendsPage> {

  final List<Friends> _headerData = [
    Friends(imageUrl: 'images/新的朋友.png', name: '新的朋友'),
    Friends(imageUrl: 'images/群聊.png', name: '群聊'),
    Friends(imageUrl: 'images/标签.png', name: '标签'),
    Friends(imageUrl: 'images/公众号.png', name: '公众号'),
  ];

  final Map _groupOffsetMap ={
    INDEX_WORDS[0]: 0,
    INDEX_WORDS[1]: 0,
  };

  final List<Friends> _listDatas = [];

  ScrollController _scrollController = new ScrollController();

  @override
  void initState(){
    super.initState();

    _listDatas..addAll(datas)..addAll(datas);

    //排序
    _listDatas.sort((Friends a,Friends b){
      return a.indexLetter.compareTo(b.indexLetter);
    });

    var _groupOffset = 54.5 *4;
    print("---$_listDatas");
    for(int i=0; i <_listDatas.length ; i++){
      if(i <1){
        _groupOffsetMap.addAll({_listDatas[i].indexLetter: _groupOffset});
        _groupOffset += 84.5;
      }else if( _listDatas[i].indexLetter == _listDatas[i-1].indexLetter){
       //这里是同一个group中cell不断相加，不用存
        _groupOffset += 54.5;
      }else {
        //如果不等表示，到了不同的group中，所以存这个
        _groupOffsetMap.addAll({_listDatas[i].indexLetter:_groupOffset});
        _groupOffset += 84.5;
      }
    }

  }

  Widget _cellForRow(BuildContext context,int index){

    if(index < _headerData.length){

      return _FriendCell(
        imageAssets: _headerData[index].imageUrl,
        name: _headerData[index].name,
      );
    }

    //判断第一个cell的letter和下一个letter是否一样，一样的话就隐藏groupTitle
    var _hideIndexLetter = (index-4 > 0 && _listDatas[index -4].indexLetter == _listDatas[index-5].indexLetter);
//    print("-----$_hideIndexLetter");
        return _FriendCell(
          name: _listDatas[index-4].name,
          imageUrl: _listDatas[index-4].imageUrl,
          groupTitle: _hideIndexLetter ? null : _listDatas[index-4].indexLetter,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通讯录'),
        backgroundColor: WeChatThemeColor,
        actions: [
          IconButton(icon: Image(image:AssetImage("images/icon_friends_add.png")),
          onPressed: (){
            
          },
          ),

        ],
      ),
      body:Stack(
        children: [
          Container(
            color: WeChatThemeColor,
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: _cellForRow,
              itemCount: _listDatas.length + _headerData.length,
            ),
          ),
          IndexBar(indexBarCallBack: (String index){
              print(_groupOffsetMap[index]);
              if(_groupOffsetMap[index] != null){
                _scrollController.animateTo(_groupOffsetMap[index], duration: Duration(milliseconds: 1), curve: Curves.easeIn);
              }
          },),
        ],
      )
      );
  }
}

class _FriendCell extends StatelessWidget {

  final String imageUrl;
  final String name;
  final String groupTitle;
  final String imageAssets;

  const _FriendCell({this.imageUrl,this.name,this.groupTitle,this.imageAssets});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color.fromRGBO(1, 1, 1, 0),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10),
          height: groupTitle != null ?30 :0,
          child: groupTitle != null ? Text(groupTitle,style: TextStyle(color: Colors.grey),):null,
        ),

        Container(
          color: Colors.white,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(image: imageUrl == null ? AssetImage(imageAssets):NetworkImage(imageUrl))
                ),
              ),//头像
              Container(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 17),
                ),//昵称
              )
            ],
          ),
        ),//cell内容
      ],
    );
  }
}
