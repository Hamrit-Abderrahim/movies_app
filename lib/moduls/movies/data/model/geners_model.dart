import 'package:movies_app/moduls/movies/domain/entities/geners.dart';

class GenersModel extends Genres {
  const GenersModel({required super.name, required super.id});

  factory GenersModel.fromJson(Map<String, dynamic> json) {
    return GenersModel(name: json["name"], id: json["id"]);
  }
}
