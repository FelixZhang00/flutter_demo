import 'package:flutterapp/network/http_request.dart';

int counter = 1;

class MovieItem {
  int rank;
  String imageUrl;
  String title;
  double rating;
  String playDate;
  List<String> genres;
  List<Actor> casts;
  Director director;
  String originalTitle;

  MovieItem();

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    MovieItem item = MovieItem();

    item.rank = counter++;
    item.title = json["title"];
    item.imageUrl = json["images"]["medium"];
    item.playDate = json["year"];
    item.genres = json["genres"].cast<String>();
    item.rating = json["rating"]["average"];
    item.casts = (json["casts"] as List<dynamic>).map((e) => Actor.fromJson(e)).toList();
    item.director =  Director.fromJson(json["directors"][0]);
    item.originalTitle = json["original_title"];


    return item;
  }
}

class Person {
  String name;
  String avatarUrl;

  Person({this.name, this.avatarUrl});

  Person.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.avatarUrl = json["avatars"]["medium"];
  }
}

class Actor extends Person {
  Actor.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class Director extends Person {
  Director.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}

class HomeRequest {
  Future<List<MovieItem>> getMovieList(int start, int count) async {
    final url =
        "https://douban.uieee.com/v2/movie/top250?start=$start&count=$count";

    final result = await HttpRequest.request(url);

    final subjects = result["subjects"];

    List<MovieItem> movies = [];
    for(var sub in subjects){
      movies.add(MovieItem.fromJson(sub));
    }

    return movies;
  }
}
