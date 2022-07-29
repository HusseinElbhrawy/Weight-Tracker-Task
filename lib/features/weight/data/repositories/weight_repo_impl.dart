import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker/core/error/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/features/weight/data/datasources/weight_remote_datasouce.dart';
import 'package:weight_tracker/features/weight/domain/repositories/weight_repo.dart';

class WeightRepositoryImplementation implements WeightRepository {
  final WeightRemoteDataSource weightRemoteDataSource;

  WeightRepositoryImplementation({required this.weightRemoteDataSource});
  @override
  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>> savedWeight(
      double weight) async {
    try {
      final response = await weightRemoteDataSource.saveWeight(weight);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Future<void>>> DeletedWeight(String docsId) async {
    try {
      final response = weightRemoteDataSource.deleteWeight(docsId);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Future<void>>> UpdateWeight(
      String docsId, double newWeight) async {
    try {
      final response = weightRemoteDataSource.updateWeight(docsId, newWeight);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
