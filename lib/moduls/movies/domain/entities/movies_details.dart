import 'package:equatable/equatable.dart';
import 'package:movies_app/moduls/movies/domain/entities/geners.dart';

class MoviesDetails extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int runtime;
  final List<Genres> genres;

  const MoviesDetails(
      {required this.backdropPath,
      required this.id,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.runtime,
      required this.genres});
  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        runtime,
        genres
      ];
}
