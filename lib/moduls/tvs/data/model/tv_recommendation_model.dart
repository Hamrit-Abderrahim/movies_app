import 'package:movies_app/moduls/tvs/domain/entities/tv_recommendation.dart';

class TvREcommendationModel extends TvRecommendtion {
  const TvREcommendationModel({required super.id, required super.backdropPath});
  factory TvREcommendationModel.fromJson(Map<String, dynamic> json) {
    return TvREcommendationModel(
      id: json["id"],
      backdropPath: json["backdrop_path"] ?? "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
    );
  }
}
