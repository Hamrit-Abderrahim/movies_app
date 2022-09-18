import 'package:equatable/equatable.dart';

class Recommandation extends Equatable {
  final int id;
  final String backdropPath;

  const Recommandation({required this.id, required this.backdropPath});
  @override
  List<Object?> get props => [id, backdropPath];
}
