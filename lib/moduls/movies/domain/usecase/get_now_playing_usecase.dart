import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/moduls/movies/data/model/movies_model.dart';
import 'package:movies_app/moduls/movies/domain/respository/base_movies_repository.dart';

import '../../../../core/error/failure.dart';

class GetNowPlayingUseCases
    extends BaseUseCases<List<MoviesModel>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingUseCases(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MoviesModel>>> call(
      NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
