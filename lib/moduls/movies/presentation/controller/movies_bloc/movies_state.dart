part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<MoviesModel> nowPlayigMovies;
  final String nowplayinMessage;
  final RequestState nowPlayingState;
  final List<MoviesModel> popularMovies;
  final String popularMessage;
  final RequestState popularState;
  final List<MoviesModel> topRatedMovies;
  final String topRatedMessage;
  final RequestState topRatedState;

  const MoviesState({
    this.nowPlayigMovies = const [],
    this.nowplayinMessage = "",
    this.nowPlayingState = RequestState.loading,
    this.popularMovies = const [],
    this.popularMessage = "",
    this.popularState = RequestState.loading,
    this.topRatedMovies = const [],
    this.topRatedMessage = "",
    this.topRatedState = RequestState.loading,
  });
  MoviesState copyWith({
    List<MoviesModel>? nowPlayigMovies,
    String? nowplayinMessage,
    RequestState? nowPlayingState,
    List<MoviesModel>? popularMovies,
    String? popularMessage,
    RequestState? popularState,
    List<MoviesModel>? topRatedMovies,
    String? topRatedMessage,
    RequestState? topRatedState,
  }) {
    return MoviesState(
      nowPlayigMovies: nowPlayigMovies ?? this.nowPlayigMovies,
      nowplayinMessage: nowplayinMessage ?? this.nowplayinMessage,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMessage: popularMessage ?? this.popularMessage,
      popularState: popularState ?? this.popularState,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedState: topRatedState ?? this.topRatedState,
    );
  }

  @override
  List<Object> get props => [
        nowPlayigMovies,
        nowplayinMessage,
        nowPlayingState,
        popularMovies,
        popularMessage,
        popularState,
        topRatedMovies,
        topRatedMessage,
        topRatedState
      ];
}
