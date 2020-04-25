import 'package:flutter/widgets.dart';
import 'package:flutterapp/home/model/home_model.dart';

class MovieListItem extends StatelessWidget {

  final MovieItem movie;

  MovieListItem(this.movie);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(movie.title);
  }


}
