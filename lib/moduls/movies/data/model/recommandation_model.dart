import 'package:movies_app/moduls/movies/domain/entities/recommandation.dart';

class RecommandationModel extends Recommandation {
  const RecommandationModel({required super.id, required super.backdropPath});
  factory RecommandationModel.fromJson(Map<String, dynamic> json) {
    return RecommandationModel(
      id: json["id"],
      backdropPath: json["backdrop_path"] ?? "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
    );
  }
}
