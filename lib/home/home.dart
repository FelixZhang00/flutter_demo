import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/home/view/movie_list_item.dart';

import 'model/home_model.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: MyHomePage(),
      ),
    );
  }

}

//todo 滚动分页请求
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeRequest homeRequest = HomeRequest();

  int start = 0;
  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();

    //getTopMovies();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
//    return ListView.builder(
//        itemCount: movies.length,
//        itemBuilder: (BuildContext context, int index) {
//          return MovieListItem(movies[index]);
//        });

    return FutureBuilder<List<MovieItem>>(
      future: homeRequest.getMovieList(start, 10),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Text("Error...");
        }
        else if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieListItem(snapshot.data[index]);
              });
        }else{
          return Text("Loading...");
        }
      },
    );

  }

  void getTopMovies() {
    homeRequest.getMovieList(start, 10)
        .then((result) {
      setState(() {
        movies.addAll(result);
      });
    });
  }
}
