import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/moduls/tvs/domain/entities/details.dart';
import 'package:movies_app/moduls/tvs/domain/entities/episode.dart';
import 'package:movies_app/moduls/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_details_usecase.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_episode_usecas.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_recommendation_usecse.dart';
import 'package:movies_app/moduls/tvs/presentation/controller/tv_details_bloc/tv_details_state.dart';

class TvDetailsBloc extends Cubit<TvDetailsState> {
  final GetTvDetailsUseCase getTvDetailsUseCase;
  final GetTvREcommendationUSeCase getTvREcommendationUSeCase;
  final GetTvEpisodesUseCase getTvEpisodesUseCase;
  static TvDetailsBloc get(context) => BlocProvider.of(context);

  TvDetailsBloc(this.getTvDetailsUseCase, this.getTvREcommendationUSeCase,
      this.getTvEpisodesUseCase)
      : super(TvDetailsState());

//************************ _getDetailsTV ****************//
  DetailsTv? detailsTv;
  final List<int> season = [];

  Future<void> getDetailsTV(int id) async {
    emit(GetTvDetailsLoadingState());
    final result = await getTvDetailsUseCase(TvDetailsParameters(id: id));
    result.fold((l) => emit(GetTvDetailsErrorState(error: l.messgae)), (r) {
      detailsTv = r;
      print("Reahin hamrit=$detailsTv");
      print("Reahin sdsfsssfsdfsdffds=${detailsTv!.numberOfSeasons}");

      for (int i = 0; i < r.numberOfSeasons; i++) {
        season.add(i + 1);
      }

      emit(GetTvDetailsSuccessState());
    });
  }

//*****************sadaw************************* */
  bool episode = false;

  changeButtonEpisode() {
    episode = true;

    emit(ChangeButtonEpisodeSuccess());
  }

  changeButtonMore() {
    episode = false;
    emit(ChangeButtonMoreSuccess());
  }

  //************************ getTvRec ****************//
  List<TvRecommendtion> tvRec = [];
  Future<void> getTvRec(int id) async {
    emit(GetTvRecommendationLoadingState());
    final result = await getTvREcommendationUSeCase(TvRecommendationPar(id));
    result.fold((l) => emit(GetTvRecommendationErrorState(error: l.messgae)),
        (r) {
      tvRec = r;

      emit(GetTvRecommendationSuccessState());
    });
  }

  //************************ _getDetailsTV ****************//
  List<Episodes> tvEpisods = [];
  Future<void> getTvEpisods(int id, int tvEpisodes) async {
    emit(GetTvEpisodesLoadingState());
    final result = await getTvEpisodesUseCase(
        TvEpisodePar(id: id, tvEpisodes: tvEpisodes));
    result.fold((l) => emit(GetTvEpisodesErrorState(error: l.messgae)), (r) {
      tvEpisods = r;

      emit(GetTvEpisodesSuccessState());
    });
  }
}
