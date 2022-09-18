import 'package:movies_app/moduls/movies/data/model/geners_model.dart';
import 'package:movies_app/moduls/tvs/domain/entities/details.dart';

class TvDetailsModel extends DetailsTv {
  const TvDetailsModel(
      {required super.backdropPath,
      required super.episodeRunTime,
      required super.firstAirDate,
      required super.genres,
      required super.id,
      required super.name,
      required super.numberOfSeasons,
      required super.overview,
      required super.voteCount,
      required super.voteAverage});

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvDetailsModel(
        backdropPath: json["backdrop_path"],
        episodeRunTime: List<int>.from(json["episode_run_time"].map((e) => e)),
        firstAirDate: json["first_air_date"] ?? "2020",
        genres: List<GenersModel>.from(
            json["genres"].map((e) => GenersModel.fromJson(e))),
        id: json["id"],
        name: json["name"],
        numberOfSeasons: json["number_of_seasons"],
        overview: json["overview"],
        voteCount: json["vote_count"],
        voteAverage: json["vote_average"]);
  }
}
