import 'package:dartz/dartz.dart';
import 'package:movies_app/moduls/movies/domain/entities/movies_details.dart';
import 'package:movies_app/moduls/movies/domain/entities/recommandation.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_movies_details_usecase.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_recommandation_usecase.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/movies_model.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies();
  Future<Either<Failure, List<MoviesModel>>> getPopularMovies();
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(
      MoviesDetailsParameters parameters);
  Future<Either<Failure, List<Recommandation>>> getRecommandation(
      RecommandationParameters parameters);
}
