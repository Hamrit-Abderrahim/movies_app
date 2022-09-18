import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/moduls/tvs/domain/entities/episode.dart';
import 'package:movies_app/moduls/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_details_usecase.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_recommendation_usecse.dart';

import '../../data/model/tv_model.dart';
import '../entities/details.dart';
import '../use_case/get_tv_episode_usecas.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<TvModel>>> getTvOnTheAir();
  Future<Either<Failure, List<TvModel>>> getTvPopular();
  Future<Either<Failure, List<TvModel>>> getTvTopRated();
  Future<Either<Failure, DetailsTv>> getTvDetails(
      TvDetailsParameters parameters);
  Future<Either<Failure, List<TvRecommendtion>>> getTvRecommendation(
      TvRecommendationPar parameters);
  Future<Either<Failure, List<Episodes>>> getEpisode(TvEpisodePar parameters);
}
