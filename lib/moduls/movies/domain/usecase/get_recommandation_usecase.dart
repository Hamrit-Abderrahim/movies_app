import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/moduls/movies/domain/respository/base_movies_repository.dart';

import '../entities/recommandation.dart';

class GetRecommandationUseCase
    extends BaseUseCases<List<Recommandation>, RecommandationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommandationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommandation>>> call(
      RecommandationParameters parameters) async {
    return await baseMoviesRepository.getRecommandation(parameters);
  }
}

class RecommandationParameters extends Equatable {
  final int id;

  const RecommandationParameters({required this.id});

  @override
  List<Object?> get props => [id];
}
