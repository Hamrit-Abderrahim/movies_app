import '../../domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.posterPath,
      required super.firstAirDate,
      required super.title,
      required super.voteAverage,
      required super.genersId});

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        backdropPath: json["backdrop_path"] ?? json["poster_path"],
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"],
        title: json["name"],
        voteAverage: json["vote_average"].toDouble(),
        genersId: List<int>.from(json["genre_ids"].map((e) => e)),
      );
}
