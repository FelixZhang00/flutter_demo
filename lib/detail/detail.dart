import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/model/home_model.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //取出路由参数
    MovieItem item = ModalRoute.of(context).settings.arguments as MovieItem;
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),
      body: Center(
        child: Text(item?.title),
      ),
    );
  }
}
