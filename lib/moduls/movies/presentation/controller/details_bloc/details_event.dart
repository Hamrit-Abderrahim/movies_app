import 'package:equatable/equatable.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
}

class GetDetailsMoviesEvent extends DetailsEvent {
  final int id;

  const GetDetailsMoviesEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class GetRecommendationEvent extends DetailsEvent {
  final int id;

  const GetRecommendationEvent({required this.id});
  @override
  List<Object> get props => [id];
}
