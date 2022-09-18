import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/moduls/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app/moduls/tvs/domain/respository/base_tv_repository.dart';

class GetTvREcommendationUSeCase
    extends BaseUseCases<List<TvRecommendtion>, TvRecommendationPar> {
  final BaseTvRepository baseTvRepository;

  GetTvREcommendationUSeCase(this.baseTvRepository);
  @override
  Future<Either<Failure, List<TvRecommendtion>>> call(parameters) {
    return baseTvRepository.getTvRecommendation(parameters);
  }
}

class TvRecommendationPar extends Equatable {
  final int tvId;

  const TvRecommendationPar(this.tvId);
  @override
  List<Object?> get props => [tvId];
}
