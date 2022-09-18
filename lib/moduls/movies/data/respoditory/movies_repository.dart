import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/moduls/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app/moduls/movies/domain/entities/movies_details.dart';
import 'package:movies_app/moduls/movies/domain/entities/recommandation.dart';
import 'package:movies_app/moduls/movies/domain/respository/base_movies_repository.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_movies_details_usecase.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_recommandation_usecase.dart';

import '../model/movies_model.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  MoviesRepository(this.baseRemoteDataSource);
  //********getNowPlayingMovies */
  @override
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies() async {
    final result = await baseRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorModel.statusMessage));
    }
  }

//***********************getPopularMovies */
  @override
  Future<Either<Failure, List<MoviesModel>>> getPopularMovies() async {
    final result = await baseRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorModel.statusMessage));
    }
  }

//******************getTopRatedMovies */
  @override
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies() async {
    final result = await baseRemoteDataSource.getopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorModel.statusMessage));
    }
  }
//******************getMoviesDetails **************//

  @override
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(
      MoviesDetailsParameters parameters) async {
    final result = await baseRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorModel.statusMessage));
    }
  }

//******************getRecommandation **************//
  @override
  Future<Either<Failure, List<Recommandation>>> getRecommandation(
      RecommandationParameters parameters) async {
    final result = await baseRemoteDataSource.getRecomandation(parameters);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorModel.statusMessage));
    }
  }
}
