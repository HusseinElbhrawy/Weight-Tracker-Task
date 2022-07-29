import 'package:weight_tracker/core/error/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/usecases/usecases.dart';
import 'package:weight_tracker/features/weight/domain/repositories/weight_repo.dart';

class SavedWeightUseCase implements UseCases<dynamic, double> {
  final WeightRepository weightRepository;

  SavedWeightUseCase({required this.weightRepository});
  @override
  Future<Either<Failure, dynamic>> call(double weight) {
    return weightRepository.savedWeight(weight);
  }
}
