import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String messgae;

  const Failure(this.messgae);
  @override
  List<Object?> get props => [messgae];
}

class ServerFailure extends Failure {
  const ServerFailure(super.messgae);
}

class LocalFailure extends Failure {
  const LocalFailure(super.messgae);
}
