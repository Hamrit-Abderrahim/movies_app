import 'package:movies_app/moduls/movies/domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.voteAverage,
      required super.genersId});

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        genersId: List<int>.from(json["genre_ids"].map((e) => e)),
      );
}
