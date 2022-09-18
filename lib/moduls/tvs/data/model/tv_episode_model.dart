import 'package:movies_app/moduls/tvs/domain/entities/episode.dart';

class EpisdeModel extends Episodes {
  const EpisdeModel(
      {required super.airDate,
      required super.id,
      required super.name,
      required super.overview,
      required super.stillPath});
  factory EpisdeModel.fromJson(Map<String, dynamic> json) => EpisdeModel(
      airDate: json["air_date"] ?? "",
      id: json["id"],
      name: json["name"],
      overview: json["overview"],
      stillPath: json["still_path"] ?? "/zsrtewu4jJPh4vB5ZDB9oW36tm8.jpg");
}
