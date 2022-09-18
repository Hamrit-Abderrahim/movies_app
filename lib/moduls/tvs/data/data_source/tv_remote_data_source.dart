import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_model.dart';
import 'package:movies_app/core/network/remote/dio_helper.dart';
import 'package:movies_app/core/utils/constatns_manager.dart';
import 'package:movies_app/moduls/tvs/data/model/tv_details_model.dart';
import 'package:movies_app/moduls/tvs/data/model/tv_episode_model.dart';
import 'package:movies_app/moduls/tvs/data/model/tv_model.dart';
import 'package:movies_app/moduls/tvs/data/model/tv_recommendation_model.dart';
import 'package:movies_app/moduls/tvs/domain/entities/details.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_details_usecase.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_episode_usecas.dart';
import 'package:movies_app/moduls/tvs/domain/use_case/get_tv_recommendation_usecse.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getTvOnTheAir();
  Future<List<TvModel>> getTvPopular();
  Future<List<TvModel>> getTvTopRated();
  Future<DetailsTv> getTvDetails(TvDetailsParameters parameters);
  Future<List<TvREcommendationModel>> getTvRecommendation(
      TvRecommendationPar parameters);
  Future<List<EpisdeModel>> getTvEpisods(TvEpisodePar parameters);
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  //*******************  getTvOnTheAir **************/
  @override
  Future<List<TvModel>> getTvOnTheAir() async {
    final response = await DioHelper.getData(url: AppConstatns.onTheAirUrl);
    if (response!.statusCode == 200) {
      return List<TvModel>.from(
          (response.data["results"] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.formJson(response.data));
    }
  }
//*****************  getTvPopular *********//

  @override
  Future<List<TvModel>> getTvPopular() async {
    final response = await DioHelper.getData(url: AppConstatns.tvPopularUrl);
    if (response!.statusCode == 200) {
      return List<TvModel>.from(
          (response.data["results"] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.formJson(response.data));
    }
  }

//*****************  getTvTopRated *********//
  @override
  Future<List<TvModel>> getTvTopRated() async {
    final response = await DioHelper.getData(url: AppConstatns.tvTopRatedUrl);
    if (response!.statusCode == 200) {
      return List<TvModel>.from(
          (response.data["results"] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.formJson(response.data));
    }
  }
  //*****************  getTvDetails *********//

  @override
  Future<DetailsTv> getTvDetails(TvDetailsParameters parameters) async {
    final response =
        await DioHelper.getData(url: AppConstatns.tvDetailsUrl(parameters.id));
    if (response!.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.formJson(response.data));
    }
  }
  //*****************  gtTvecommendation *********//

  @override
  Future<List<TvREcommendationModel>> getTvRecommendation(
      TvRecommendationPar parameters) async {
    final response = await DioHelper.getData(
        url: AppConstatns.tvReommandation(parameters.tvId));
    if (response!.statusCode == 200) {
      return List<TvREcommendationModel>.from((response.data["results"] as List)
          .map((e) => TvREcommendationModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.formJson(response.data));
    }
  }
  //*****************  getTvEpisods *********//

  @override
  Future<List<EpisdeModel>> getTvEpisods(TvEpisodePar parameters) async {
    final response = await DioHelper.getData(
        url: AppConstatns.tvEpisodes(parameters.id, parameters.tvEpisodes));
    if (response!.statusCode == 200) {
      return List<EpisdeModel>.from((response.data["episodes"] as List)
          .map((e) => EpisdeModel.fromJson(e)));
    } else {
      throw ServerException(errorModel: ErrorModel.formJson(response.data));
    }
  }
}
