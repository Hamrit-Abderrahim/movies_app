import 'package:get_it/get_it.dart';
import 'package:movies_app/moduls/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app/moduls/movies/data/respoditory/movies_repository.dart';
import 'package:movies_app/moduls/movies/domain/respository/base_movies_repository.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_movies_details_usecase.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_popular_usecase.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_recommandation_usecase.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_top_rated.usecase.dart';
import 'package:movies_app/moduls/movies/presentation/controller/details_bloc/details_bloc.dart';
import 'package:movies_app/moduls/tvs/data/data_source/tv_remote_data_source.dart';
import 'package:movies_app/moduls/tvs/data/repository/tv_repository.dart';
import 'package:movies_app/moduls/tvs/domain/respository/base_tv_repository.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_on_the_air_usecas.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_details_usecase.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_episode_usecas.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_popular_usecase.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_recommendation_usecse.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_top_rated_usecase.dart';
import 'package:movies_app/moduls/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:movies_app/moduls/tvs/presentation/controller/tv_details_bloc/tv_details_bloc.dart';

import '../../moduls/movies/presentation/controller/movies_bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //**********************Movies Moduls *************************************/
    //******bloc ***********/
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => DetailsBloc(sl(), sl()));
    //*******userCase *******/
    sl.registerLazySingleton(() => GetNowPlayingUseCases(sl()));
    sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularUseCases(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUSeCases(sl()));
    sl.registerLazySingleton(() => GetRecommandationUseCase(sl()));

    //*******repository **********//
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));
    //******dataSource*******/
    sl.registerLazySingleton<BaseRemoteDataSource>(
        () => MoviesRemoteDataSource());

//**********************Movies Moduls *************************************/
//*****************bloc **************//
    sl.registerFactory(() => TvBloc(sl(), sl(), sl()));
    sl.registerFactory(() => TvDetailsBloc(sl(), sl(), sl()));
//*****************useCase *****************/
    sl.registerLazySingleton(() => GetOnTheAirUseCase(sl()));
    sl.registerLazySingleton(() => GetTvPopulrUseCase(sl()));
    sl.registerLazySingleton(() => GetTvTopRatedUseCase(sl()));
    sl.registerLazySingleton(() => GetTvDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetTvREcommendationUSeCase(sl()));
    sl.registerLazySingleton(() => GetTvEpisodesUseCase(sl()));
//*******respositry******* *//
    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));
//*****************dataSource *********************//
    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());
  }
}
