import 'package:equatable/equatable.dart';
import 'package:movies_app/moduls/movies/domain/entities/geners.dart';

class DetailsTv extends Equatable {
  final String backdropPath;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<Genres> genres;
  final int id;
  final String name;
  final int numberOfSeasons;
  final String overview;
  final int voteCount;
  final double voteAverage;

  const DetailsTv(
      {required this.backdropPath,
      required this.episodeRunTime,
      required this.firstAirDate,
      required this.genres,
      required this.id,
      required this.name,
      required this.numberOfSeasons,
      required this.overview,
      required this.voteCount,
      required this.voteAverage});

  @override
  List<Object?> get props => [
        backdropPath,
        episodeRunTime,
        firstAirDate,
        genres,
        id,
        name,
        numberOfSeasons,
        overview,
        voteCount,
        voteAverage
      ];
}
