import 'package:equatable/equatable.dart';

class TvDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetTvDetailsLoadingState extends TvDetailsState {}

class GetTvDetailsSuccessState extends TvDetailsState {}

class GetTvDetailsErrorState extends TvDetailsState {
  final String error;
  GetTvDetailsErrorState({required this.error});
}

//***********tvREcommendation ***************//
class GetTvRecommendationLoadingState extends TvDetailsState {}

class GetTvRecommendationSuccessState extends TvDetailsState {}

class GetTvRecommendationErrorState extends TvDetailsState {
  final String error;
  GetTvRecommendationErrorState({required this.error});
}

//***********tvEpisode ***************//
class GetTvEpisodesLoadingState extends TvDetailsState {}

class GetTvEpisodesSuccessState extends TvDetailsState {}

class GetTvEpisodesErrorState extends TvDetailsState {
  final String error;
  GetTvEpisodesErrorState({required this.error});
}

class ChangeButtonEpisodeSuccess extends TvDetailsState {}

class ChangeButtonMoreSuccess extends TvDetailsState {}
