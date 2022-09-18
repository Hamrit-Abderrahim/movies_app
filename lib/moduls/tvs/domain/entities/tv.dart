import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String posterPath;
  final String firstAirDate;
  final String title;
  final double voteAverage;
  final List<int> genersId;

  const Tv(
      {required this.backdropPath,
      required this.id,
      required this.overview,
      required this.posterPath,
      required this.firstAirDate,
      required this.title,
      required this.voteAverage,
      required this.genersId});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        posterPath,
        firstAirDate,
        title,
        voteAverage,
        genersId
      ];
}
