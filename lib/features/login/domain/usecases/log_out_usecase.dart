import 'package:weight_tracker/core/error/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/usecases/usecases.dart';
import 'package:weight_tracker/features/login/domain/repositories/login_repo.dart';

class LogOutUseCase implements UseCases<void, NoParams> {
  final LoginRepository loginRepository;

  LogOutUseCase({required this.loginRepository});
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return loginRepository.logOut();
  }
}
