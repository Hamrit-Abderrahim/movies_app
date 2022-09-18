import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/moduls/tvs/data/data_source/tv_remote_data_source.dart';
import 'package:movies_app/moduls/tvs/domain/entities/details.dart';
import 'package:movies_app/moduls/tvs/domain/entities/episode.dart';
import 'package:movies_app/moduls/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app/moduls/tvs/domain/respository/base_tv_repository.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_details_usecase.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_episode_usecas.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_recommendation_usecse.dart';

import '../model/tv_model.dart';

class TvRepository extends BaseTvRepository {
  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvRepository(this.baseTvRemoteDataSource);
  //************** getTvOnTheAir  ***********//
  @override
  Future<Either<Failure, List<TvModel>>> getTvOnTheAir() async {
    final result = await baseTvRemoteDataSource.getTvOnTheAir();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    }
  }
  //************** getTvPopular  ***********//

  @override
  Future<Either<Failure, List<TvModel>>> getTvPopular() async {
    final result = await baseTvRemoteDataSource.getTvPopular();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    }
  }
  //************** getTvTopRated  ***********//

  @override
  Future<Either<Failure, List<TvModel>>> getTvTopRated() async {
    final result = await baseTvRemoteDataSource.getTvTopRated();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    }
  }
  //************** getTvDetails  ***********//

  @override
  Future<Either<Failure, DetailsTv>> getTvDetails(
      TvDetailsParameters parameters) async {
    final result = await baseTvRemoteDataSource.getTvDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    }
  }
  //************** getTvRecommendation  ***********//

  @override
  Future<Either<Failure, List<TvRecommendtion>>> getTvRecommendation(
      TvRecommendationPar parameters) async {
    final result = await baseTvRemoteDataSource.getTvRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    }
  }
  //************** getTvRecommendation  ***********//

  @override
  Future<Either<Failure, List<Episodes>>> getEpisode(
      TvEpisodePar parameters) async {
    final result = await baseTvRemoteDataSource.getTvEpisods(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    }
  }
}
