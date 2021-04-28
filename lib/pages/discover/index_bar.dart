import 'package:flutter/material.dart';

import '../const.dart';

class IndexBar extends StatefulWidget {

  final void Function(String text) indexBarCallBack;

  IndexBar({this.indexBarCallBack});

  @override
  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {

  Color _bkColor =Color.fromRGBO(1, 1, 1, 0);
  Color _textColor = Colors.black;
  double _indicatorY = 0.0;  // 大图标的位置
  String _indicatorText ="A";
  bool _indocatorHidden = true;  //是否隐藏选中的图片

  @override
  Widget build(BuildContext context) {

    List<Widget> words =[];

    for(int i = 0; i< INDEX_WORDS.length; i++){
      words.add(Expanded(
        child: Text(
          INDEX_WORDS[i],
          style: TextStyle(fontSize: 10,color: _textColor),
        ),
      ));
    }

    return Positioned(
        right: 0.0,
        width: 120,
        height: ScreenHeight(context)/2,
        top: ScreenHeight(context)/8,
        child: Row(
          children: <Widget>[
            Container(
//              color: Colors.black,
              alignment: Alignment(0, _indicatorY), //通过修改锚点的Y值来移动图标
              width: 100,
              child: _indocatorHidden ? null : Stack(
                alignment: Alignment(-0.2, 0),
                children: [
                  Image(image: AssetImage("images/气泡.png"),width: 60,),
                  Text(
                    _indicatorText,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
//            PopupMenuButton(),
            GestureDetector(
              child: Container(
                color: _bkColor,
                child: Column(
                  children: words,

                ),
              ),
              //垂直方向拖拽
              onVerticalDragUpdate: (DragUpdateDetails details){
                int index = getIndex(context,details.globalPosition);

                setState(() {
                  _indicatorText = INDEX_WORDS[index];
                  _indicatorY = 2.2/28 *index -1.1;
                  _indocatorHidden = false;
                });

                widget.indexBarCallBack(INDEX_WORDS[index]);
              },
              //垂直方向按下
              onVerticalDragDown: (DragDownDetails details){

                int index = getIndex(context,details.globalPosition);

                setState(() {
                  _indicatorText = INDEX_WORDS[index];
                  _indicatorY = 2.2/28 *index -1.1;
                  _indocatorHidden = false;
                  _bkColor = Color.fromRGBO(1, 1, 1, 0.5);
                  _textColor = Colors.white;
                });

                widget.indexBarCallBack(INDEX_WORDS[index]);
              },
              //拖拽结束
              onVerticalDragEnd: (DragEndDetails details){
                setState(() {
                  _indocatorHidden = true;
                  _bkColor = Color.fromRGBO(1, 1, 1, 0);
                  _textColor = Colors.black;
                });
              },
            )
          ],
        )
    );
  }
}

int getIndex(BuildContext context,Offset globalPosition){

  //拿到box
  RenderBox box = context.findRenderObject();

  //拿到y值，全局位置转换到当前的view的位置
  double y =box.globalToLocal(globalPosition).dy;

  //算出字符高度
  var itemHeight = ScreenHeight(context)/2/INDEX_WORDS.length;

  //clamp 指定他的取值范围
  int index = (y~/ itemHeight).clamp(0, INDEX_WORDS.length -1);
  return index;
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
