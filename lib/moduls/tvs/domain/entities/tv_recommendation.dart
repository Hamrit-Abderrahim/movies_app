import 'package:equatable/equatable.dart';

class TvRecommendtion extends Equatable {
  final int id;
  final String backdropPath;

  const TvRecommendtion({required this.id, required this.backdropPath});
  @override
  List<Object?> get props => [id, backdropPath];
}
