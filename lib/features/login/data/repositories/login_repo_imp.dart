import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/error/errors.dart';
import 'package:weight_tracker/features/login/data/datasources/login_remote_datasource.dart';
import 'package:weight_tracker/features/login/domain/repositories/login_repo.dart';

class LoginRepositoryImplementation implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  LoginRepositoryImplementation({
    required this.loginRemoteDataSource,
  });
  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      final response = await loginRemoteDataSource.logOut();
      return Right(response);
    } on FirebaseAuthException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInAnonymous() async {
    try {
      final response = await loginRemoteDataSource.signInAnonymous();
      return Right(response);
    } on FirebaseAuthException {
      return Left(ServerFailure());
    } catch (o) {
      return Left(o as ServerFailure);
    }
  }
}
