import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/moduls/tvs/domain/entities/details.dart';
import 'package:movies_app/moduls/tvs/domain/respository/base_tv_repository.dart';

class GetTvDetailsUseCase extends BaseUseCases<DetailsTv, TvDetailsParameters> {
  final BaseTvRepository baseTvRepository;

  GetTvDetailsUseCase(this.baseTvRepository);
  @override
  Future<Either<Failure, DetailsTv>> call(
      TvDetailsParameters parameters) async {
    return await baseTvRepository.getTvDetails(parameters);
  }
}

class TvDetailsParameters extends Equatable {
  final int id;

  const TvDetailsParameters({required this.id});

  @override
  List<Object?> get props => [id];
}
