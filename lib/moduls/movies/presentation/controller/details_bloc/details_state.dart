import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/moduls/movies/domain/entities/movies_details.dart';
import 'package:movies_app/moduls/movies/domain/entities/recommandation.dart';

class DetailsState extends Equatable {
  final MoviesDetails? detailsMovies;
  final RequestState detailsState;
  final String detailsMessage;
  final List<Recommandation> recommendationMovie;
  final String recommendationMessage;
  final RequestState recommendationState;

  const DetailsState({
    this.recommendationMovie = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = "",
    this.detailsMovies,
    this.detailsMessage = "",
    this.detailsState = RequestState.loading,
  });
  DetailsState copyWith({
    MoviesDetails? detailsMovies,
    RequestState? detailsState,
    String? detailsMessage,
    List<Recommandation>? recommendationMovie,
    String? recommendationMessage,
    RequestState? recommendationState,
  }) {
    return DetailsState(
      detailsMovies: detailsMovies ?? this.detailsMovies,
      detailsState: detailsState ?? this.detailsState,
      detailsMessage: detailsMessage ?? this.detailsMessage,
      recommendationMovie: recommendationMovie ?? this.recommendationMovie,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
      recommendationState: recommendationState ?? this.recommendationState,
    );
  }

  @override
  List<Object?> get props => [
        detailsMovies,
        detailsState,
        detailsMessage,
        recommendationMovie,
        recommendationMessage,
        recommendationState
      ];
}
