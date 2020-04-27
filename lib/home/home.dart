import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/home/view/movie_list_item.dart';

import 'model/home_model.dart';

class Home extends StatelessWidget {
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
  ScrollController _controller;
  int _start = 0;
  final List<MovieItem> movies = [];
  bool _loadingMore = false;
  bool _loading = true;
  static const int COUNT = 10;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    _getTopMovies();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    if (_loading) {
      return Text("Loading...");
    } else {
      return ListView.builder(
          controller: _controller,
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: MovieListItem(movies[index]),
              onTap: () => _onItemClicked(context,movies[index]),
            );
          });
    }
  }

  void _getTopMovies() {
    homeRequest.getMovieList(_start, COUNT).then((result) {
      setState(() {
        _loadingMore = false;
        _loading = false;
        movies.addAll(result);
      });
    });
  }

  void _loadMore() {
    setState(() {
      _loadingMore = true;
    });
    _start = movies.length + COUNT;
    _getTopMovies();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      _loadMore();
    }
  }
}

void _onItemClicked(BuildContext context, MovieItem item) {
  print(item.title);
  Navigator.pushNamed(context, "detail_pag1e",arguments: item);

}
