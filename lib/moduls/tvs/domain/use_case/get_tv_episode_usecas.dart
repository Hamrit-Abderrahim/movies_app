import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/moduls/tvs/domain/entities/episode.dart';
import 'package:movies_app/moduls/tvs/domain/respository/base_tv_repository.dart';

class GetTvEpisodesUseCase extends BaseUseCases<List<Episodes>, TvEpisodePar> {
  final BaseTvRepository baseTvRepository;

  GetTvEpisodesUseCase(this.baseTvRepository);
  @override
  Future<Either<Failure, List<Episodes>>> call(TvEpisodePar parameters) async {
    return baseTvRepository.getEpisode(parameters);
  }
}

class TvEpisodePar extends Equatable {
  final int id;
  final int tvEpisodes;

  const TvEpisodePar({required this.id, required this.tvEpisodes});

  @override
  List<Object?> get props => [id, tvEpisodes];
}
