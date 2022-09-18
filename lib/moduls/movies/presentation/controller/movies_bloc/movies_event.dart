part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
  @override
  List<Object> get props => [];
}

class GetNowplayingEvent extends MoviesEvent {}

class GetPopularEvent extends MoviesEvent {}

class GetTopRatedgEvent extends MoviesEvent {}
