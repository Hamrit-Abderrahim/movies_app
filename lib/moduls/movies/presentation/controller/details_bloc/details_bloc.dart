import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_movies_details_usecase.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_recommandation_usecase.dart';
import 'package:movies_app/moduls/movies/presentation/controller/details_bloc/details_event.dart';
import 'package:movies_app/moduls/movies/presentation/controller/details_bloc/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetMoviesDetailsUSeCases getMoviesDetailsUSeCases;
  final GetRecommandationUseCase getRecommandationUseCase;
  DetailsBloc(this.getMoviesDetailsUSeCases, this.getRecommandationUseCase)
      : super(const DetailsState()) {
    on<GetDetailsMoviesEvent>(_getDetailsMovies);
    on<GetRecommendationEvent>(_getRecommendation);
  }
//*************_getDetailsMovies **************//
  FutureOr<void> _getDetailsMovies(
      GetDetailsMoviesEvent event, Emitter<DetailsState> emit) async {
    final result =
        await getMoviesDetailsUSeCases(MoviesDetailsParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            detailsMessage: l.messgae, detailsState: RequestState.error)),
        (r) => emit(state.copyWith(
            detailsMovies: r, detailsState: RequestState.success)));
  }
//*************_getRecommendation **************//

  FutureOr<void> _getRecommendation(
      GetRecommendationEvent event, Emitter<DetailsState> emit) async {
    final result =
        await getRecommandationUseCase(RecommandationParameters(id: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            recommendationMessage: l.messgae,
            recommendationState: RequestState.error)),
        (r) => emit(state.copyWith(
            recommendationMovie: r,
            recommendationState: RequestState.success)));
  }
}
