import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:torrent_movie/model/listmovies.dart';
import 'package:torrent_movie/model/movie_details.dart';

class Api {
  static Future<ListMovies> listMovies() async {
    String url = "https://yts.mx/api/v2/list_movies.json";

    http.Response response = await http.get(url);
    return ListMovies.fromJson(response.body);
    // ListMovies model=  ListMovies.fromJson(response.body);
  }

  static Future<MovieDetails> movieDetails({@required int id}) async {
    String url =
        "https://yts.mx/api/v2/movie_details.json?movie_id=$id&with_cast=true";
    http.Response response = await http.get(url);
    return MovieDetails.fromJson(response.body);
    // ListMovies model=  ListMovies.fromJson(response.body);
  }
}
