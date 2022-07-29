import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class FetchDataFailure extends Failure {}

class BadRequestFailure extends Failure {}

class UnauthorizedFailure extends Failure {}

class NotFoundFailure extends Failure {}

class ConflictFailure extends Failure {}

class InternalServerErrorFailure extends Failure {}

class NoInternetConnectionFailure extends Failure {}

class CachedFailure extends Failure {}

class UnExpectedFailure extends Failure {}
