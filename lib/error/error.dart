import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("错误页"),
      ),
      body: Center(
        child: Text("Error!"),
      ),
    );
  }
}
