import 'package:equatable/equatable.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class GetOnTheAirEvent extends TvEvent {}

class GetTvPopularEvent extends TvEvent {}

class GetTvTopRatedEvent extends TvEvent {}
