import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

import '../../data/model/tv_model.dart';
import '../respository/base_tv_repository.dart';

class GetTvTopRatedUseCase extends BaseUseCases<List<TvModel>, NoParameters> {
  final BaseTvRepository baseTvRepository;

  GetTvTopRatedUseCase(this.baseTvRepository);
  @override
  Future<Either<Failure, List<TvModel>>> call(NoParameters parameters) async {
    return await baseTvRepository.getTvTopRated();
  }
}
