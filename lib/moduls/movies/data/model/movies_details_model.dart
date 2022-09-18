import 'package:movies_app/moduls/movies/data/model/geners_model.dart';
import 'package:movies_app/moduls/movies/domain/entities/movies_details.dart';

class MovieDetailsModel extends MoviesDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.voteAverage,
      required super.runtime,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        backdropPath:
            json["backdrop_path"] ?? "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        voteAverage: json["vote_average"],
        runtime: json["runtime"],
        genres: List<GenersModel>.from(
            json["genres"].map((e) => GenersModel.fromJson(e))));
  }
}
