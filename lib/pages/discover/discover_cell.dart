import 'package:flutter/material.dart';

import 'discover_child_page.dart';

class DiscoverCell extends StatelessWidget {

  final String title;
  final String subTitle;
  final String imageName;
  final String submImageName;

  final VoidCallback tapAction;

  DiscoverCell({
    this.title,
    this.subTitle,
    this.imageName,
    this.submImageName,
    this.tapAction
  });

  @override
  Widget build(BuildContext context) {

   return GestureDetector(
     onTap: (){
          tapAction();
//       Navigator.of(context).push(
//         MaterialPageRoute(builder: (BuildContext context)=>DiscoverChildPage(title:"$title"))
//       );
     },
     onTapCancel: (){

     },
     child: Container(
        color: Colors.white,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image(image: AssetImage(imageName),width: 20,),
                  SizedBox(width: 20,),
                  Text(title)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  subTitle != null ? Text(subTitle) : Text(""),
                  submImageName != null ? Image(image: AssetImage(submImageName),width: 10,) : Container(),
                  Image(image: AssetImage('images/icon_right.png'),width: 15,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
