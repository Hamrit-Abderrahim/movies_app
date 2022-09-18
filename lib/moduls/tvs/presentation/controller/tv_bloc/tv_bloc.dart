import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_on_the_air_usecas.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_popular_usecase.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_top_rated_usecase.dart';
import 'package:movies_app/moduls/tvs/presentation/controller/tv_bloc/tv_event.dart';
import 'package:movies_app/moduls/tvs/presentation/controller/tv_bloc/tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnTheAirUseCase getOnTheAirUseCase;
  final GetTvPopulrUseCase getTvPopulrUseCase;
  final GetTvTopRatedUseCase getTvTopRatedUseCase;
  TvBloc(this.getOnTheAirUseCase, this.getTvPopulrUseCase,
      this.getTvTopRatedUseCase)
      : super(const TvState()) {
    on<GetOnTheAirEvent>(_getOnTheAir);
    on<GetTvPopularEvent>(_getTPopular);
    on<GetTvTopRatedEvent>(_getTvTopRated);
  }
//*************** _getOnTheAir *************//
  FutureOr<void> _getOnTheAir(
      GetOnTheAirEvent event, Emitter<TvState> emit) async {
    final result = await getOnTheAirUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            ontTheAirState: RequestState.error, onTheAirMessage: l.messgae)),
        (r) => emit(state.copyWith(
              onTheAirTv: r,
              ontTheAirState: RequestState.success,
            )));
  }

//*************** _getOnTheAir *************//
  FutureOr<void> _getTPopular(
      GetTvPopularEvent event, Emitter<TvState> emit) async {
    final result = await getTvPopulrUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.messgae)),
        (r) => emit(state.copyWith(
              popularTv: r,
              popularState: RequestState.success,
            )));
  }

//*************** _getOnTheAir *************//
  FutureOr<void> _getTvTopRated(
      GetTvTopRatedEvent event, Emitter<TvState> emit) async {
    final result = await getTvTopRatedUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            topRtedState: RequestState.error, topRtedMessage: l.messgae)),
        (r) => emit(state.copyWith(
              topRtedTv: r,
              topRtedState: RequestState.success,
            )));
  }
}
