import 'end_poinst.dart';

class AppConstatns {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "bd228e884dd3c9e5a90045bf6e43da3c";
  static String imageUrl(String url) => "https://image.tmdb.org/t/p/w500$url";
  static const String nowPlayingUrl = "${EndPoints.nowPlaying}?api_key=$apiKey";
  static const String topRatedUrl = "${EndPoints.topRated}?api_key=$apiKey";
  static const String popularUrl = "${EndPoints.popular}?api_key=$apiKey";
  static String detailsUrl(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  static String reommandation(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  //*****************tv************//
  static const String onTheAirUrl = "${EndPoints.onTheAir}?api_key=$apiKey";
  static const String tvPopularUrl = "${EndPoints.popularTv}?api_key=$apiKey";
  static const String tvTopRatedUrl = "${EndPoints.topRatedtv}?api_key=$apiKey";
  static String tvDetailsUrl(int movieId) =>
      "$baseUrl/tv/$movieId?api_key=$apiKey";

  static String tvReommandation(int movieId) =>
      "$baseUrl/tv/$movieId/recommendations?api_key=$apiKey";
  static String tvEpisodes(int movieId, int nbseason) =>
      "$baseUrl/tv/$movieId/season/$nbseason?api_key=$apiKey";
}
