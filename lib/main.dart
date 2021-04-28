import 'package:flutter/material.dart';
import 'package:weichatdemo/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Color.fromRGBO(1, 0, 0, 0),
//        cardTheme: CardTheme(color: Color.fromRGBO(1, 1, 1, 0.65)),
        splashColor: Colors.transparent,
        cardColor:Color.fromRGBO(1, 1, 1, 0.65) ,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootPage(),
    );
  }
}

