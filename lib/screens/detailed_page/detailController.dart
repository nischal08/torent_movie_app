import 'package:get/get.dart';
import 'package:torrent_movie/api/api.dart';
import 'package:torrent_movie/model/movie_details.dart';

class DetailController extends GetxController {
  final int id;
  DetailController(this.id) {
    _getMovieDetails();
  }

  List<Cast> casts = List();

  _getMovieDetails() async {
    MovieDetails movieDetails = await Api.movieDetails(id: id);
    casts = movieDetails.data.movie.cast;
    update();
  }
}
