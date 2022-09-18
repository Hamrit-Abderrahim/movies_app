import 'package:equatable/equatable.dart';

class Episodes extends Equatable {
  final String airDate;
  final int id;
  final String name;
  final String overview;
  final String stillPath;

  const Episodes(
      {required this.airDate,
      required this.id,
      required this.name,
      required this.overview,
      required this.stillPath});

  @override
  List<Object?> get props => [
        airDate,
        id,
        name,
        overview,
        stillPath,
      ];
}
