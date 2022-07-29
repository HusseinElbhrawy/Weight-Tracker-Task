import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weight_tracker/core/error/errors.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
