import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/model/home_model.dart';

void main() {
  test('Load a file', () async {
    final file = new File('test_resources/douban_top250_10.json');
    final json = jsonDecode(await file.readAsString());
    final count = json['count'];

    expect(count, 10);

    final subjects = json['subjects'];
    List<MovieItem> movies = [];
    for(var sub in subjects){
      movies.add(MovieItem.fromJson(sub));
    }

    expect(movies.length, 10);

    expect(movies[0].title, "肖申克的救赎");
    expect(movies[0].casts[0].avatarUrl, "https://img9.doubanio.com\/view\/celebrity\/s_ratio_celebrity\/public\/p17525.jpg");

  });
}