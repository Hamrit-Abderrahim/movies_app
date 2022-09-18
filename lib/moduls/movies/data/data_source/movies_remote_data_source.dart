import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_model.dart';
import 'package:movies_app/core/network/remote/dio_helper.dart';
import 'package:movies_app/moduls/movies/data/model/movies_details_model.dart';
import 'package:movies_app/moduls/movies/data/model/movies_model.dart';
import 'package:movies_app/moduls/movies/data/model/recommandation_model.dart';
import 'package:movies_app/moduls/movies/domain/entities/movies_details.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_movies_details_usecase.dart';
import 'package:movies_app/moduls/movies/domain/usecase/get_recommandation_usecase.dart';

import '../../../../core/utils/constatns_manager.dart';

abstract class BaseRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getopRatedMovies();
  Future<MoviesDetails> getMovieDetails(MoviesDetailsParameters parameters);
  Future<List<RecommandationModel>> getRecomandation(
      RecommandationParameters parameters);
}

class MoviesRemoteDataSource extends BaseRemoteDataSource {
  @override
  //**************** getNowPlayingMovies*************//
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await DioHelper.getData(url: AppConstatns.nowPlayingUrl);
    if (response!.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.formJson(response.data));
    }
  }

//*************** getPopularMovies *************//
  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await DioHelper.getData(url: AppConstatns.popularUrl);

    if (response!.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.formJson(response.data));
    }
  }

//**************getopRatedMovies ****************//
  @override
  Future<List<MoviesModel>> getopRatedMovies() async {
    final response = await DioHelper.getData(url: AppConstatns.topRatedUrl);

    if (response!.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.formJson(response.data));
    }
  }
  //**************getopRatedMovies *********//

  @override
  Future<MoviesDetails> getMovieDetails(
      MoviesDetailsParameters parameters) async {
    final response =
        await DioHelper.getData(url: AppConstatns.detailsUrl(parameters.id));

    if (response!.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.formJson(response.data));
    }
  }
  //**************getRecomandation *********//

  @override
  Future<List<RecommandationModel>> getRecomandation(
      RecommandationParameters parameters) async {
    final response =
        await DioHelper.getData(url: AppConstatns.reommandation(parameters.id));
    if (response!.statusCode == 200) {
      return List.from(
        (response.data["results"] as List)
            .map((e) => RecommandationModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorModel: ErrorModel.formJson(response.data));
    }
  }
}
