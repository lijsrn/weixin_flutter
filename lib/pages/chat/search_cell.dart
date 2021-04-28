import 'package:flutter/material.dart';
import 'package:weichatdemo/pages/chat/chart_model.dart';
import 'package:weichatdemo/pages/chat/search_page.dart';
import 'package:weichatdemo/pages/const.dart';

class SearchCell extends StatelessWidget {

  final List<Chat> datas;

  const SearchCell({this.datas});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (d){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return SearchPage(datas: datas,);
          })
        );
      },
      child: Container(
        height: 40,
        padding: EdgeInsets.all(5),
        child: Stack(children: [
          Container(

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage("images/放大镜b.png",),width: 20,),
              Text(' 搜索',style: TextStyle(fontSize: 18),)
            ],)
        ],),
        color: WeChatThemeColor,),
    );
  }
}


class SearchBar extends StatefulWidget {

  final ValueChanged<String> onChanged;
  const SearchBar({this.onChanged});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  final TextEditingController _controller = TextEditingController();
  bool _showIcon = false; // 给个初始值，不然那报错

  void _onChanged(String text){
    print("search----$text");
    if(text.length >0){
      widget.onChanged(text);
      setState(() {
        _showIcon = true;
      });
    }else {
      widget.onChanged('');
      _showIcon = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    var statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: statusBarHeight + 44,
      color: Colors.red,
      child: Column(
        children: [
          SizedBox(
            height: statusBarHeight,

          ),
          Container(
            height: 44,
            child:
            Row(
              children: [
                Container(
                  width: ScreenWidth(context) -50,
                  height: 34,
//                  color: Colors.white,
                  margin: EdgeInsets.only(left: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Row(
                    children: [
                      Image(image: AssetImage("images/放大镜b.png"),width: 20,),
                      Expanded(flex: 1,
                      child:
                        TextField(
                          controller: _controller,
                          onChanged: _onChanged,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          autofocus: true,//自动获取焦点
                          cursorColor: Colors.green,// 贯标的颜色
                          decoration: InputDecoration(
                            //调整输入空文字的位置
                            contentPadding: EdgeInsets.only(left: 5,bottom: 10),
                              hintText:"搜索",//站位词
                              border: InputBorder.none,//隐藏边框
                          ),
                        ),
                      ),
                      _showIcon ? GestureDetector(
                        onTap: (){
                          setState(() {
                            _controller.clear();
                            _onChanged("");
                          });

                        },
                        child: Icon(Icons.clear,color: Colors.grey,),
                      ) :  Container()
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },

                  child: Text(" 取消",style: TextStyle(fontSize: 18),),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
