import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/error/errors.dart';

abstract class WeightRepository {
  Future<Either<Failure, DocumentReference<Map<String, dynamic>>>> savedWeight(
      double weight);
  Future<Either<Failure, Future<void>>> DeletedWeight(String docsId);
  Future<Either<Failure, Future<void>>> UpdateWeight(
      String docsId, double newWeight);
}
