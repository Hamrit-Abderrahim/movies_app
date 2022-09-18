import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/moduls/tvs/domain/respository/base_tv_repository.dart';

import '../../data/model/tv_model.dart';

class GetOnTheAirUseCase extends BaseUseCases<List<TvModel>, NoParameters> {
  final BaseTvRepository baseTvRepository;

  GetOnTheAirUseCase(this.baseTvRepository);
  @override
  Future<Either<Failure, List<TvModel>>> call(NoParameters parameters) async {
    return await baseTvRepository.getTvOnTheAir();
  }
}
