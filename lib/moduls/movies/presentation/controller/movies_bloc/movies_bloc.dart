import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/moduls/movies/data/model/movies_model.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_popular_usecase.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_top_rated.usecase.dart';

import '../../../../../core/usecase/base_usecase.dart';
import '../../../../../core/utils/enums.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCases getNowPlayingUseCases;
  final GetPopularUseCases getPopularUseCases;
  final GetTopRatedUseCase getTopRatedUseCase;
  MoviesBloc(this.getNowPlayingUseCases, this.getPopularUseCases,
      this.getTopRatedUseCase)
      : super(const MoviesState()) {
    on<GetNowplayingEvent>(_getNowPlayingMovies);
    on<GetPopularEvent>(_getPopularMovies);
    on<GetTopRatedgEvent>(_getTopRatedMovies);
  }
//*************getNowPlaying **********/

  FutureOr<void> _getNowPlayingMovies(
      GetNowplayingEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingUseCases(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowplayinMessage: l.messgae)),
        (r) => emit(state.copyWith(
            nowPlayigMovies: r, nowPlayingState: RequestState.success)));
  }
  //*************getPopularMovies **********/

  FutureOr<void> _getPopularMovies(
      GetPopularEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularUseCases(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            popularMessage: l.messgae, popularState: RequestState.error)),
        (r) => emit(state.copyWith(
              popularState: RequestState.success,
              popularMovies: r,
            )));
  }
  //*************getTopRatedMovies **********/

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedgEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            topRatedMessage: l.messgae, topRatedState: RequestState.error)),
        (r) => emit(state.copyWith(
              topRatedState: RequestState.success,
              topRatedMovies: r,
            )));
  }
}
