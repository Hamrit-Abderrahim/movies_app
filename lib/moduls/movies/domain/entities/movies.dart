import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final List<int> genersId;

  const Movies(
      {required this.backdropPath,
      required this.id,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.genersId});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        genersId
      ];
}
