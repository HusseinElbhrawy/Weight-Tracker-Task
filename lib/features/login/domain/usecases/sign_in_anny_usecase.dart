import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/error/errors.dart';
import 'package:weight_tracker/core/usecases/usecases.dart';
import 'package:weight_tracker/features/login/domain/repositories/login_repo.dart';

class SignInAnonymousUseCase implements UseCases<UserCredential, NoParams> {
  final LoginRepository loginRepository;

  SignInAnonymousUseCase({required this.loginRepository});
  @override
  Future<Either<Failure, UserCredential>> call(NoParams params) {
    return loginRepository.signInAnonymous();
  }
}
