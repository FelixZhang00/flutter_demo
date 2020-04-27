import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/error/error.dart';
import 'package:flutterapp/home/home.dart';

import 'detail/detail.dart';
import 'home/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Colors.green,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent),
      routes: {
        "detail_page": (context) => DetailPage(),
        "home_page": (context) => Home(),
      },
      onUnknownRoute: (RouteSettings setting) =>
          MaterialPageRoute(builder: (context) => ErrorPage()),
      home: Home(),
    );
  }
}
