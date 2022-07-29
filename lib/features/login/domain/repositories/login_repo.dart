import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracker/core/error/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserCredential>> signInAnonymous();
  Future<Either<Failure, void>> logOut();
}
