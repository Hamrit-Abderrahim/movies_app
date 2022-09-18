import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/moduls/movies/domain/entities/movies_details.dart';
import 'package:movies_app/moduls/movies/domain/respository/base_movies_repository.dart';

class GetMoviesDetailsUSeCases
    extends BaseUseCases<MoviesDetails, MoviesDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetailsUSeCases(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MoviesDetails>> call(
      MoviesDetailsParameters parameters) async {
    return await baseMoviesRepository.getMoviesDetails(parameters);
  }
}

class MoviesDetailsParameters extends Equatable {
  final int id;

  const MoviesDetailsParameters({required this.id});

  @override
  List<Object?> get props => [id];
}
